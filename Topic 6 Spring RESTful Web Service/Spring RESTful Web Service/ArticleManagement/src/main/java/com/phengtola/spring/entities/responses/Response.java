package com.phengtola.spring.entities.responses;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * @author Tola
 *	Created Date: 2017/07/03
 *
 */
public class Response<T> {
	/*
	 * Response class using with insert, update, delete
	 */

	@JsonProperty("message")
	private String message;
	@JsonProperty("status")
	private boolean status;
	
	public Response() {

	}
	
	public Response(String message, boolean status) {
		super();
		this.message = message;
		this.status = status;
	}
	
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * @return the status
	 */
	public boolean isStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(boolean status) {
		this.status = status;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Response [ message=" + message + ", status=" + status + "]";
	}
	

	
}
