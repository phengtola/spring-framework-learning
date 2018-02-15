package com.phengtola.spring.exceptions;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FieldErrorResource {
	@JsonProperty("RESOURCE")
    private String resource;
	
	@JsonProperty("FIELD")
    private String field;
	
	@JsonProperty("CODE")
    private String code;
	
	@JsonProperty("MESSAGE")
    private String message;

    public String getResource() { return resource; }

    public void setResource(String resource) { this.resource = resource; }

    public String getField() { return field; }

    public void setField(String field) { this.field = field; }

    public String getCode() { return code; }

    public void setCode(String code) { this.code = code; }

    public String getMessage() { return message; }

    public void setMessage(String message) { this.message = message; }
}
