package io.spring.loc.di.annotations.service;

import io.spring.loc.di.annotations.model.User;

public class UserServiceImpl implements UserService{

	@Override
	public User findUserByID() {
		User user = new User();
		user.setId("1");
		user.setUsername("Dara");
		return user;
	}

}
