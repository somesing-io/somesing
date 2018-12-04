package com.somesing.util;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.somesing.www.model.LoginVO;

public class SessionUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(SessionUtil.class);
	
	public String getUserId(){
		SecurityContext context = SecurityContextHolder.getContext();
        
		if (context == null)
            return "anonymousUser";

        Authentication authentication = context.getAuthentication();
        if (authentication == null)
            return "anonymousUser";
        
        if(authentication.getPrincipal() instanceof LoginVO) {
        	LoginVO sessionVO = (LoginVO) authentication.getPrincipal();
        	return sessionVO.getEmail();
        } else {
        	return "anonymousUser";
        }
	}
	
	public boolean isLogin(){
		String principal = getUserId();
		
		if((principal != null && !"".equals(principal) && !"anonymousUser".equals(principal))){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean isUser(){
		return hasRole("ROLE_USER");
	}
	
	/*public String getLocale(){
		
		String locale = "KR";
		
		if(isLogin()){
			AdmLoginVO loginVO = (AdmLoginVO) getLoginInfo();
			logger.debug("loginVO : "+loginVO);
			
			if(loginVO != null){
				locale = StringUtils.defaultIfEmpty(loginVO.getLocale(), "KR");
			}
		}
		return locale;
	}*/
	
	public Object getLoginInfo(){
		
		SecurityContext context = SecurityContextHolder.getContext();
        
		if (context == null)
            return null;

        Authentication authentication = context.getAuthentication();
        if (authentication == null)
            return null;
        
        Object obj = authentication.getPrincipal();
        return obj;
	}
	
	public boolean hasAnyRole(List<String> role){
		
		boolean result = false;
		
		if(role != null && role.size() > 0){
			for(String str : role){
				if(hasRole(str)){
					result = true;
					break;
				}
			}
		}
		return result;
	}
	
	public boolean hasRole(String role) {
        // get security context from thread local
        SecurityContext context = SecurityContextHolder.getContext();
        if (context == null)
            return false;

        Authentication authentication = context.getAuthentication();
        if (authentication == null)
            return false;

        for (GrantedAuthority auth : authentication.getAuthorities()) {
            if (role.equals(auth.getAuthority()))
                return true;
        }
        return false;
    }
}
	