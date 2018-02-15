package com.kshrd.mybatis.repositories;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;


@Repository
public interface StudentRepository {

	@Insert("INSERT INTO students("
			+ "	name,"
			+ "	gender,"
			+ "	major) VALUES ("
			+ "	'tola',"
			+ "	'F',"
			+ "	'IT'"
			+ ")")
	public boolean save();
	
}

