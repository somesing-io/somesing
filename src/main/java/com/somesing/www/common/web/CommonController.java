package com.somesing.www.common.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.somesing.util.LocaleUtil;
import com.somesing.www.common.service.CommonService;
import com.somesing.www.common.web.Constant.ServiceResult;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private CommonService commonService;
	
	protected List<String> bindResultField(BindingResult bindingResult){
		
		List<String> array = null;
		
		if(bindingResult.hasErrors()){
			array = new ArrayList<>();
			
			List<FieldError> list = bindingResult.getFieldErrors();
	        for (FieldError e : list) {
	        	array.add(e.getField());
	        }
		}
		return array;
	}
	
	protected List<String> bindResultStr(BindingResult bindingResult){
		
		List<String> array = null;
		
		if(bindingResult.hasErrors()){
			array = new ArrayList<>();
			
			List<FieldError> list = bindingResult.getFieldErrors();
	        for (FieldError e : list) {
	        	array.add(messageSource.getMessage(e.getCode(), e.getArguments(), Locale.getDefault()));
	        }
		}
		return array;
	}
	
	protected Map<String, Object> getServiceResult(ServiceResult result, String message, Object data){
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", result == ServiceResult.SUCCESS ? Constant.YesNoStatus.Y.name() : Constant.YesNoStatus.N.name());
		
		if(!StringUtils.isEmpty(message)){
			map.put("message", message);
		}
		
		if(data != null){
			map.put("data", data);
		}
		logger.info("result : "+map);
		return map;
	}
	
	protected Map<String, Object> getServiceResult(ServiceResult result){
		return getServiceResult(result, null, null);
	}
	
	protected Map<String, Object> getServiceResult(ServiceResult result, String message){
		return getServiceResult(result, message, null);
	}
	
	public String getMessage(String message, HttpServletRequest request){
		return getMessage(message, null, false, request);
	}

	public String getMessage(String message, String[] arguments, HttpServletRequest request){
		return getMessage(message, arguments, false, request);
	}

	public String getMessage(String message, String[] arguments, boolean isArgsStr, HttpServletRequest request){

		List<String> array = new ArrayList<>();
		Object[] obj = null;

		if(isArgsStr){
			obj = arguments;
		}else{
			if(arguments != null){
				for(String str : arguments){
					array.add(messageSource.getMessage(str, null, LocaleUtil.getLocale(request)));
				}
				obj = array.toArray();
			}
		}

		return messageSource.getMessage(message, obj, LocaleUtil.getLocale(request));
	}
	
	public String returnURL(HttpServletRequest request, HttpServletResponse response, Device device, String page) {
		return returnURL(request, response, device, page, null);
	}
	
	public String returnURL(HttpServletRequest request, HttpServletResponse response, Device device, String page, ModelMap model) {
		
		boolean isMobile = false;
		
		try {
			LocaleUtil.setLocale(request, response);
			isMobile = commonService.detectDevice(device);
		} catch(Exception e) {
			e.printStackTrace();
			isMobile = false;
		}
		
		if(model != null) {
			model.addAttribute("isMobile", isMobile);
		}
		
		if(isMobile) {
			return "/mw/"+LocaleUtil.getLocaleStr(request)+page;
		} else {
			return "/web/"+LocaleUtil.getLocaleStr(request)+page;
		}
	}
	
}
