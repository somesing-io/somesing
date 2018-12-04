package com.somesing.www.common.service;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somesing.www.user.dao.UserDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class MailService {

	private static final Logger logger = LoggerFactory.getLogger(MailService.class);
	
	@Autowired
	private UserDao userDao;
	
	@Value("${server.mail.from}")
	private String mailFrom = "";
	
	@Value("${server.mail.to}")
	private String to = "";
	
	@Value("${server.mail.host}")
	private String host = "";
	
	@Value("${server.mail.port}")
	private String port = "";
	
	@Value("${server.mail.username}")
	private String username = "";
	
	@Value("${server.mail.passwd}")
	private String passwd = "";
	
	@Value("${server.mail.debug}")
	private String debug = "false";
	
	@Value("${server.mail.domain}")
	private String domain = "";
	
	@Async
	public void mailSender(String type, String msg, String email, String name) throws Exception{
		
		String title = "";
		
		if("CONTACTUS".equals(type)) {
			title = name + "( "+email+" ) 님의 메일이 도착하였습니다.";
			email = to;
		} else if("REGIST".equals(type)){
			
			// 회원이 맞는지 체크 한번 하고 메일 발송
			int count = userDao.userCheck(email);
			
			if(count <= 0) {
				logger.error("EMAIL NOT DB  :  {}", email);
				throw new Exception("EMAIL NOT DB");
			}
			
			// 메일 발송 날짜 업데이트
			userDao.updateMailSendDt(email);
			
			title = "[SOMESING] 회원가입 인증";
			msg = "<a href='"+domain+"/user/email/code/update?emailCode="+msg+"'>확인</a>";
		} else if("PASSWD".equals(type)) {
			title = "[SOMESING] 비밀번호 인증";
			msg = "<a href='"+domain+"/user/login/pw/reset?emailCode="+msg+"'>확인</a>";
		}
		
		mailSender(type, title, msg, email, name);
	}
	
	@Async
	public void mailSender(String type, String title, String msg, String email, String name) throws Exception{
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    
	    Session session = Session.getInstance(props,
		       new javax.mail.Authenticator() {
		          protected PasswordAuthentication getPasswordAuthentication() {
		             return new PasswordAuthentication(username, passwd);
		          }
	    });
	    
	    if("true".equals(debug)) {
	    	 session.setDebug(true);
	    } else {
	    	 session.setDebug(false);
	    }
		
	    Message message = new MimeMessage(session);
	    message.setFrom(new InternetAddress(mailFrom));
	    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	    
	  /*  if("attach".equals(type)){
	    	
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
	    	
	    } else {*/
	    
	    	message.setSubject(title);
	    	message.setContent(msg, "text/html;charset=UTF-8");
	    
	    message.setSentDate(new Date());
	    
	    Transport.send(message);
	    logger.info(email+ " --> Mail Sent message successfully....");
	}
	
}
