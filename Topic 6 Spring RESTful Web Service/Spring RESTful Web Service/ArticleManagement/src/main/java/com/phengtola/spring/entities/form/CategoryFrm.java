package com.phengtola.spring.entities.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 
 * @author tolapheng
 *	Created Date: 05 July 2017 
 *
 */
public class CategoryFrm {

	private String uuid;
	
	@NotNull
	@Size(min=4 , max=50, message="Name must be between 4 to 50 characters long.")
	@NotBlank
	private String name;
	
	@NotNull
	@Size(max=1, message="Status must be 1 or 0 ")
	private String status;
	
	private String remark;
	
	public CategoryFrm() {
	
	}
	
	public CategoryFrm(String uuid, String name, String status, String remark) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.status = status;
		this.remark = remark;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
