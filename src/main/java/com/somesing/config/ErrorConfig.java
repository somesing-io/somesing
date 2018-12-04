package com.somesing.config;

import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.autoconfigure.web.servlet.ServletWebServerFactoryCustomizer;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

@Configuration 
public class ErrorConfig extends ServletWebServerFactoryCustomizer {

	public ErrorConfig(ServerProperties serverProperties) {
		super(serverProperties);
		// TODO Auto-generated constructor stub
	}

	@Override
	public int getOrder() {
		// TODO Auto-generated method stub
		return super.getOrder();
	}

	@Override
	public void customize(ConfigurableServletWebServerFactory factory) {
		super.customize(factory);
		factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error/404"));
		factory.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500"));
	}
}
