package com.kshrd.mybatis.services.impl;

import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kshrd.mybatis.entities.User;
import com.kshrd.mybatis.repositories.RoleRepository;
import com.kshrd.mybatis.repositories.StudentRepository;
import com.kshrd.mybatis.repositories.UserRepository;
import com.kshrd.mybatis.services.UserService;


@Service
public class UserServiceImpl implements UserService{

	private UserRepository userRepository;
	private StudentRepository studentRepository;
	private RoleRepository roleRepository;
	
	@Autowired
	public UserServiceImpl(UserRepository userRepository, StudentRepository studentRepository,RoleRepository roleRepository) {
		this.userRepository = userRepository;
		this.studentRepository = studentRepository;
		this.roleRepository = roleRepository;
	}
	
	@Override
	public ArrayList<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	@Transactional
	public boolean save(User user) {
		
		userRepository.save(user);
		studentRepository.save();
		
//		try{
//			user.setUserHash(UUID.randomUUID().toString());
//			if(userRepository.save(user)){
//				System.out.println("User has been saved!");
//				studentRepository.save();
//				System.out.println("Student has been saved!");
//			}else{
//				System.out.println("false");
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//			System.out.println("User and Student has not been saved!");
//			return false;
//		}
		return true;
	}

	@Override
	public boolean update(User user) {
		try{
			if(userRepository.update(user)){
				System.out.println("User has been updated!");
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String userHash) {
		try{
			if(userRepository.delete(userHash)){
				System.out.println("User has been deleted!");
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public User findOne(String userHash) {
		return userRepository.findOne(userHash);
	}

	@Override
	public ArrayList<User> findAllWithUni() {
		return userRepository.findAllWithUniversity();
	}

	@Override
	public ArrayList<User> findAllWithUniAndRoles() {
		return userRepository.findAllWithUniversityAndRoles();
	}

	//@Transactional
	@Transactional(rollbackFor=Exception.class)
	@Override
	public boolean saveUserAndReturnID(User user) {
		try{
			if(userRepository.saveUserAndReturnID(user)){
				System.out.println("User id " + user.getId() + " has been inserted.");
				if(roleRepository.saveBatchUserRoles(user.getRoles(), user.getId())){
					System.out.println("Roles have been inserted.");
				}
			}
		}catch(RuntimeException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
