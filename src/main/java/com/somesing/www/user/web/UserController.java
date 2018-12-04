package com.somesing.www.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somesing.util.DateUtil;
import com.somesing.util.JsonUtil;
import com.somesing.util.LocaleUtil;
import com.somesing.util.SessionUtil;
import com.somesing.util.StringUtil;
import com.somesing.www.common.service.CommonService;
import com.somesing.www.common.service.HttpService;
import com.somesing.www.common.service.MailService;
import com.somesing.www.common.web.CommonController;
import com.somesing.www.common.web.Constant.ServiceResult;
import com.somesing.www.main.web.MainController;
import com.somesing.www.model.UserVO;
import com.somesing.www.user.service.UserService;

@Controller
public class UserController extends CommonController{
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private HttpService httpService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	public PasswordEncoder passwordEncoder;
	
	@Value("${captcha.url}")
	private String captchaUrl = "";
	
	@Value("${captcha.site.key}")
	private String captchaSiteKey = "";
	
	@Value("${captcha.secret.key}")
	private String captchaSecretKey = "";
	
	@RequestMapping("/user/login")
	public String login(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		model.addAttribute("captchaSiteKey", captchaSiteKey);
		
		String loginFail = (String) request.getParameter("loginFail");
		String captchaFail = (String) request.getParameter("captchaFail"); 

		if(!StringUtils.isEmpty(loginFail)) {
			model.addAttribute("loginFail", "loginFail");
		}
		
		if(!StringUtils.isEmpty(captchaFail)) {
			model.addAttribute("captchaFail", "captchaFail");
		}
		return returnURL(request, response, device, "/user/login");
	}
	
	@RequestMapping("/user/login/success")
	public String loginSuccess(ModelMap model) throws Exception{
		
		SessionUtil session = new SessionUtil();
		
		// 로그인 시간 업데이트
		userService.updateLoginDt(session.getUserId());
		return "redirect:/index";
	}
	
	@RequestMapping("/user/logout/success")
	public String logoutSuccess(ModelMap model) throws Exception{
		return "redirect:/index";
	}
	
	@RequestMapping("/user/loginConfirm")
	public String loginConfirm(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		model.addAttribute("email", request.getAttribute("email"));
		return returnURL(request, response, device, "/user/login-confirm");
	}
	
	@RequestMapping("/user/login/send/mail")
	public String loginSendMail(@RequestParam(name="email") String email,
			Device device, ModelMap model) throws Exception{
		
		// 유저 조회해서 토큰 가져와야함
		UserVO userVO = userService.userView(email);
		mailService.mailSender("REGIST",  userVO.getEmailCode(), userVO.getEmail(), "");
		
		model.addAttribute("email", email);
		return "forward:/user/signConfirm";
	}
	
	@RequestMapping("/user/signUp")
	public String signUp(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		Map<String, Object> countryList = StringUtil.countryLoad();
		model.addAttribute("countryList", countryList);
		model.addAttribute("captchaSiteKey", captchaSiteKey);
		return returnURL(request, response, device, "/user/sign-up", model);
	}
	
	@RequestMapping("/user/signUp/userCheck")
	@ResponseBody
	public Map<String, Object> userCheck(@RequestParam(name="email", required=false) String email, 
			ModelMap model) throws Exception{
		
		if(StringUtils.isEmpty(email)) {
			return getServiceResult(ServiceResult.FAIL);
		}
		
		int checkCount = userService.userCheck(email);
		
		if(checkCount > 0) {
			return getServiceResult(ServiceResult.FAIL);
		} else {
			return getServiceResult(ServiceResult.SUCCESS);
		}
	}
	
