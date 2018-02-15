package com.phengtola.spring.repositories;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.User;

@Repository
public interface UserRepository {

	@Select(" SELECT "
			+ " id,"
			+ "	username, "
			+ "	email, "
			+ "	password, "
			+ "	dob, "
			+ "	gender, "
			+ "	socail_id, "
			+ "	socail_type, "
			+ "	device, "
			+ "	created_date, "
			+ "	remark, "
			+ "	status, "
			+ "	uuid "
		+ " FROM users WHERE email=#{email}")
	@Results(value={
			@Result(property="createdDate", column="created_date"),
			@Result(property="roles", column="id",
					many = @Many(select  = "com.phengtola.spring.repositories.RoleRepository.findRolesByUserId")
			)
	})
	public User findUserByEmail(@Param("email") String email);
	
	
}
