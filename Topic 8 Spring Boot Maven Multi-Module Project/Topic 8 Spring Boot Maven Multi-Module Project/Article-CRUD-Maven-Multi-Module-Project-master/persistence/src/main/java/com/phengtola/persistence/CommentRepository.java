package com.phengtola.persistence;

import com.phengtola.domain.Category;
import org.apache.ibatis.annotations.Select;


public interface CommentRepository {

	@Select("SELECT "
			+ "	name, "
			+ "	uuid, "
			+ " status,"
			+ "	(select count(*) from articles where uuid=uuid) as total_article "
		+ "	FROM "
			+ "	categories "
		+ " WHERE "
			+ "	uuid=#{uuid};")
	Category findByUUID(String uuid);
	
}
