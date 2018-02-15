package com.hrd.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrd.spring.model.User;
import com.hrd.spring.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@RequestMapping("/user")
	@ResponseBody
	public User findUserById(){
		return userService.findUserById(1);
	}

}
