package com.spring.mybatis.model;

public class User {

	private int id;
	private String username;
	private String email;
	private String password;
	private String gender;
	private String userHash;
	private SignUpWith signUpWith;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public User(int id, String username, String email, String password, String gender, String userHash,
			SignUpWith signUpWith) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.userHash = userHash;
		this.signUpWith = signUpWith;
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
	public String getUserHash() {
		return userHash;
	}
	public void setUserHash(String userHash) {
		this.userHash = userHash;
	}



	public SignUpWith getSignUpWith() {
		return signUpWith;
	}



	public void setSignUpWith(SignUpWith signUpWith) {
		this.signUpWith = signUpWith;
	}
	
	
	
	
}
