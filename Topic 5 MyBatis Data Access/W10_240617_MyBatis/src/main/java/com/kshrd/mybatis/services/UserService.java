package com.kshrd.mybatis.services;

import java.util.ArrayList;

import com.kshrd.mybatis.entities.User;

public interface UserService {

	public ArrayList<User> findAll();
	public boolean save(User user);
	public boolean update(User user);
	public boolean delete(String userHash);
	public User findOne(String userHash);

	public ArrayList<User> findAllWithUni();
	public ArrayList<User> findAllWithUniAndRoles();
	public boolean saveUserAndReturnID(User user) ;

}
