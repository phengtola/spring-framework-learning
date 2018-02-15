package com.phengtola.domain.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class CategoryUpdateFrm {

	@NotBlank(message="UUID is required.")
	private String uuid;

	@NotNull
	@NotBlank
	@Size(min=1,max=50, message="Name must be between 4 and 50 characters!")
	private String name;
	
	private String remark;
	
	@NotBlank
	@Size(max=1, message="Status must be 0 or 1")
	private String status;
	
	@NotNull(message="Indext is required.")
	private int index;
	
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
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	
	
	
}
