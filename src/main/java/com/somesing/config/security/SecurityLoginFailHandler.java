package com.somesing.config.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


public class SecurityLoginFailHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String failStr = StringUtils.defaultString(exception.getMessage(), "");
		String failUrl = "";
		
		if("EMAIL_YN".equals(failStr)) {
			request.setAttribute("email", request.getParameter("login_id"));
			failUrl = "/user/loginConfirm";
		} else if("CAPTCHA".equals(failStr)) {
			failUrl = "/user/login?captchaFail=captchaFail";
		} else {
			failUrl = "/user/login?loginFail=loginFail";
		}
		
		request.getRequestDispatcher(failUrl).forward(request, response);
	}
	

}