	@RequestMapping("/user/signUp/insert")
	@ResponseBody
	public Map<String, Object> insertSignUp(@Valid UserVO userVO, BindingResult bindingResult,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		try {
			if(bindingResult.hasErrors()){
				logger.error("Validation Check Error : "+bindResultField(bindingResult));
				return getServiceResult(ServiceResult.FAIL, "FIELD_ERROR", bindResultField(bindingResult));
			}
			
			// 이메일 중복확인
			int checkCount = userService.userCheck(userVO.getEmail());
			
			if(checkCount > 0) {
				return getServiceResult(ServiceResult.FAIL, "EMAIL_OVERLAP");
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("secret", captchaSecretKey);
			map.put("response", userVO.getCaptchaVal());
			
			// 캡챠 서버 사이트 확인
			String captchaResult = httpService.httpConnect(captchaUrl, map);
			Map<String, Object> captchaMap = JsonUtil.jsonToObject(captchaResult);
			
			if("true".equals(MapUtils.getString(captchaMap, "success"))) {
				logger.info("userVO  :  "+userVO);
				
				userVO.setEmailCode(StringUtil.tokenGenerate()); // 이메일 인증시 사용할 토큰 생성
				int result = userService.insertUser(userVO);
				
				if(result > 0) {
					mailService.mailSender("REGIST",  userVO.getEmailCode(), userVO.getEmail(), "");
					return getServiceResult(ServiceResult.SUCCESS, "", userVO.getEmail());
				} else {
					return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
				}
			} else {
				return getServiceResult(ServiceResult.FAIL, "CAPTCHA_ERROR");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
		}
	}
	
	@RequestMapping("/user/signConfirm")
	public String signConfirm(@RequestParam(name="email", required=false) String email,
			HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		model.addAttribute("email", email);
		return returnURL(request, response, device, "/user/sign-confirm");
	}
	
	@RequestMapping("/user/send/email")
	@ResponseBody
	public Map<String, Object> sendEmail(@RequestParam(name="email", required=false) String email,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		try {
			if(StringUtils.isEmpty(email)) {
				return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
			}
			
			// 유저 조회해서 토큰 가져와야함
			UserVO userVO = userService.userView(email);
			
			if(userVO == null) {
				return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
			}
			
			mailService.mailSender("REGIST",  userVO.getEmailCode(), userVO.getEmail(), "");
			return getServiceResult(ServiceResult.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
		}
	}
	
	@RequestMapping("/user/email/code/update")
	public String updateEmailCode(@RequestParam(name="emailCode", required=false) String emailCode,
			HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		int isError = 0;
		String errorMsg = "";
		
		LocaleUtil.setLocale(request, response);
		boolean isMobile = commonService.detectDevice(device);
		UserVO userVO = null;
		
		try {
			if(StringUtils.isEmpty(emailCode)) {
				throw new Exception("EMAIL CODE NULL");
			}
			
			userVO = userService.userViewByEmailCode(emailCode);
			
			if(userVO == null) throw new Exception("USERVO IS NULL");
			
			// 만료기한 체크
			if(DateUtil.dateTodayDiff(userVO.getMailSendDt(), 7)) {
				isError = 1;
				errorMsg = getMessage("sign-finish-error.not.date.auth", request);
			} else {
				int result = userService.updateEmailYn(emailCode);
				
				if(result <= 0) {
					throw new Exception("UPDATE ERROR");
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			isError = 2;
			errorMsg = getMessage("sign-finish-error.error.emailCode", request);
		}
		
		if(isError > 0) {
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("email", userVO.getEmail());
			
			if(isMobile) {
				return "/mw/"+LocaleUtil.getLocaleStr(request)+"/user/sign-finish-error";
			} else {
				return "/web/"+LocaleUtil.getLocaleStr(request)+"/user/sign-finish-error";
			}
		} else {
			if(isMobile) {
				return "/mw/"+LocaleUtil.getLocaleStr(request)+"/user/sign-finish";
			} else {
				return "/web/"+LocaleUtil.getLocaleStr(request)+"/user/sign-finish";
			}
		}
	}
	
	@RequestMapping("/user/login/pw/request")
	public String loginPwRequest(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		return returnURL(request, response, device, "/user/login-pw-request");
	}
	
	@RequestMapping("/user/login/pw/confirm")
	public String loginPwConfirm(@RequestParam(name="email") String email, 
			HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		if(StringUtils.isEmpty(email)) {
			logger.error("email is null");
			throw new Exception("email is null");
		}
		
		UserVO userVO = userService.userView(email);
		
		if(userVO == null) {
			logger.error("userVO is null");
			throw new Exception("userVO is null");
		}
		
		// 메일 발송
		mailService.mailSender("PASSWD",  userVO.getEmailCode(), userVO.getEmail(), "");
		return returnURL(request, response, device, "/user/login-pw-confirm");
	}
	
	@RequestMapping("/user/login/pw/reset")
	public String loginPwReset(@RequestParam(name="emailCode", required= false) String emailCode, 
			HttpServletRequest request, HttpServletResponse response,  
			Device device, ModelMap model) throws Exception{
		
		model.addAttribute("emailCode", emailCode);
		return returnURL(request, response, device, "/user/login-pw-reset");
	}
	

	@RequestMapping("/user/login/pw/update")
	@ResponseBody
	public Map<String, Object> updateLoginPw(
			@RequestParam(name="emailCode", required=false) String emailCode, 
			@RequestParam(name="passwd", required=false) String passwd, ModelMap model) throws Exception{
		
		try {
			if(StringUtils.isEmpty(passwd)) {
				return getServiceResult(ServiceResult.FAIL, "FIELD_ERROR", "passwd");
			}
			
			String passwdPattern = "^([a-zA-Z]|[!@#$%^*()\\\\-_=+\\\\\\\\\\\\|\\\\[\\\\]{};:\\\\'\\\",.<>\\\\/?]|[0-9]){8,20}$";
			
			if(!Pattern.matches(passwdPattern, passwd)) {
				return getServiceResult(ServiceResult.FAIL, "FIELD_ERROR", "passwd");
			}
			
			if(StringUtils.isEmpty(emailCode)) {
				return getServiceResult(ServiceResult.FAIL, "EMAIL_CODE_NULL");
			}
			
			int result = userService.updateLoginPw(emailCode, passwordEncoder.encode(passwd));
			
			if(result > 0) {
				return getServiceResult(ServiceResult.SUCCESS);
			} else {
				return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
			}
		} catch(Exception e) {
			e.printStackTrace();
			return getServiceResult(ServiceResult.FAIL, "INTERVAL_SERVER_ERROR");
		}
	}
	
	
	@RequestMapping("/user/login/pw/finish")
	public String loginPwFinish(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		return returnURL(request, response, device, "/user/login-pw-finish");
	}
}
