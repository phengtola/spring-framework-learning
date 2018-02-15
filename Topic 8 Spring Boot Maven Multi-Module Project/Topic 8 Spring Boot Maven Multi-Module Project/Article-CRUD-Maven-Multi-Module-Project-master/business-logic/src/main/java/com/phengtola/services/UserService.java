package com.phengtola.services;


import com.phengtola.domain.User;

public interface UserService {

	User findUserByEmail(String email);
	
}
