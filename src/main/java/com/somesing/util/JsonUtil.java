package com.somesing.util;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

	private static final Logger logger = LoggerFactory.getLogger(JsonUtil.class);
	
	private static ObjectMapper mapper = new ObjectMapper();
	
	public static String objectToJson(Object obj) throws Exception {
		return mapper.writeValueAsString(obj);
	}
	
	public static <T> T jsonToObject(String jsonString) throws Exception {
		return mapper.readValue(jsonString, new TypeReference<T>(){});
	}
	
	public static String jsonStrRemove(String str) {
		return str.replaceAll("\"", "");
	}
	
	public static String removeEscape(String str) {
		Pattern evilChars = Pattern.compile("[-#()@;=*/+]");
		str = evilChars.matcher(str).replaceAll("");
		return str;
	}
}
