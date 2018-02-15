package com.phengtola.spring.entities;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class User extends BaseEntity implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String email;
	private String password;
	private Date dob;
	private String gender;
	private String socailId;
	private String socialType;
	private String device; 
	
	private List<Role> roles; // One user has many roles 
	private List<File> files;  // One user has many files 
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String name, String remark, String status, Timestamp createdDate, int index, String uuid,String username, String email, String password, Date dob, String gender, File profilePictureId,
			File coverPictureId, String socailId, String socialType, String device, List<Role> roles, List<File> files) {
		super(id, name, remark, status, createdDate, index, uuid);
		this.username = username;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.socailId = socailId;
		this.socialType = socialType;
		this.device = device;
		this.roles = roles;
		this.files = files;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSocailId() {
		return socailId;
	}
	public void setSocailId(String socailId) {
		this.socailId = socailId;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
	public String getSocialType() {
		return socialType;
	}
	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return roles;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		if(super.getStatus().equals("1")){
			return true;
		}
		return false;
	}
	
	
	
	
}
