package com.phengtola.spring.entities;

import java.sql.Timestamp;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class File extends BaseEntity{
	
	private int ownerId;
	private String path;
	private int size;
	private String type;
	
	
	private String originaName;
	
	public File() {
		super();
		// TODO Auto-generated constructor stub
	}
	public File(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid,int ownerId, String path, int size, String type) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.ownerId = ownerId;
		this.path = path;
		this.size = size;
		this.type = type;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
