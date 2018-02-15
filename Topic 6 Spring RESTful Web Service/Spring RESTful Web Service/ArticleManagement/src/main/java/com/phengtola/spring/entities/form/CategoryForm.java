package com.phengtola.spring.entities.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CategoryForm {
	
	@NotNull
	@Size(min = 4 , message = "Category name must be at least 4 characters.")
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("remark")
	private String remark;
	
	@NotNull
	@Size(max = 1,  message = "Value of status must be 1 or 0 (1:true, 0:fale).")
	@JsonProperty("status")
	private String status;
	
	@JsonProperty("uuid")
	private String uuid;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	

}
