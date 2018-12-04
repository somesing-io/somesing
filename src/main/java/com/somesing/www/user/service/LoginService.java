package com.somesing.www.user.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somesing.www.model.LoginVO;
import com.somesing.www.user.dao.LoginDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class LoginService implements UserDetailsService{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Autowired
	private LoginDao loginDao;

	@Override
	public LoginVO loadUserByUsername(String username) throws UsernameNotFoundException {
		
		try {
			return loginDao.userLogin(username);
		} catch(Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("UserId Not Found  :  "+username);
		}
	}
	
	public PasswordEncoder passwordEncoder() { 
		return this.passwordEncoder; 
	}

}
