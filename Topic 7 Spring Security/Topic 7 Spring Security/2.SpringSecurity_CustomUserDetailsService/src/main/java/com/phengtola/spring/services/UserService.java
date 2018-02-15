package com.phengtola.spring.services;

import com.phengtola.spring.entities.User;

public interface UserService {

	User findUserByEmail(String email);
	
}
