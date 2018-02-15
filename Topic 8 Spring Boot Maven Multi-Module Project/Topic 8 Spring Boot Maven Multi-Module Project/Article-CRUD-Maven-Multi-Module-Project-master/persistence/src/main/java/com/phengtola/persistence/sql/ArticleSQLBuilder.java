package com.phengtola.persistence.sql;

import com.phengtola.domain.filters.ArticleFilter;
import org.apache.ibatis.annotations.Param;


/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public class ArticleSQLBuilder {
	
	public static String articleFilter(@Param("article")ArticleFilter article){
		 StringBuffer buffer = new StringBuffer();
		    buffer.append("SELECT "
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
							+ " INNER JOIN categories C ON A.category_id = C.id ");
			if(!article.getTitle().equals("") || article.getTitle() != null){
		        buffer.append("WHERE A.title LIKE '%' || #{article.title} || '%' ");
		    } 
		    return buffer.toString();
	}

}
