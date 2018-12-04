package com.somesing.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(DateUtil.class);

	public static String dateFormat(Date date, String format) throws Exception{
		SimpleDateFormat dd = new SimpleDateFormat(format);
		return dd.format(date);
	}
	
	public static String dateFormat(Date date) throws Exception{
		return dateFormat(date, "yyyyMMddHHmmss");
	}
	
	public static String dateFormat() throws Exception{
		Date date = new Date();
		return dateFormat(date, "yyyyMMddHHmmss");
	}
	
	public static String dateFormatString(String dateStr) throws Exception{
		
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = dd.parse(dateStr);
		return dateFormat(date, "yyyyMMddHHmmss");
	}
	
	public static boolean dateTodayDiff(String dateStr, int diffDay) throws Exception{
		
		boolean flag = true;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateRegDt = sdf.parse(dateStr);
		
		Date today = new Date();
		
		long diff = today.getTime() - dateRegDt.getTime();
		
		if(diff < (diffDay * (24 * 60 * 60 * 1000))) {
			flag = false;
		}
		
		return flag;
	}
}
