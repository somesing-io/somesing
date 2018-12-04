package com.somesing.www.main.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somesing.util.LocaleUtil;
import com.somesing.www.common.service.CommonService;
import com.somesing.www.common.service.MailService;
import com.somesing.www.common.web.CommonController;
import com.somesing.www.common.web.Constant.ServiceResult;

@Controller
public class MainController extends CommonController{
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/")
	public String index() throws Exception{
		return "redirect:/index";
	}
	
	@RequestMapping("/index")
	public String main(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		return returnURL(request, response, device, "/index");
	}
	
	/*
	 * 현재 연결페이지 없음
	 * 
	 * @RequestMapping("/index-logout")
	public String indexLogout(Device device, ModelMap model) throws Exception{
		
		boolean isMobile = commonService.detectDevice(device);
		
		if(isMobile) {
			return "/web/index-logout";
		} else {
			return "/web/index-logout";
		}
	}*/
	
	@RequestMapping("/agreePrivacy")
	public String agreePrivacy(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		LocaleUtil.setLocale(request, response);
		boolean isMobile = commonService.detectDevice(device);
		
		if(isMobile) {
			return "/mw/"+LocaleUtil.getLocaleStr(request)+"/agree-privacy";
		} else {
			return "/web/"+LocaleUtil.getLocaleStr(request)+"/agree-privacy";
		}
	}
	
	@RequestMapping("/agreeTerms")
	public String agreeTerms(HttpServletRequest request, HttpServletResponse response, 
			Device device, ModelMap model) throws Exception{
		
		return returnURL(request, response, device, "/agree-terms");
	}
	
	@RequestMapping("/email/send")
	@ResponseBody
	public Map<String, Object> sendEmail(@RequestParam Map<String, Object> map, HttpServletRequest request, ModelMap model) throws Exception{
		
		logger.info("map : "+map);
		
		String email = StringUtils.defaultString((String) map.get("email"), "");
		String name = StringUtils.defaultString((String) map.get("name"), "");
		String message = StringUtils.defaultString((String) map.get("message"), "");
		
		if(StringUtils.isEmpty(email)) {
			logger.error("/email/send : email is null");
			return getServiceResult(ServiceResult.FAIL);
		}
		
		if(StringUtils.isEmpty(name)) {
			logger.error("/email/send : name is null");
			return getServiceResult(ServiceResult.FAIL);
		}
		
		if(StringUtils.isEmpty(message)) {
			logger.error("/email/send : message is null");
			return getServiceResult(ServiceResult.FAIL);
		}
		
		try {
			mailService.mailSender("CONTACTUS",  message, email, name);
			return getServiceResult(ServiceResult.SUCCESS);
			
		} catch(Exception e) {
			e.printStackTrace();
			return getServiceResult(ServiceResult.FAIL);
		}
	}
	
	
}
