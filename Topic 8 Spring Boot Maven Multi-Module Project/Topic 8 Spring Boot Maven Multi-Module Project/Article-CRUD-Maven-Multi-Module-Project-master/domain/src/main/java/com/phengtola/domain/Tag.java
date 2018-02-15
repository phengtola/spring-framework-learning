package com.phengtola.domain;

import java.sql.Timestamp;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class Tag extends BaseEntity{
	
	private int countArticle;

	public Tag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tag(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid, int countArticle) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.countArticle = countArticle;
	}

	public int getCountArticle() {
		return countArticle;
	}

	public void setCountArticle(int countArticle) {
		this.countArticle = countArticle;
	}
	
	

}
