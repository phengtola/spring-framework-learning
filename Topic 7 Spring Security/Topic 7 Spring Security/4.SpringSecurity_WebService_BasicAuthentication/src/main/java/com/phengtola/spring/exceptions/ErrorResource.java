package com.phengtola.spring.exceptions;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ErrorResource {
	
	@JsonProperty("CODE")
	private String code;
	
	@JsonProperty("MESSAGE")
	private String message;
	
	@JsonProperty("FIELD_ERRORS")
	private List<FieldErrorResource> fieldErrors;

	public ErrorResource() {
	}

	public ErrorResource(String code, String message) {
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

	public List<FieldErrorResource> getFieldErrors() {
		return fieldErrors;
	}

	public void setFieldErrors(List<FieldErrorResource> fieldErrors) {
		this.fieldErrors = fieldErrors;
	}
}
