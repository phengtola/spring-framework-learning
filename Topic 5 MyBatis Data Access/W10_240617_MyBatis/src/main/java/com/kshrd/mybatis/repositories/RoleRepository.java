package com.kshrd.mybatis.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kshrd.mybatis.entities.Role;

@Repository
public interface RoleRepository {
	
	/**
	 * Insert Batch
	 * @param roles
	 * @param userId
	 * @return
	 */
	@Insert("<script>"
			+ "	INSERT INTO suser_roles("
			+ "		user_id, role_id"
			+ ")VALUES"
			+ "	<foreach collection='roles' item='role' separator=','>"
			+ "	("
			+ "	#{user_id},"
			+ "	#{role.id}"
			+ "	)"
			+ "	</foreach>"
			+ "</script>")
	public boolean saveBatchUserRoles(@Param("roles") ArrayList<Role> roles, @Param("user_id") int userId);
	
}
