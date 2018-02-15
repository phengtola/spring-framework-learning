package com.phengtola.spring.entities;

import java.sql.Timestamp;
/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class BaseEntity {
	
	private int id;
	private String name;
	private String remark;
	private String status;
	private Timestamp createdDate;
	private int index;
	private String uuid;
	
	public BaseEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BaseEntity(int id, String name, String remark, String status, Timestamp createdDate, int index,
			String uuid) {
		super();
		this.id = id;
		this.name = name;
		this.remark = remark;
		this.status = status;
		this.createdDate = createdDate;
		this.index = index;
		this.uuid = uuid;
	}
	
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
		this.name = name;
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
	
	
	
	

}
