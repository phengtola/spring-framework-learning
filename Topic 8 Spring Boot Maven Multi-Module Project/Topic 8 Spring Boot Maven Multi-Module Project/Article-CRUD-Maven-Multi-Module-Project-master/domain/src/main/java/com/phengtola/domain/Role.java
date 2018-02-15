package com.phengtola.domain;

import org.springframework.security.core.GrantedAuthority;

import java.sql.Timestamp;

/**
 * 
 * @author Tola
 *	Created Date: 2017/10/27
 */
public class Role extends BaseEntity implements GrantedAuthority{

	private int countUser;
	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Role(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid, int countUser) {
		super(id, name, remark, status, createdDate, index, uuid );
		this.countUser = countUser;
	}

	public int getCountUser() {
		return countUser;
	}

	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}


	@Override
	public String getAuthority() {
		return super.getName();
	}
}
