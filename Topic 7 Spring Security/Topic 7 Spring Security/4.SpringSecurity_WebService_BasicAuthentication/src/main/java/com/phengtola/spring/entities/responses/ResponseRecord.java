package com.phengtola.spring.entities.responses;

/**
 * 
 * @author Tola
 *	Created Date: 2017/07/03
 *
 */
public class ResponseRecord<T> extends Response{
	/*
	 * Response record class using with single object
	 */
	private T data;

	
	
	public ResponseRecord() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResponseRecord(String message, boolean status, T data) {
		super(message, status);
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
