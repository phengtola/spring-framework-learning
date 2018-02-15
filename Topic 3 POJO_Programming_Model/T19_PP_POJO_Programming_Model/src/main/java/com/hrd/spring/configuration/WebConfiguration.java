package com.hrd.spring.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.hrd.spring.repository.UserRepository;
import com.hrd.spring.repository.impl.UserRepositoryImpl;
import com.hrd.spring.service.UserService;
import com.hrd.spring.service.impl.UserServiceImpl;

@Configuration
public class WebConfiguration {

//	@Bean(name="userRepositoryImpl")
//	public UserRepository userRepository(){
//		return new UserRepositoryImpl();
//	}
//	
//	@Bean(name="userServiceImpl")
//	public UserService userService(){
//		return new UserServiceImpl();
//	}
	
}
