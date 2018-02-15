package com.phengtola.spring.controllers.rest;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phengtola.spring.entities.Category;
import com.phengtola.spring.entities.form.CategoryFrmPP;
import com.phengtola.spring.entities.responses.HttpMessage;
import com.phengtola.spring.entities.responses.Response;
import com.phengtola.spring.entities.responses.ResponseHttpStatus;
import com.phengtola.spring.entities.responses.ResponseList;
import com.phengtola.spring.entities.responses.ResponseRecord;
import com.phengtola.spring.entities.responses.Table;
import com.phengtola.spring.entities.responses.Transaction;
import com.phengtola.spring.entities.responses.failure.ResponseFailure;
import com.phengtola.spring.entities.responses.failure.ResponseListFailure;
import com.phengtola.spring.entities.responses.failure.ResponseRecordFailure;
import com.phengtola.spring.services.CategoryService;

/**
 * 
 * @author tolapheng
 * Created Date: 05 July 2017
 */

@RestController
@RequestMapping("/v2/api/category")
public class CategoryRControllerV2 {

	private HttpStatus httpStatus = HttpStatus.OK;
	private CategoryService categoryService;
	
	/**
	 * 
	 * @param categoryService
	 */
	@Autowired
	public CategoryRControllerV2(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@GetMapping
	public ResponseEntity<ResponseList<Category>> findAll(){
		ResponseList<Category> responseList = new ResponseList<Category>();
		try{
			List<Category> categories = categoryService.findAll();
			if(!categories.isEmpty()){
				responseList = new ResponseList<Category>(
						HttpMessage.success(Table.CATEGORIES, Transaction.Success.RETRIEVE),  // message
						true,  // status 
						categories,  // data
						null); // pagination
			}else{
				httpStatus = HttpStatus.NOT_FOUND;
				responseList = new ResponseListFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.RETRIEVE), // message
						false, // status 
						ResponseHttpStatus.RECORD_NOT_FOUND // error
						);
			}
		}catch(Exception  e){
			e.printStackTrace();
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
			responseList = new ResponseListFailure<Category>(
					HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.RETRIEVE),
					false,
					ResponseHttpStatus.INTERNAL_SERVER_ERROR
					);
		}
		return new ResponseEntity<ResponseList<Category>>(responseList, httpStatus);
	}
	
	@GetMapping("/{uuid}")
	public ResponseEntity<ResponseRecord<Category>> findbyUUID(
			@PathVariable("uuid") String uuid
			){
		
		ResponseRecord<Category> responseRecord = new ResponseRecord<Category>();
		
		Category category = categoryService.findByUUID(uuid);
		try{
			if(category != null){
				responseRecord = new ResponseRecord<Category>(
						HttpMessage.success(Table.CATEGORIES, Transaction.Success.RETRIEVE), 
						true, 
						category);
			}else{
				httpStatus = HttpStatus.NOT_FOUND;
				responseRecord = new ResponseRecordFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.RETRIEVE), 
						false, 
						ResponseHttpStatus.RECORD_NOT_FOUND);
			}
		}catch(Exception e){
			e.printStackTrace();
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
			responseRecord = new ResponseRecordFailure<Category>(
					HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.RETRIEVE), 
					false, 
					ResponseHttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<ResponseRecord<Category>>(responseRecord, httpStatus);
	}
	
	@PostMapping
	public ResponseEntity<Response<Category>> save(
			@Valid @RequestBody CategoryFrmPP categoryFrmPP,
			BindingResult result
			){
		Response<Category> response = new Response<Category>();
		if(result.hasErrors()){
			httpStatus = HttpStatus.NOT_ACCEPTABLE;
			response = new ResponseFailure<Category>(
					HttpMessage.invalid(Table.CATEGORIES, Transaction.Fail.CREATED, result.toString()),
					false, 
					ResponseHttpStatus.BAD_REQUEST);
		}else{
			
			try{
				if(categoryService.save(categoryFrmPP)){
					response = new Response<Category>(
							HttpMessage.success(Table.CATEGORIES, Transaction.Success.CREATED), 
							true);
				}else{
					httpStatus = HttpStatus.NOT_ACCEPTABLE;
					response = new ResponseFailure<Category>(
							HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.CREATED),
							false, 
							ResponseHttpStatus.FAIL_CREATED);
				}
			}catch(Exception e){
				e.printStackTrace();
				httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
				response = new ResponseFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.CREATED),
						false, 
						ResponseHttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		}
		
		return new ResponseEntity<Response<Category>>(response , httpStatus);
	}
	
	
}



















