package com.hrd.spring.repository;

import com.hrd.spring.model.User;

public interface UserRepository {

	public User findUserById(int id);
	
}
