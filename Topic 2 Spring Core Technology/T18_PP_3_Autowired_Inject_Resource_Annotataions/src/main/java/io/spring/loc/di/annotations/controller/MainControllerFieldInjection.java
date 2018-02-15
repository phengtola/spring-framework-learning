package io.spring.loc.di.annotations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.spring.loc.di.annotations.model.User;
import io.spring.loc.di.annotations.service.UserService;

@Controller
public class MainControllerFieldInjection {
	
	/*
	 *  Field Injection
	 */
	
	// Match by Type
	@Autowired //@Resource //@Inject 
	private UserService userService;
	
	// Match by Qualifier
	@Autowired //@Resource //@Inject
	@Qualifier("myUserService")
	private UserService myUserService;
	
	// Match By Name 
	@Autowired //@Resource //@Inject
	private UserService userServiceByName;
	
	@RequestMapping("/f/user")
	@ResponseBody //@Resource //@Inject
	public User findUserByID(){
		return userServiceByName.findUserByID();
	}
	
	

}
