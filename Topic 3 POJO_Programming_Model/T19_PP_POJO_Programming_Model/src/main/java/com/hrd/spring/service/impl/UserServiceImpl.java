package com.hrd.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hrd.spring.model.User;
import com.hrd.spring.repository.UserRepository;
import com.hrd.spring.service.UserService;

//@Component
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	@Autowired
	@Qualifier("userRepositoryImpl")
	private UserRepository userRepository;
	
	@Override
	public User findUserById(int id) {
		//userRepository = new UserRepositoryImpl();
		
		return userRepository.findUserById(id);
	}

}
