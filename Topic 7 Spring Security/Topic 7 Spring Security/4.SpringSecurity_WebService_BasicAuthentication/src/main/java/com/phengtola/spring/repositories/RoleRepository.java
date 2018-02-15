package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.Role;

@Repository
public interface RoleRepository {

	@Select(" SELECT "
			+ " R.id,"
			+ "	R.name, "
			+ "	R.uuid, "
			+ "	R.created_date, "
			+ "	R.status"
		+ " FROM user_roles UR INNER JOIN roles R ON UR.role_id = R.id"
		+ " WHERE UR.user_id=#{user_id}")
	@Results(value={
			@Result(property="createdDate", column="created_date")
	})
	public List<Role> findRolesByUserId(@Param("user_id") int userId);
	
	
}
