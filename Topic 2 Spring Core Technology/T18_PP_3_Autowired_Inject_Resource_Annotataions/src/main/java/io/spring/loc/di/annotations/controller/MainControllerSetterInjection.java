package io.spring.loc.di.annotations.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.spring.loc.di.annotations.model.User;
import io.spring.loc.di.annotations.service.UserService;

@Controller
public class MainControllerSetterInjection {
	
	/*
	 *  Setter Injection
	 */
	private UserService userService;
	
	@Autowired // @Inject //@Resource
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@RequestMapping("/s/user")
	@ResponseBody //@Resource //@Inject
	public User findUserByID(){
		return userService.findUserByID();
	}
	
	

}
