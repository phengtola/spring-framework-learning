package com.phengtola.spring.entities;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class Category extends BaseEntity{

	@JsonProperty("couont_article")
	private int countArticle;
	
//	private Timestamp dateTime;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid, int countArticle) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.countArticle = countArticle;
	}

	public int getCountArticle() {
		return countArticle;
	}

	public void setCountArticle(int countArticle) {
		this.countArticle = countArticle;
	}

//	public Timestamp getDateTime() {
//		return dateTime;
//	}
//
//	public void setDateTime(Timestamp dateTime) {
//		this.dateTime = dateTime;
//	}

	
	
}
