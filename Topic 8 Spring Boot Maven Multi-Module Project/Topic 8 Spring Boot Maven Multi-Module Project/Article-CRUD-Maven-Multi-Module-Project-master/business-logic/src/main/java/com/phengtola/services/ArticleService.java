package com.phengtola.services;

import com.phengtola.domain.Article;
import com.phengtola.domain.filters.ArticleFilter;
import com.phengtola.domain.responses.Pagination;

import java.util.List;

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
