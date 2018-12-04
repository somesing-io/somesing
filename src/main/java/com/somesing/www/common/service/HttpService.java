package com.somesing.www.common.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class HttpService {
	
	private static final Logger logger = LoggerFactory.getLogger(HttpService.class);
	
	
	public String httpConnect(String urlParam, Map<String, String> paramMap) throws Exception{
		return httpConnect(urlParam, "POST", paramMap);
	}
	
	/** 
	 * HTTP 통신 테스트
	 * @return true (mobile), false (PC)
	 * @throws Exception
	 */
	public String httpConnect(String urlParam, String method, Map<String, String> paramMap) throws Exception{
		
		URL url = new URL(urlParam);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setDoInput(true);            // 입력스트림 사용여부
	    conn.setDoOutput(true);            // 출력스트림 사용여부
	    conn.setUseCaches(false);        // 캐시사용 여부
	    conn.setReadTimeout(2000);        // 타임아웃 설정 ms단위
	    conn.setRequestMethod("POST");  // or GET
	    conn.setRequestProperty("Accept", "application/json");
//	    conn.setRequestProperty("Content-Type", "application/json");
	    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
	    
        OutputStream os = conn.getOutputStream();
        OutputStreamWriter writer = new OutputStreamWriter(os);
	    
        StringBuilder sb = new StringBuilder();
	    
	    if(paramMap != null) {
	    	
	    	int i = 0;
	    	
	    	for(String key : paramMap.keySet()) {
	    		if(i != 0) sb.append("&");
	    		
	    		sb.append(key+"="+URLEncoder.encode(paramMap.get(key), "UTF-8"));
	    		i++;
	    	}
	    }
	    
	    writer.write(sb.toString());
	    writer.close();
	    os.close();
	   
	    BufferedReader br = new BufferedReader( new InputStreamReader(conn.getInputStream(), "UTF-8"));
	    
	    String line = "";
	    StringBuilder sbOut =  new StringBuilder();
	    
	    while((line=br.readLine())!=null){
	    	sbOut.append(line);
	    }
	    
	    logger.info("http connect : {}", sbOut.toString());
	    return sbOut.toString();
	}
    
    
}
