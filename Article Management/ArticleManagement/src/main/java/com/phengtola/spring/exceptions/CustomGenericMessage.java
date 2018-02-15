package com.phengtola.spring.exceptions;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomGenericMessage {

	@JsonProperty("CODE")
	private String code;
	
	@JsonProperty("MESSAGE")
	private String message;

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
	
	public CustomGenericMessage(String code, String message){
		this.code = code;
		this.message = message;
	}
	
}
