package com.phengtola.domain.filters;

import java.sql.Timestamp;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class ArticleFilter {

	private String title;
	private String content;
	private Timestamp createdDate;
	private int categoryId;
	private int userId;
	private String status;
	
	public ArticleFilter() {
		// TODO Auto-generated constructor stub
	}
	
	public ArticleFilter(String title, String content, Timestamp createdDate, int categoryId, int userId,String status) {
		super();
		this.title = title;
		this.content = content;
		this.createdDate = createdDate;
		this.categoryId = categoryId;
		this.userId = userId;
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
