package com.phengtola.spring.exceptions;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomGenericException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2223401815627927627L;

	@JsonProperty("CODE")
	private String code;
	@JsonProperty("MESSAGE")
	private String message;
	
	public CustomGenericException(String code, String message) {
		this.code = code;
		this.message = message;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
