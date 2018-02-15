package com.phengtola.controllers.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.phengtola.domain.Article;
import com.phengtola.domain.Category;
import com.phengtola.domain.responses.*;
import com.phengtola.domain.responses.failure.ResponseListFailure;
import com.phengtola.services.ArticleService;
import com.phengtola.services.CategoryService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.codehaus.groovy.runtime.metaclass.ConcurrentReaderHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/article")
public class ArticleRController {

	private ArticleService articleService;
	private CategoryService categoryService;

	private HttpStatus httpStatus = null;
	
	@Autowired
	public ArticleRController(ArticleService articleService,CategoryService categoryService) {

		this.articleService  = articleService;
		this.categoryService = categoryService;
	}

	@GetMapping(value="" , headers = "Accept=application/json")
	@ApiOperation(value="View list of Article")
	@ApiResponses(value={
			@ApiResponse(code=200,message="Successfully retrieved list"),
			@ApiResponse(code=401,message="You are not authorized to view the resource")
	})
	public ResponseEntity<ResponseList<Article>> findAllV2(
			@RequestParam(value="page", required=false , defaultValue="1") int page,
			@RequestParam(value="limit", required=false , defaultValue="20") int limit
		){
		ResponseList<Article> responseList = new ResponseList<Article>();
		try{
			Pagination pagination = new Pagination();
			pagination.setLimit(limit);
			pagination.setPage(page);
			
			pagination.setTotalCount(articleService.countAllArticle());
			
			pagination.setTotalPages(pagination.getTotalPages());
			
			System.out.println("Total Articles: " + articleService.countAllArticle());
			System.out.println("Total Pages: " + pagination.getTotalPages());

			
			List<Article> articles = articleService.findAllArticle(pagination);
			if(!articles.isEmpty()){
				httpStatus = HttpStatus.OK;
				responseList = new ResponseList<Article>(
						HttpMessage.success(Table.ARTICLE, Transaction.Success.RETRIEVE),  // message
						true,  // status 
						articles,  // data
						pagination); // pagination
			}else{
				httpStatus = HttpStatus.NOT_FOUND;
				responseList = new ResponseListFailure<Article>(
						HttpMessage.fail(Table.ARTICLE, Transaction.Fail.RETRIEVE), // message
						false, // status 
						ResponseHttpStatus.RECORD_NOT_FOUND // error
						);
			}
		}catch(Exception  e){
			e.printStackTrace();
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
			responseList = new ResponseListFailure<Article>(
					HttpMessage.fail(Table.ARTICLE, Transaction.Fail.RETRIEVE),
					false,
					ResponseHttpStatus.INTERNAL_SERVER_ERROR
					);
		}
		return new ResponseEntity<ResponseList<Article>>(responseList, httpStatus);
	}


	@GetMapping(value="/aritcles-categories" , headers = "Accept=application/json")
	@ApiOperation(value="List Articles and List Categories")
	public ResponseEntity<ResponseRecord<Map<String, Object>>> findArticlesAndCategories(
			@RequestParam(value="page", required=false , defaultValue="1") int page,
			@RequestParam(value="limit", required=false , defaultValue="20") int limit
	){
		ResponseRecord<Map<String, Object>> responseMap = new ResponseRecord<Map<String, Object>>();
		try {

			// List Category
			List<Category> categories = categoryService.findAll();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("categories", categories);

			// List Article by Pagination
			Pagination pagination = new Pagination();
			pagination.setLimit(limit);
			pagination.setPage(page);

			pagination.setTotalCount(articleService.countAllArticle());

			pagination.setTotalPages(pagination.getTotalPages());

			System.out.println("Total Articles: " + articleService.countAllArticle());
			System.out.println("Total Pages: " + pagination.getTotalPages());


			List<Article> articles = articleService.findAllArticle(pagination);
			map.put("articles" , articles);

			if(!articles.isEmpty()){
				httpStatus = HttpStatus.OK;
				responseMap = new ResponseRecord<Map<String, Object>>(
					HttpMessage.success(Table.ARTICLE, Transaction.Success.RETRIEVE),true,map
				);
			}else{
				httpStatus = HttpStatus.NOT_FOUND;
				responseMap = new ResponseRecord<Map<String, Object>>(
						HttpMessage.success(Table.ARTICLE , Transaction.Fail.RETRIEVE), false , null
				);
			}
		}catch(Exception  e){
			e.printStackTrace();
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
			responseMap = null;
		}
		return new ResponseEntity<ResponseRecord<Map<String, Object>>>(responseMap, httpStatus);
	}
}

