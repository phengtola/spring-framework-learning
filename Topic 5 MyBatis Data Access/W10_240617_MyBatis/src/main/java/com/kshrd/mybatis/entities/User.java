package com.kshrd.mybatis.entities;

import java.util.ArrayList;

public class User {

	private int id;
	private String username;
	private String email;
	private String password;
	private String gender;
	private String status;
	private String userHash;
	private University university;
	private ArrayList<Role> roles;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int id, String username, String email, String password, String gender, String status, String userHash) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.status = status;
		this.userHash = userHash;
	}

	
	
	public User(int id, String username, String email, String password, String gender, String status, String userHash,
			University university, ArrayList<Role> roles) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.status = status;
		this.userHash = userHash;
		this.university = university;
		this.roles = roles;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserHash() {
		return userHash;
	}

	public void setUserHash(String userHash) {
		this.userHash = userHash;
	}

	public University getUniversity() {
		return university;
	}

	public void setUniversity(University university) {
		this.university = university;
	}

	public ArrayList<Role> getRoles() {
		return roles;
	}

	public void setRoles(ArrayList<Role> roles) {
		this.roles = roles;
	}
	
	
	
	
}
