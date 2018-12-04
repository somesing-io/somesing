package com.somesing.www.user.dao;

import com.somesing.www.model.LoginVO;

public interface LoginDao {

	LoginVO userLogin(String email);
}
