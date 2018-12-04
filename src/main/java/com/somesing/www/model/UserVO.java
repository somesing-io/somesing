package com.somesing.www.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class UserVO {
	
	private String no = ""; 
     
	@NotEmpty
	private String firstName = "";
	
	@NotEmpty
	private String lastName = "";
	
	@NotEmpty
	@Pattern(regexp="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")
	private String email = "";
	
	@NotEmpty
	@Pattern(regexp="^([a-zA-Z]|[!@#$%^*()\\-_=+\\\\\\|\\[\\]{};:\\'\",.<>\\/?]|[0-9]){8,20}$")
	private String passwd = "";
	
	@NotEmpty
	private String passwd_confirm = "";
	
	@NotEmpty
	private String country = "";
	
	private String captchaVal = "";
	private String emailYn = "";
	private String emailCode = "";
	private String loginDt = "";
	private String regDt = "";
	private String mailSendDt = "";
	private String delYn = "";
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPasswd_confirm() {
		return passwd_confirm;
	}
	public void setPasswd_confirm(String passwd_confirm) {
		this.passwd_confirm = passwd_confirm;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCaptchaVal() {
		return captchaVal;
	}
	public void setCaptchaVal(String captchaVal) {
		this.captchaVal = captchaVal;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getEmailCode() {
		return emailCode;
	}
	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}
	public String getMailSendDt() {
		return mailSendDt;
	}
	public void setMailSendDt(String mailSendDt) {
		this.mailSendDt = mailSendDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getLoginDt() {
		return loginDt;
	}
	public void setLoginDt(String loginDt) {
		this.loginDt = loginDt;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getEmailYn() {
		return emailYn;
	}
	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
