package com.somesing;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@Configuration
@ComponentScan
@SpringBootApplication
@EnableScheduling
@EnableAsync
public class SomesingApplication {

	public static void main(String[] args) {
		SpringApplication.run(SomesingApplication.class, args);
	}
	
	@Bean 
	public TaskExecutor taskExecutor() { 
		ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor(); 
		taskExecutor.setCorePoolSize(10); 
		taskExecutor.setMaxPoolSize(20); 
		taskExecutor.setQueueCapacity(50); 
		return taskExecutor; 
	}
}



