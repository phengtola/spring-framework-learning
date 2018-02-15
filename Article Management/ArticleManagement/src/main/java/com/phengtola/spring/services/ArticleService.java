package com.phengtola.spring.services;

import java.util.List;

import com.phengtola.spring.entities.Article;
import com.phengtola.spring.entities.filters.ArticleFilter;
import com.phengtola.spring.entities.responses.Pagination;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public interface ArticleService {

	boolean save(Article article);
	List<Article> findAllArticle(Pagination pagination);
	List<Article> articleFilter(ArticleFilter article);
	int countAllArticle();


	
}
