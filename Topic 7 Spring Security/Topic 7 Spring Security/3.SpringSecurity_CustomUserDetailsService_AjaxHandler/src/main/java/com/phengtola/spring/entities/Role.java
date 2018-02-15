package com.phengtola.spring.entities;

import java.sql.Timestamp;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * @author Tola
 *	Created Date: 2017/10/27
 */
public class Role implements GrantedAuthority{

	
	
	@JsonProperty("id")
	private int id;
	@JsonProperty("name")
	private String name;
	@JsonProperty("remark")
	private String remark;
	@JsonProperty("status")
	private String status;
	@JsonProperty("created_date")
	private Timestamp createdDate;
	@JsonProperty("index")
	private int index;
	@JsonProperty("uuid")
	private String uuid;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = "ROLE_"+name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int countUser;
	

	public int getCountUser() {
		return countUser;
	}

	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}

	@Override
	public String getAuthority() {
		// Role name
		return name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	
}
