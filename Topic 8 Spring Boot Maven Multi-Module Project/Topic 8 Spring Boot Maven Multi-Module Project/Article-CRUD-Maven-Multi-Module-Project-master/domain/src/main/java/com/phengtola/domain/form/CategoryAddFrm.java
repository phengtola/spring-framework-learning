package com.phengtola.domain.form;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class CategoryAddFrm {

	@NotBlank
	@Size(min=1,max=50, message="Name must be between 4 and 50 characters!")
	private String name;
	
	//@JsonIgnore
	private String remark;
	
//	@ApiModelProperty(required = true,example = "2016-01-01 15:56:00")
//	@JsonFormat( pattern = "yyyy-MM-dd HH:mm:ss")
//	private Timestamp datetime;
	
	@NotBlank
	@Size(max=1, message="Status must be 0 or 1")
	private String status;
	
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
//	public Timestamp getDatetime() {
//		return datetime;
//	}
//	public void Date(Timestamp datetime) {
//		this.datetime = datetime;
//	}
	
	
	
	
}
