package io.spring.loc.di.annotations.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.spring.loc.di.annotations.service.UserService;
import io.spring.loc.di.annotations.service.UserServiceImpl;

@Configuration
public class WebConfiguration {
	
	@Bean
	public UserService userService(){
		return new UserServiceImpl();
	}
	
	@Bean(name="myUserService")
	public UserService myUserService(){
		return new UserServiceImpl();
	}
	
	@Bean
	public UserService userServiceByName(){
		return new UserServiceImpl();
	}

}
