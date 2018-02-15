package com.kshrd.mybatis.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.kshrd.mybatis.entities.Role;
import com.kshrd.mybatis.entities.User;


@Repository
public interface UserRepository {

	@Select("SELECT "
			+ "	id, "
			+ "	username, "
			+ "	password,"
			+ "	email, "
			+ "	gender, "
			+ "	status, "
			+ "	user_hash "
			+ "FROM "
			+ "	users")
	@Results(value={
			@Result(property="userHash", column="user_hash")
	})
	public ArrayList<User> findAll();
	
	
	
	
	
	@Select("SELECT "
			+ "	id, "
			+ "	username, "
			+ "	password,"
			+ "	email, "
			+ "	gender, "
			+ "	status, "
			+ " password,"
			+ "	user_hash "
			+ "FROM "
			+ "	users WHERE user_hash=#{userHash}")
	@Results(value={
			@Result(property="userHash", column="user_hash")
	})
	public User findOne(String userHash);
	
	@Insert("INSERT INTO users("
			+ "	username,"
			+ "	email,"
			+ "	password,"
			+ "	gender,"
			+ "	user_hash) VALUES ("
			+ "	#{u.username},"
			+ "	#{u.email},"
			+ "	#{u.password},"
			+ "	#{u.gender},"
			+ "	#{u.userHash}"
			+ ")")
	public boolean save(@Param("u") User user);
	
	@Update("UPDATE users SET "
			+ "	username=#{u.username},"
			+ "	password=#{u.password},"
			+ "	email=#{u.email},"
			+ "	gender=#{u.gender}"
			+ "	WHERE user_hash=#{u.userHash}")
	public boolean update(@Param("u") User user);

	@Delete("DELETE FROM users WHERE user_hash=#{user_hash}")
	public boolean delete(@Param("user_hash") String userHash);

	

	
	
	

	/**
	 * Return many user objects with university object
	 * @return
	 */
	@Select("SELECT "
			+ "	U.id,"
			+ "	U.email,"
			+ "	U.username,"
			+ "	U.gender,"
			+ "	U.status,"
			+ "	U.user_hash as userHash,"
			+ "	UNI.id as university_id,"
			+ "	UNI.university_name "
			+ "	FROM "
			+ "		users U "
			+ "	INNER JOIN universities UNI "
			+ "	ON U.university_id = UNI.id")
	@Results(value={
			//@Result(property="userHash", column="user_hash")
			@Result(property="university.id" , column="university_id"),
			@Result(property="university.universityName", column="university_name")
	})
	public ArrayList<User> findAllWithUniversity();
	
	
	/**
	 * Return many user objects with many user roles
	 * @return
	 */
	@Select("SELECT "
			+ "	U.id as user_id,"
			+ "	U.email,"
			+ "	U.username,"
			+ "	U.gender,"
			+ "	U.status,"
			+ "	U.user_hash as userHash,"
			+ "	UNI.id as university_id,"
			+ "	UNI.university_name "
			+ "	FROM "
			+ "		users U "
			+ "	INNER JOIN universities UNI "
			+ "	ON U.university_id = UNI.id")
	@Results(value={
			//@Result(property="userHash", column="user_hash")
			@Result(property="id", column="user_id"),
			@Result(property="university.id" , column="university_id"),
			@Result(property="roles", column="user_id", 
				many=@Many(select="findRolesByUserId")
			)
	})
	public ArrayList<User> findAllWithUniversityAndRoles();
	
	@Select("SELECT "
			+ "	R.id , "
			+ "	R.role_name as roleName "
			+ "FROM user_roles UR "
			+ "INNER JOIN roles R "
			+ "ON UR.role_id = R.id "
			+ "WHERE "
			+ "	UR.user_id=#{user_id}")
	//@Results()
	public ArrayList<Role> findRolesByUserId(@Param("user_id") int userId);
	
	/**
	 * Return auto increment id after inserted
	 * @param user
	 * @return
	 */
	@Insert("INSERT INTO users("
			+ "	username,"
			+ "	email,"
			+ "	password,"
			+ "	gender,"
			+ "	user_hash) VALUES ("
			+ "	#{u.username},"
			+ "	#{u.email},"
			+ "	#{u.password},"
			+ "	#{u.gender},"
			+ "	#{u.userHash}"
			+ ")")
	@SelectKey(
			statement="SELECT last_value FROM users_id_seq",
			keyProperty="u.id",
			keyColumn="last_value",
			before=false,
			resultType=int.class
	)
	public boolean saveUserAndReturnID(@Param("u") User user);

}

