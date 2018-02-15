package com.phengtola.persistence;

import java.util.List;

import com.phengtola.domain.Category;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;



@Repository
public interface CategoryRepository {

	@Select("SELECT "
			+ "	C.name, "
			+ "	C.uuid, "
			+ " C.status,"
			+ " C.index,"
			+ " C.created_date,"
			+ " C.remark,"
			+ "	(select count(A.*) from articles A where A.category_id=C.id) as total_article "
		+ " FROM "
			+ "	categories C"
		+ " WHERE "
			+ "	C.uuid=#{uuid}"	
		+ "	ORDER BY C.id DESC")
	@Results(value={
			@Result(property="createdDate",column="created_date"),
			@Result(property="countArticle",column="total_article")
	})
	Category findByUUID(String uuid);
	
	@Select("SELECT "
			+ "	C.name, "
			+ "	C.uuid, "
			+ " C.status,"
			+ " C.index,"
			+ " C.remark,"
			+ " C.created_date,"
			+ "	(select count(A.*) from articles A where A.category_id=C.id) as total_article "
		+ " FROM "
			+ "	categories C"
		+ "	ORDER BY C.id DESC ")
		//+ "	LIMIT #{pagination.limit} OFFSET #{pagination.offset};")
	@Results(value={
			@Result(property="createdDate",column="created_date"),
			@Result(property="countArticle",column="total_article")
	})
	List<Category> findAll();
	
	@Update("UPDATE categories SET name=#{name}, remark=#{remark}, status=#{status}, index=#{index} WHERE uuid=#{uuid}")
	boolean update(Category category);
	
	@Update("DELETE FROM categories WHERE uuid=#{uuid}")
	boolean delete(String uuid);

	@Update("UPDATE categories SET status=#{status} WHERE uuid=#{uuid}")
	boolean updateStatusByUUID(@Param("status") String status, @Param("uuid") String uuid);
	
	@Insert("INSERT INTO categories ( "
			+ "	name, remark, status, uuid"
			+ " )VALUES("
			+ " #{category.name}, #{category.remark}, "
			+ " #{category.status} , #{category.uuid}"
			+ " ) ")
	boolean save(@Param("category") Category category);
	
}
