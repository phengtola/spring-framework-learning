package com.phengtola.domain;

import java.sql.Timestamp;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class Permission extends BaseEntity{

	private int countRole;
	
	public Permission() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Permission(int id, String name, String remark, String status, Timestamp createdDate, int index,
			String uuid,int countRole) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.countRole = countRole;
	}

	public int getCountRole() {
		return countRole;
	}

	public void setCountRole(int countRole) {
		this.countRole = countRole;
	}

	
	
}
