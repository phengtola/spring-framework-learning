package com.spring.mybatis.controller.rest;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.mybatis.model.User;
import com.spring.mybatis.services.UserService;

@RestController // = @Contoller + @ResponseBody
@RequestMapping("/user")
public class UserRestController {

	private UserService userService;
	
	/**
	 * ..........??????
	 * @param userService
	 */
	@Autowired
	public UserRestController(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * ????????????????
	 * @return
	 */
	@RequestMapping
	public List<User> findAll(){
		return userService.findAll();
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	public boolean save(){
		return userService.save(new User(0, "PP", "pp@gmail.com", "pp123", "F","0", null));
	}
	
	/**
	 * 
	 * @param userHash
	 * @return
	 */
	@RequestMapping("/delete/{user_hash}")
	public boolean delete(@PathVariable("user_hash") String userHash){
		return userService.deleteByUserHash(userHash);
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/update")
	public boolean update(){
		User user = new User();
		user.setUsername("DADA");
		user.setUserHash("fgasdfg-fasd-fads-fasd");
		return userService.updateByUserHash(user);
	}
	
	@RequestMapping("/save-batch")
	public boolean saveBatch(){
		ArrayList<User> users = new ArrayList<User>();
		User user = new User();
		user.setUsername("DADA");
		users.add(user);
		user = new User();
		user.setUsername("TADA");
		users.add(user);
		return userService.saveBatch(users);
	}
	
	
}
