package com.somesing.config.security;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.somesing.util.JsonUtil;
import com.somesing.www.common.service.HttpService;
import com.somesing.www.model.LoginVO;
import com.somesing.www.user.service.LoginService;

public class SomesingAuthenticationProvider implements AuthenticationProvider{

	private static final Logger logger = LoggerFactory.getLogger(SomesingAuthenticationProvider.class);
	
	private LoginService loginService;
	private PasswordEncoder passwordEncoder;
	
	@Value("${captcha.url}")
	private String captchaUrl = "";
	
	@Value("${captcha.secret.key}")
	private String captchaSecretKey = "";
	
	@Autowired
	private HttpService httpService;
	
	public void setUserDetailService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	public void passwordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String user_id = (String)authentication.getPrincipal();		
		String user_pw = (String)authentication.getCredentials();
		
		String[] userarray = user_id.split("\\|");
		
		if(userarray.length != 2) {
			logger.info("CAPTCHA LENGTH ERROR");
			throw new BadCredentialsException("CAPTCHA"); 
		}
		
		String[] array = user_id.split("\\|");
		String id = array[0];
		
		LoginVO loginVO = loginService.loadUserByUsername(id);
		
		if (loginVO == null) {
			logger.error("Username not found");
			throw new BadCredentialsException("FIELD"); 
		}
		
		if(!passwordEncoder.matches(user_pw, loginVO.getPassword())){
			logger.error("password different.");
			throw new BadCredentialsException("FIELD"); 
		}
		
		if(!"Y".equals(loginVO.getEmailYn())) {
			// 이메일 에러 발생
			logger.error("email N");
			throw new BadCredentialsException("EMAIL_YN"); 
		}
		
		try {
			// 캡챠 서버 사이트 확인
			Map<String, String> map = new HashMap<>();
			map.put("secret", captchaSecretKey);
			map.put("response", array[1]);
			
			String captchaResult = httpService.httpConnect(captchaUrl, map);
			Map<String, Object> captchaMap = JsonUtil.jsonToObject(captchaResult);
			
			if(!"true".equals(MapUtils.getString(captchaMap, "success"))) {
				throw new BadCredentialsException("CAPTCHA"); 
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new BadCredentialsException("CAPTCHA"); 
		}
		
        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(loginVO, loginVO.getPassword(), loginVO.getAuthorities());
        return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
