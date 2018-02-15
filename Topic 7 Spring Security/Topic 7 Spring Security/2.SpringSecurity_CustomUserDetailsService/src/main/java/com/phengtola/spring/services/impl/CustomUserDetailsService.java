package com.phengtola.spring.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.phengtola.spring.entities.Role;
import com.phengtola.spring.entities.User;
import com.phengtola.spring.services.UserService;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

	private UserService userService;
	
	@Autowired
	public CustomUserDetailsService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = userService.findUserByEmail(email);
		if(user == null){
			System.out.println("User not found!");
			throw new UsernameNotFoundException("User not found!");
		}
		System.out.println("User email: "+user.getEmail());
		//return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), user.isEnabled(), user.isAccountNonExpired(),
         //       user.isCredentialsNonExpired(), user.isAccountNonLocked(), user.getRoles());
		for(Role role : user.getRoles()){
			System.out.println("ROLE: " + role.getName());
		}
		return user;
	}

}
