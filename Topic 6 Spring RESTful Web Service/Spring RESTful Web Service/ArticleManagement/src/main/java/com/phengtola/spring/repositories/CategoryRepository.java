package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.Category;

@Repository
public interface CategoryRepository {

	@Select("SELECT "
			+ "	name, "
			+ "	uuid, "
			+ "	(select count(*) from articles where uuid=uuid) as total_article "
		+ "	FROM "
			+ "	categories "
		+ " WHERE "
			+ "	uuid=#{uuid};")
	Category findByUUID(String uuid);
	
	@Select("SELECT "
			+ "	name, "
			+ "	uuid, "
			+ "	(select count(*) from articles where uuid=uuid) as total_article "
		+ " FROM "
			+ "	categories "
		+ "	ORDER BY id DESC ")
		//+ "	LIMIT #{pagination.limit} OFFSET #{pagination.offset};")
	List<Category> findAll();
	
	@Update("UPDATE categories SET name, remark, status, index WHERE uuid=#{category.uuid}")
	boolean update(Category category);
	
	@Update("DELETE FROM categories WHERE uuid=#{uuid}")
	boolean delete(String uuid);

	@Update("UPDATE categories SET status=#{status} WHERE uuid=#{uuid}")
	boolean updateStatusByUUID(@Param("status")String status, @Param("uuid")String uuid);
	
	@Insert("INSERT INTO categories ( "
			+ "	name, remark, status, uuid"
			+ " )VALUES("
			+ " #{category.name}, #{category.remark}, "
			+ " #{category.status} , #{category.uuid}"
			+ " ) ")
	boolean save(@Param("category") Category category);
	
}
