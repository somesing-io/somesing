package com.somesing.config;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.mobile.device.DeviceHandlerMethodArgumentResolver;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.mobile.device.switcher.SiteSwitcherHandlerInterceptor;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
// @EnableWebMvc
@ComponentScan(
	    basePackages="com.somesing.www",
	    excludeFilters={@ComponentScan.Filter(Configuration.class)}
	)
public class MvcConfig implements WebMvcConfigurer  {
	
	private static final Logger logger = LoggerFactory.getLogger(MvcConfig.class);
	private static final String APP_CONFIG_FILE_PATH = "application.properties";
	private static final String SOMESING_CONFIG_FILE_PATH = "somesing.properties";
	
/*	@Value("${server.devMode}")
	private String devMode = "";
*/	
	@Value("${server.address}")
	private String host = "";
	 
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(deviceResolverHandlerInterceptor());
//		registry.addInterceptor(siteSwitcherHandlerInterceptor());
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(deviceHandlerMethodArgumentResolver());
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///D:/data/web/upload/");
	}
	
	@Bean
    public static PropertyPlaceholderConfigurer propertyPlaceholderConfigurer() {
        PropertyPlaceholderConfigurer ppc = new PropertyPlaceholderConfigurer();
        ppc.setLocations(new Resource[]{new ClassPathResource(APP_CONFIG_FILE_PATH), new ClassPathResource(SOMESING_CONFIG_FILE_PATH) });
        return ppc;
    }
	
	@Bean
	public DeviceResolverHandlerInterceptor deviceResolverHandlerInterceptor() {
		return new DeviceResolverHandlerInterceptor();
	}
	
	@Bean
	public DeviceHandlerMethodArgumentResolver deviceHandlerMethodArgumentResolver() {
	    return new DeviceHandlerMethodArgumentResolver();
	}

	/*@Bean
	public SiteSwitcherHandlerInterceptor siteSwitcherHandlerInterceptor() {
	    return SiteSwitcherHandlerInterceptor.mDot(host, true);
	}*/
	
	@Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setOrder(1);
        return resolver;
    }
	
	/**
	 *	MessageSource 사용위해 설정 기본으로 
	 *	message/messages 디렉토리에서 언어별로 접미어로 _kr, _en 식으로 불러온다.
	 ***/
    @Bean
    public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:message/messages");
        messageSource.setCacheSeconds(10); //reload messages every 10 seconds
        return messageSource;
    }
    
    @Bean
    public LocaleResolver localeResolver(){
    	SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
//   	default 가 없으면 브라우저 agent-header 값의 locale 정보에 따라 변경됨
//    	sessionLocaleResolver.setDefaultLocale(new Locale("kr"));
    	return sessionLocaleResolver;
    }

}
