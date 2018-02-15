package com.kshrd.mybatis.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kshrd.mybatis.entities.User;
import com.kshrd.mybatis.services.UserService;

@Controller
public class UserWController {

	private UserService userService;
	
	@Autowired
	public UserWController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/user")
	public String userPage(ModelMap model){
		model.addAttribute("users", userService.findAll());
		return "user";
	}
	
	
	/*
	 * Add User
	 */
	
	/**
	 * return to user-cu.html with action : add and new user object
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/add")
	public String addUserPage(ModelMap model){
		model.addAttribute("action","add");
		model.addAttribute("user", new User());
		return "user-cu";
	}
	
	/**
	 * save user to database
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/user/create")
	public String createUser(@ModelAttribute User user){
		userService.save(user);
		return "redirect:/user";
	}
	
	/*
	 * End Add user
	 */
	
	/*
	 * Update User
	 */
	
	/**
	 * Return to user-cu.html with action:update and one user object
	 * @param userHash
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/update/{user_hash}")
	public String updateUserPage(
			@PathVariable("user_hash") String userHash,
			ModelMap model){
		model.addAttribute("action","update");
		model.addAttribute("user", userService.findOne(userHash));
		return "user-cu";
	}
	
	/**
	 * Update user in database
	 * @param user
	 * @return
	 */
	@RequestMapping("/user/update")
	public String updateUser(@ModelAttribute User user){
		System.out.println(user.getUsername());
		System.out.println(user.getUserHash());
		userService.update(user);
		return "redirect:/user";
	}
	
	
	/*
	 * End Update user
	 */
	
	
	
	@RequestMapping("/user/delete/{user_hash}")
	public String deleteUser(@PathVariable("user_hash") String userHash){
		userService.delete(userHash);
		return "redirect:/user";
	}
	
}
