package com.phengtola.domain;

import java.sql.Timestamp;
import java.util.List;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class Comment extends BaseEntity{

	private User user;
	private Article article;
	private String comment;
	private List<Comment> replyComments;
	
	public Comment(User user, Article article, String comment, List<Comment> replyComments) {
		super();
		this.user = user;
		this.article = article;
		this.comment = comment;
		this.replyComments = replyComments;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid, User user, Article article, String comment, List<Comment> replyComments) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.user = user;
		this.article = article;
		this.comment = comment;
		this.replyComments = replyComments;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public List<Comment> getReplyComments() {
		return replyComments;
	}
	public void setReplyComments(List<Comment> replyComments) {
		this.replyComments = replyComments;
	}
	
	
	
}
