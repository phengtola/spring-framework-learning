package com.phengtola.spring.repositories;

import org.apache.ibatis.annotations.Select;

import com.phengtola.spring.entities.Category;

public interface CommentRepository {

	@Select("SELECT "
			+ "	name, "
			+ "	uuid, "
			+ "	(select count(*) from articles where uuid=uuid) as total_article "
		+ "	FROM "
			+ "	categories "
		+ " WHERE "
			+ "	uuid=#{uuid};")
	Category findByUUID(String uuid);
	
}
