package com.phengtola.spring.services;

import java.util.List;

import com.phengtola.spring.entities.Article;
import com.phengtola.spring.entities.filters.ArticleFilter;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
public interface ArticleService {

	boolean save(Article article);
	List<Article> findAllArticleByStatus(String status);
	List<Article> articleFilter(ArticleFilter article);


	
}
