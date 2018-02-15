package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.Category;

/**
 * 
 * @author Tola Created Date: 2017/07/03
 *
 */
@Repository
public interface CategoryRepository {

	
	Category findByUUID(String uuid);
	
	
	List<Category> findAll();
	
	boolean update(Category category);
	
	boolean delete(String uuid);

	boolean updateStatusByUUID(@Param("status")String status, @Param("uuid")String uuid);
	
	
	boolean save(@Param("category") Category category);
	
}
