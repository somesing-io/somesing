package com.somesing.util;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LocaleUtil {

	private static final Logger logger = LoggerFactory.getLogger(LocaleUtil.class);
	
	public static Locale getLocale(HttpServletRequest request) {
		SessionLocaleResolver sessionLocaleResolver = (SessionLocaleResolver) RequestContextUtils.getLocaleResolver(request);
		Locale locale = sessionLocaleResolver.resolveLocale(request);

        if (locale == null ) {
            locale = getDefaultLocale();
        }
        return locale;
	}
	
	public static void setLocale(HttpServletRequest request, HttpServletResponse response) {
		
		String lang = StringUtils.defaultString(request.getParameter("lang"), "");
		
		logger.info("lang : {}", lang);
		
		if(!StringUtils.isEmpty(lang)){
			SessionLocaleResolver sessionLocaleResolver = (SessionLocaleResolver) RequestContextUtils.getLocaleResolver(request);
			
			if("kor".equalsIgnoreCase(lang)){
				sessionLocaleResolver.setLocale(request, response, Locale.KOREA);
			} else {
				sessionLocaleResolver.setLocale(request, response, Locale.US);
			}
		}
	}
	
	public static String getLocaleStr(HttpServletRequest request) {
		SessionLocaleResolver sessionLocaleResolver = (SessionLocaleResolver) RequestContextUtils.getLocaleResolver(request);
		Locale locale = sessionLocaleResolver.resolveLocale(request);

        if (locale == null ) {
            locale = getDefaultLocale();
        }
        
		if(locale.equals(Locale.KOREAN) || locale.equals(Locale.KOREA)) {
			return "kor";
		} else if(locale.equals(Locale.US)) {
			return "eng";
		} else {
			return "kor";
		}
	}
	
	public static Locale getDefaultLocale() {
		return Locale.KOREAN;
	}
}
