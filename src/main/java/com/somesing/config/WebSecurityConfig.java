package com.somesing.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.somesing.config.security.SecurityAuthFilter;
import com.somesing.config.security.SecurityLoginFailHandler;
import com.somesing.config.security.SomesingAuthenticationProvider;
import com.somesing.www.user.service.LoginService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private LoginService loginService;
	
	 @Override
	 protected void configure(HttpSecurity http) throws Exception {
		 http
		 	.csrf().disable()
		 	.authorizeRequests().antMatchers("/*").permitAll()
		 	.and()
	 		.formLogin()
	 			.loginPage("/user/login")
	 			.usernameParameter("login_username")
	 			.passwordParameter("login_pwd")
	 			.loginProcessingUrl("/user/login/action")
	 			.defaultSuccessUrl("/user/login/success", true)
	 			.failureHandler(new SecurityLoginFailHandler())
	 		.and()
	 		.logout()
	 			.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
	 			.logoutSuccessUrl("/user/logout/success")
	 			.deleteCookies("JSESSIONID")
	 			.invalidateHttpSession(true)
	 		.and()
	 		.exceptionHandling().accessDeniedPage("/user/login")
	    	.and()
	  	    	.sessionManagement()
	  	    	.enableSessionUrlRewriting(false)
	  	    	.maximumSessions(10)
	  	    	.expiredUrl("/user/login");
		 
		 http.addFilterAfter(new SecurityAuthFilter(), ExceptionTranslationFilter.class);
	 }
	 
	 @Override
	 protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		 auth.authenticationProvider(new SomesingAuthenticationProvider());
		 super.configure(auth);
	 }
	 
	 @Override
	 public void configure(WebSecurity web) throws Exception {
		 web
		    .ignoring()
		     .antMatchers("/web/kor/assets/**", "/web/eng/assets/**", "/mw/kor/assets/**", "/mw/eng/assets/**", "/favicon.ico");
	 }
	 
	 @Bean
	 public SomesingAuthenticationProvider somesingAuthenticationProvider() {
		 SomesingAuthenticationProvider provider = new SomesingAuthenticationProvider();
		 provider.setUserDetailService(loginService);
		 provider.passwordEncoder(passwordEncoder());
		 return provider;
	 }
	 
	 @Bean
	 public PasswordEncoder passwordEncoder() {
		 PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 return passwordEncoder;
	 }
	 
	 @Bean
	 public SecurityAuthFilter securityAuthFilter() {
		 SecurityAuthFilter securityAuthFilter = new SecurityAuthFilter();
		 securityAuthFilter.setAjaxHeader("x-ajax-call");
		 return securityAuthFilter;
	 }
}
