package com.somesing.www.user.dao;

import com.somesing.www.model.UserVO;

public interface UserDao {

	int insertUser(UserVO userVO);
	
	int userCheck(String email);
	
	UserVO userView(String email);
	
	int updateEmailYn(String emailCode);
	
	UserVO userViewByEmailCode(String emailCode);
	
	int updateMailSendDt(String email);
	
	int updateLoginPw(String emailCode, String passwd);
	
	int updateLoginDt(String email);
	
}
