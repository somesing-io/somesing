package com.somesing.www.common.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommonService {

	private static final Logger logger = LoggerFactory.getLogger(CommonService.class);
	
	/** 
	 * 기기 체크 
	 * @return true (mobile), false (PC)
	 * @throws Exception
	 */
	public boolean detectDevice(Device device) throws Exception{
		
		boolean isMobile = false;
		
		if (device.isMobile()) {
			isMobile = true;
        } else if (device.isTablet()) {
        	isMobile = true;
        } else {
        	isMobile = false;
        }
		
		logger.info("isMobile : "+isMobile);
        return isMobile;
	}
	
}
