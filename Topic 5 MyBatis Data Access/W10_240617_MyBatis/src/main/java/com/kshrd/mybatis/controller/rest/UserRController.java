package com.kshrd.mybatis.controller.rest;

import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kshrd.mybatis.entities.Role;
import com.kshrd.mybatis.entities.User;
import com.kshrd.mybatis.services.UserService;

@RestController // = @Controller + @ResponseBody
@RequestMapping("/")
public class UserRController {

	private UserService userService;
	
	@Autowired
	public UserRController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/")
	public ArrayList<User> findAll(){
		return userService.findAll();
	}
	
	@RequestMapping("/save")
	public boolean save(){
		String userHash = UUID.randomUUID().toString();
		System.out.println("User Hash: " +  userHash);
		return userService.save(new User(0, "test", "test@gmail.com", "test123456", "M", "1", userHash));
	}
	
	@RequestMapping("/update")
	public boolean update(){
		return userService.update(new User(0, "dada", "data@gmail.com", "655432", "F", "0", "12433544-12421-324142-314"));
	}
	
	@RequestMapping("/delete")
	public boolean delete(){
		return userService.delete("12433544-12421-324142-314");
	}
	
	
	@RequestMapping("/user/uni")
	public ArrayList<User> findAllWithUniName(){
		return userService.findAllWithUni();
	}
	
	@RequestMapping("/user/uni/roles")
	public ArrayList<User> findAllWithUniAndRoles(){
		return userService.findAllWithUniAndRoles();
	}
	
	
	@RequestMapping("/save/user/getkey/")
	public boolean saveUserAndReturnKy() {
		
		ArrayList<Role> roles = new ArrayList<Role>();
		Role role = new Role();
		role.setId(1);
		role.setRoleName("ADMIN");
		roles.add(role);
		
		role = new Role();
		role.setId(2);
		role.setRoleName("VISITOR");
		roles.add(role);
		
		String userHash = UUID.randomUUID().toString();
		return userService.saveUserAndReturnID(new User(0, "test", "test@gmail.com", "test123456", "M", "1", userHash, null, roles));
	}
	
}
