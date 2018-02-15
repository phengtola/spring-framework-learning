package com.phengtola.spring.contollers.web;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phengtola.spring.entities.User;
import com.phengtola.spring.services.UserService;

@Controller
public class UserController {

	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@ResponseBody
	@RequestMapping("/user")
	public User findUserByEmail(){
		return userService.findUserByEmail("admin@gmail.com");
	}
	
	
//	public static void main(String[] args) {
//		System.out.println(UUID.randomUUID().toString());
//	}
	
}
