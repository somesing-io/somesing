package com.somesing.www.model;

import org.apache.commons.collections4.map.ListOrderedMap;

import com.somesing.util.StringUtil;

public class VoMap extends ListOrderedMap<String, Object> {

	/**
	 *  Mybatis 소문자 정렬
	 */
	private static final long serialVersionUID = -1698013103771783532L;
	
	public Object put(String key, Object value) {
		
		if("REG_DT".equals(key) || "MOD_DT".equals(key) || "EXP_DT".equals(key)){
			value = String.valueOf(value);
		}
        return super.put(StringUtil.convert2CamelCase((String) key), value);
    }
}
