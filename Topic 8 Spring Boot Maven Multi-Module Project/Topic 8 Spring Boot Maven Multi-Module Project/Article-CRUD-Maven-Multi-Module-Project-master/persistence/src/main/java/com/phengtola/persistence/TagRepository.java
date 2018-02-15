package com.phengtola.persistence;

import java.util.List;

import com.phengtola.domain.Tag;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


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
	boolean saveTags(@Param("tags") List<Tag> tags, @Param("a") int articleId);
	
}
