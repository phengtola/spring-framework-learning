package com.phengtola.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phengtola.spring.entities.Article;
import com.phengtola.spring.entities.filters.ArticleFilter;
import com.phengtola.spring.services.ArticleService;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
@Controller
//@RequestMapping("/article")
public class ArticleController {

	private ArticleService articleService;
	
	@Autowired
	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@ResponseBody
	@RequestMapping(value="/find-all-by-status", method = RequestMethod.GET)
	public List<Article> findAllByStatus(){
		return articleService.findAllArticleByStatus("1");
	}
	
	@ResponseBody
	@RequestMapping(value={"/filter"}, method = RequestMethod.POST)
	public List<Article> articleFilter(@RequestBody ArticleFilter articleFilter){
		return articleService.articleFilter(articleFilter);
	}
	
	@ResponseBody
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public boolean save(@RequestBody Article article){
		return articleService.save(article);
	}
	
}
