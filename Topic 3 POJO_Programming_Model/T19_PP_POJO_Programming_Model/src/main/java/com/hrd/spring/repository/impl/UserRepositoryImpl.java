package com.hrd.spring.repository.impl;

import org.springframework.stereotype.Repository;

import com.hrd.spring.model.User;
import com.hrd.spring.repository.UserRepository;

//@Component
@Repository("userRepositoryImpl")
public class UserRepositoryImpl implements UserRepository{

	@Override
	public User findUserById(int id) {
		User user = new User();
		user.setId(1);
		user.setUsername("Phea");
		return user;
	}

}
