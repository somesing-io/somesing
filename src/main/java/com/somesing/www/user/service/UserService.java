package com.somesing.www.user.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somesing.www.model.UserVO;
import com.somesing.www.user.dao.UserDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserDao userDao;

	public int insertUser(UserVO userVO) throws Exception{
		
		// 비밀번호 암호화 SPRING SECURITY
		userVO.setPasswd(new BCryptPasswordEncoder().encode(userVO.getPasswd()));
		
		// 메일 코드 생성
		
		// 이메일 발송
		return userDao.insertUser(userVO);
	}
	
	public int userCheck(String email) throws Exception{
		return userDao.userCheck(email);
	}
	
	public UserVO userView(String email) throws Exception{
		return userDao.userView(email);
	}
	
	public int updateEmailYn(String emailCode) throws Exception{
		return userDao.updateEmailYn(emailCode);
	}
	
	public UserVO userViewByEmailCode(String emailCode) throws Exception{
		return userDao.userViewByEmailCode(emailCode);
	}
	
	public int updateLoginPw(String emailCode, String passwd) throws Exception{
		return userDao.updateLoginPw(emailCode, passwd);
	}
	
	public int updateLoginDt(String email) throws Exception{
		return userDao.updateLoginDt(email);
	}
}
