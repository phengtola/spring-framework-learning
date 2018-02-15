package com.spring.mybatis.model;

public class SignUpWith {

	private int id;
	private String deviceName;
	
	public SignUpWith() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public SignUpWith(int id, String deviceName) {
		super();
		this.id = id;
		this.deviceName = deviceName;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	
	
	
}
