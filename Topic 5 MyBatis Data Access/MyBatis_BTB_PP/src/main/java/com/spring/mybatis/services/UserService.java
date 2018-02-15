package com.spring.mybatis.services;

import java.util.List;

import com.spring.mybatis.model.User;

public interface UserService {

	public List<User> findAll();
	public boolean save(User user);
	public boolean deleteByUserHash(String userHash);
	public boolean updateByUserHash(User user);
	public boolean saveBatch(List<User> users);
	
}
