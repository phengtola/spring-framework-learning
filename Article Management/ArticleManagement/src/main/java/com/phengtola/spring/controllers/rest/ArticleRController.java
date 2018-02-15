package com.phengtola.spring.controllers.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phengtola.spring.entities.Article;
import com.phengtola.spring.entities.responses.HttpMessage;
import com.phengtola.spring.entities.responses.Pagination;
import com.phengtola.spring.entities.responses.ResponseHttpStatus;
import com.phengtola.spring.entities.responses.ResponseList;
import com.phengtola.spring.entities.responses.Table;
import com.phengtola.spring.entities.responses.Transaction;
import com.phengtola.spring.entities.responses.failure.ResponseListFailure;
import com.phengtola.spring.services.ArticleService;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiResponse;
import com.wordnik.swagger.annotations.ApiResponses;

@RestController
@RequestMapping("/v2/api/article")
public class ArticleRController {

	private ArticleService articleService;
	private HttpStatus httpStatus = null;
	
	@Autowired
	public ArticleRController(ArticleService articleService) {
		this.articleService  = articleService;
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
	
}

