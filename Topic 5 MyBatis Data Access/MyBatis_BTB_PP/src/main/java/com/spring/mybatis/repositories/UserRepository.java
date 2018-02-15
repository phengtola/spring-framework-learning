package com.spring.mybatis.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.mybatis.model.User;

@Repository
public interface UserRepository {

	@Select("SELECT "
			+ "	U.id, "
			+ "	U.username, "
			+ "	U.email, "
			+ "	U.password, "
			+ "	U.gender, "
			+ "	U.user_hash,"
			+ "	S.id as sid,"
			+ "	S.device_name "
			+ " FROM "
			+ "	users U INNER JOIN signup_with S ON U.signup_with_id = S.id")
	@Results(value={
			@Result(property="userHash" , column="user_hash"),
			@Result(property="signUpWith.id", column="sid"),
			@Result(property="signUpWith.deviceName", column="device_name")
	})
	public List<User> findAll();
	
	/**
	 * Save user to database
	 * @param user
	 * @return
	 */
	@Insert("INSERT INTO users ("
			+ "	username, "
			+ "	email, "
			+ "	password, "
			+ "	gender, "
			+ "	user_hash"
			+ "	) VALUES ("
			+ "	#{user.username},"
			+ "	#{user.email},"
			+ "	#{user.password},"
			+ "	#{user.gender},"
			+ "	#{user.userHash} "
			+ ")")
	@SelectKey(
			statement="SELECT last_value FROM users_id_seq",
			keyProperty="user.id", keyColumn="last_value",
			before=false,
			resultType=int.class
	)
	public boolean save(@Param("user") User user);
	
	@Delete("DELETE FROM users WHERE user_hash=#{user_hash}")
	public boolean delete(@Param("user_hash") String userHash);
	
	
	@Update("UPDATE users SET "
			+ "username=#{user.username},"
			+ "email=#{user.email},"
			+ "password=#{user.password},"
			+ "gender=#{user.gender}"
			+ " WHERE user_hash=#{user.userHash}")
	public boolean update(@Param("user") User user);
	
	
	@Insert("<script>"
			+ "	INSERT INTO users ("
			+ "		username, "
			+ "		email, "
			+ "		password, "
			+ "		gender"
			+ "	) VALUES "
			+ " <foreach collection='users' item='user' separator=','>("
			+ "	#{user.username},"
			+ "	#{user.email},"
			+ "	#{user.password},"
			+ "	#{user.gender}"
			+ "	) "
			+ "</foreach>"
			+ "</script>")
	public boolean saveBatch(@Param("users") List<User> users);








}
