package com.somesing.mail;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;

public class MailTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MailTest.class);
	
	private String host = "";
	private String port = "";

	private String to = "";
	
	private String mailForm = "";
	private String username = "";
	private String password = "";
	
	@Test
	public void test() throws Exception{
		mailSender("common");
	}
	
	@Async
	public void mailSender(String type) throws Exception{
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    
	    Session session = Session.getInstance(props,
		       new javax.mail.Authenticator() {
		          protected PasswordAuthentication getPasswordAuthentication() {
		             return new PasswordAuthentication(username, password);
		          }
	    });
	    
	    session.setDebug(true);
		
	    Message message = new MimeMessage(session);
	    message.setFrom(new InternetAddress(mailForm));
	    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	    
	    if("attach".equals(type)){
	    	
	    	message.setSubject("123123123"+" ");
	        
	    	BodyPart messageBodyPart = new MimeBodyPart();
	        messageBodyPart.setText("메일 테스트 ==> ");
	        
	        Multipart multipart = new MimeMultipart();
	        multipart.addBodyPart(messageBodyPart);
	        
	        messageBodyPart = new MimeBodyPart();
	        File file = new File(" D:\\uploadSample\\1.jpg");
	        DataSource source = new FileDataSource(file);
 	        messageBodyPart.setDataHandler(new DataHandler(source));
 	        messageBodyPart.setFileName("1.jpg");
	        
	        
	        multipart.addBodyPart(messageBodyPart);
	        message.setContent(multipart);
	    	
	    } else {
	    	message.setSubject("썸싱 메일 테스트입니다. ");
	    	message.setContent("썸싱 메일 테스트입니다. 123123123123123123123", "text/html;charset=UTF-8");
	    }
	    
	    message.setSentDate(new Date());
	    
	    Transport.send(message);
	    logger.info(to+ " --> Mail Sent message successfully....");
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
}









