package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.Article;
import com.phengtola.spring.entities.File;
import com.phengtola.spring.entities.Tag;
import com.phengtola.spring.entities.filters.ArticleFilter;
import com.phengtola.spring.repositories.sql.ArticleSQLBuilder;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
@Repository
public interface ArticleRepository{

	/**
	 * Inser Article and return id
	 * @param article
	 * @return
	 */
	@Insert("INSERT INTO articles ("
			+ "	title,"
			+ "	content,"
			+ "	user_id,"
			+ "	category_id,"
			+ "	status,"
			+ "	uuid"
			+ ") VALUES ("
			+ "	#{a.title},"
			+ "	#{a.content},"
			+ "	#{a.user.id},"
			+ "	#{a.category.id},"
			+ "	#{a.status},"
			+ "	#{a.uuid}"
			+ ");")
	@SelectKey(
			statement="SELECT last_value FROM articles_id_seq", 
			keyProperty="a.id", 
			keyColumn="last_value", 
			before=false, 
			resultType=int.class)
	boolean save(@Param("a") Article article);
	
	/**
	 * Find Article by status
	 * @param status
	 * @return
	 */
	@Select("SELECT "
			+ " A.id,"
			+ " A.title,"
			+ " A.content,"
			+ " A.viewed,"
			+ " A.shared,"
			+ " A.user_id,"
			+ " A.category_id,"
			+ " A.created_date,"
			+ " A.index,"
			+ " A.uuid,"
			+ " U.username,"
			+ " U.id as user_id,"
			+ " C.id as category_id,"
			+ " C.name as category_name"
		+ " FROM"
			+ " articles A INNER JOIN users U ON A.user_id = U.id"
			+ " INNER JOIN categories C ON A.category_id = C.id"
		+ " WHERE A.status='1';")
	@Results(value={
			@Result(property="createdDate", column="created_date"),
			@Result(property="user.id", column="user_id"),
			@Result(property="user.username", column="username"),
			@Result(property="category.name", column="category_name"),
			@Result(property="category.id" , column="category_id"),
			@Result(property="files", column="id",
					many = @Many(select  = "findAllArticleFileByArticleId")
			),
			@Result(property="tags" , column="id", 
					many = @Many(select = "findAllArticleTageByArticleId")
			)
	})
	List<Article> findAllArticleByStatus(@Param("status") String status);
	
	/**
	 * Find Article files
	 * @param fileId
	 * @return
	 */
	@Select("SELECT "
			+ "	owner_id, "
			+ "	path, "
			+ "	size, "
			+ "	type, "
			+ "	created_date, "
			+ "	uuid  "
			+ "FROM "
			+ "	files "
			+ "WHERE "
			+ "	owner_id=#{a_id} AND "
			+ "	status='1' AND "
			+ "	type='article_image' ")
	@Results(value={
			@Result(property="ownerId",column="owner_id"),
			@Result(property="createdDate",column="created_date")
	})
	List<File> findAllArticleFileByArticleId(@Param("a_id") int articleId);
	
	/**
	 * Find Tags of a article
	 * @param articleId
	 * @return
	 */
	@Select("SELECT "
			+ "		AT.tag_id as id,"
			+ "		T.name"
			+ "	FROM "
			+ "		article_tags AT INNER JOIN tags T ON AT.tag_id = T.id"
			+ "	WHERE AT.article_id = #{a_id}")
	List<Tag> findAllArticleTageByArticleId(@Param("a_id") int articleId);
	
	@SelectProvider(type = ArticleSQLBuilder.class , method="articleFilter")
	@Results(value={
			@Result(property="createdDate", column="created_date"),
			@Result(property="user.id", column="user_id"),
			@Result(property="user.username", column="username"),
			@Result(property="category.name", column="category_name"),
			@Result(property="category.id" , column="category_id"),
			@Result(property="files", column="id",
					many = @Many(select  = "findAllArticleFileByArticleId")
			),
			@Result(property="tags" , column="id", 
					many = @Many(select = "findAllArticleTageByArticleId")
			)
	})
	List<Article> articleFilter(@Param("article") ArticleFilter article);
}
