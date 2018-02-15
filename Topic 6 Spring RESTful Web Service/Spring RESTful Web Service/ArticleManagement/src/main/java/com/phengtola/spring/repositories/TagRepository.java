package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.Tag;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
@Repository
public interface TagRepository {

	@Insert("<script>"
			+ "INSERT INTO article_tags ("
			+ "	article_id,"
			+ "	tag_id"
			+ ") VALUES "
			+ "<foreach collection='tags' item='t' separator=','>"
			+ "("
			+ " #{a},"
			+ "	#{t.id}"
			+ ")"
			+ "</foreach> "
			+ "</script>")
	boolean saveTags(@Param("tags")List<Tag> tags, @Param("a") int articleId);
	
}
