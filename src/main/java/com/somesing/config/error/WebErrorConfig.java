package com.somesing.config.error;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebErrorConfig implements ErrorController{
	
	private static final Logger logger = LoggerFactory.getLogger(WebErrorConfig.class);
	
	private final String PATH = "error";
	
	@RequestMapping(value = PATH)
	public String error(HttpServletRequest request){
		
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

	    if (String.valueOf(status).equalsIgnoreCase(HttpStatus.NOT_FOUND.toString())) {
	    	return "error/404";
	    }
	    return "error/500";
	} 

	@Override
	public String getErrorPath() {
		return PATH;
	}
}
