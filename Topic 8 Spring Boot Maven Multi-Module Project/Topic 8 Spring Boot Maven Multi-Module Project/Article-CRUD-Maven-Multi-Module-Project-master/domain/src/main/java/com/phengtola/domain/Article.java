package com.phengtola.domain;

import java.sql.Timestamp;
import java.util.List;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class Article extends BaseEntity{
	
	private String title;
	private String content;
	private int viewed;
	private int shared;
	private User user; // One article has one user
	private Category category; // One article has one category
	
	private List<File> files; // One article has many file
	private List<Tag> tags;

	
	
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Article(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid , String title, String content, int viewed, int shared, User user, Category category,
			List<File> files,List<Tag> tags) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.title = title;
		this.content = content;
		this.viewed = viewed;
		this.shared = shared;
		this.user = user;
		this.category = category;
		this.files = files;
		this.tags = tags;
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

	public int getViewed() {
		return viewed;
	}

	public void setViewed(int viewed) {
		this.viewed = viewed;
	}

	public int getShared() {
		return shared;
	}

	public void setShared(int shared) {
		this.shared = shared;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	
}
