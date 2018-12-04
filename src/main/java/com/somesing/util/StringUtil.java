package com.somesing.util;

import java.io.FileInputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

public class StringUtil {

	private static final Logger logger = LoggerFactory.getLogger(StringUtil.class);
	
	public static String tokenGenerate() throws Exception{
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
	}
	
	/** 
	 * '_' 가 나타나지 않으면 이미 camel case 로 가정함.
	 * 단 첫째문자가 대문자이면 camel case 변환 (전체를 소문자로) 처리가
	 * 필요하다고 가정함. --> 아래 로직을 수행하면 바뀜
	 * @param underScore
	 * @return
	 */
	public static String convert2CamelCase(String underScore) {
		
		if (underScore.indexOf('_') < 0 && Character.isLowerCase(underScore.charAt(0))) {
            return underScore;
        }

        StringBuilder result = new StringBuilder();
        boolean nextUpper = false;
        int len = underScore.length();

        for (int i = 0; i < len; i++) {
            char currentChar = underScore.charAt(i);

            if (currentChar == '_') {
                nextUpper = true;
            } else {
                if (nextUpper) {
                    result.append(Character.toUpperCase(currentChar));
                    nextUpper = false;
                } else {
                    result.append(Character.toLowerCase(currentChar));
                }
            }
        }
        return result.toString();
    }
	
	public static String disconvert2CamelCase(String underScore) {
		
        StringBuilder result = new StringBuilder();
        int len = underScore.length();

        for (int i = 0; i < len; i++) {
            char currentChar = underScore.charAt(i);

            if(Character.isUpperCase(currentChar)){
            	result.append("_");
            	result.append(Character.toUpperCase(currentChar));
            }else{
            	result.append(Character.toUpperCase(currentChar));
            }
        }
        return result.toString();
    }
	
	public static boolean isInteger(String s) {
	    try {
	    	Integer.parseInt(s);
	        return true;
	    } catch (NumberFormatException e) {
	        return false;
	    }
	}
	
	public String getDomainURL(HttpServletRequest request){
		
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme());
		sb.append("://");
		sb.append(request.getServerName());
		
		if(request.getServerPort() != 80 && request.getServerPort() != 443){
			sb.append(":");
			sb.append(request.getServerPort());
		}
		
		return sb.toString();
	}
	
	public static Map<String, Object> countryLoad() throws Exception{
		
		Properties properties = new Properties();
		ClassPathResource resource = new ClassPathResource("/country/country.properties");
		properties.load(new FileInputStream(resource.getFile()));
		Map<String, Object> map = new LinkedHashMap<>();
		
		for(String key : properties.stringPropertyNames()) {
			 map.put(key, properties.getProperty(key));
		}
		return map;
	}
	
	public static String getCountry(String key) throws Exception{
		Properties properties = new Properties();
		ClassPathResource resource = new ClassPathResource("/country/country.properties");
		properties.load(new FileInputStream(resource.getFile()));
		return properties.getProperty(key);
	}
	
}
