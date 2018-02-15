package com.phengtola.spring.entities.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class CategoryFrmPP {

	
	private String uuid;
	
	@NotNull
	@NotBlank
	@Size(min=4,max=50, message="Name must be between 4 and 50 characters!")
	private String name;
	
	private String remark;
	
	@NotBlank
	@Size(max=1, message="Status must be 0 or 1")
	private String status;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
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
	
	
	
	
}
