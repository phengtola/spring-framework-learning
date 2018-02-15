package com.phengtola.spring.controllers.rest;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phengtola.spring.entities.Category;
import com.phengtola.spring.entities.form.CategoryAddFrm;
import com.phengtola.spring.entities.form.CategoryUpdateFrm;
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
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiResponse;
import com.wordnik.swagger.annotations.ApiResponses;

import springfox.documentation.annotations.ApiIgnore;

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
	
	/**
	 * Find all categories
	 * @return
	 */
	//@ApiIgnore
	@GetMapping(value="" , headers = "Accept=application/json")
	@ApiOperation(value="View list of category")
	@ApiResponses(value={
			@ApiResponse(code=200,message="Successfully retrieved list"),
			@ApiResponse(code=401,message="You are not authorized to view the resource")
	})
	public ResponseEntity<ResponseList<Category>> findAllV2(){
		ResponseList<Category> responseList = new ResponseList<Category>();
		try{
			List<Category> categories = categoryService.findAll();
			if(!categories.isEmpty()){
				httpStatus = HttpStatus.OK;
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
	
	/**
	 * Find one category by uuid
	 * @param uuid
	 * @return
	 */
	@GetMapping(value="/{uuid}", headers = "Accept=application/json")
	public ResponseEntity<ResponseRecord<Category>> findbyUUID(
			@PathVariable("uuid") String uuid
			){
		
		ResponseRecord<Category> responseRecord = new ResponseRecord<Category>();
		
		Category category = categoryService.findByUUID(uuid);
		try{
			if(category != null){
				httpStatus = HttpStatus.OK;
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
	
	/**
	 * Add new Category 
	 * @param categoryFrmPP
	 * @param result
	 * @return
	 */
	@PostMapping( value="", headers = "Accept=application/json")
	public ResponseEntity<Response<Category>> save(
			@Valid @RequestBody CategoryAddFrm categoryAddFrm,
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
				if(categoryService.save(categoryAddFrm)){
					httpStatus = HttpStatus.OK;
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
	
	
	@PutMapping(value="", headers = "Accept=application/json")
	public ResponseEntity<Response<Category>> update(
			@Valid @RequestBody CategoryUpdateFrm categoryUpdateFrm,
			BindingResult result
			){
		Response<Category> response = new Response<Category>();
		
		if(result.hasErrors()){
			httpStatus = HttpStatus.NOT_ACCEPTABLE;
			response = new ResponseFailure<Category>(
					HttpMessage.invalid(Table.CATEGORIES, Transaction.Fail.UPDATED, result.toString()),
					false, 
					ResponseHttpStatus.BAD_REQUEST);
		}else{
			try{
				if(categoryService.update(categoryUpdateFrm)){
					httpStatus = HttpStatus.OK;
					response = new Response<Category>(
							HttpMessage.success(Table.CATEGORIES, Transaction.Success.UPDATED), 
							true);
				}else{
					httpStatus = HttpStatus.NOT_ACCEPTABLE;
					response = new ResponseFailure<Category>(
							HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.UPDATED),
							false, 
							ResponseHttpStatus.FAIL_UPDATED);
				}
			}catch(Exception e){
				e.printStackTrace();
				httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
				response = new ResponseFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.UPDATED),
						false, 
						ResponseHttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		}
		
		return new ResponseEntity<Response<Category>>(response , httpStatus);
	}
	
	
	@PutMapping(value="/{uuid}/status/{status}", headers = "Accept=application/json")
	public ResponseEntity<Response<Category>> updateStatus(
			@PathVariable("uuid") String uuid,
			@PathVariable("status") String status
			){
		Response<Category> response = new Response<Category>();
		
		
		try{
				if(categoryService.updateStatusByUUID(status, uuid)){
					httpStatus = HttpStatus.OK;
					response = new Response<Category>(
							HttpMessage.success(Table.CATEGORIES, Transaction.Success.UPDATED), 
							true);
				}else{
					httpStatus = HttpStatus.NOT_ACCEPTABLE;
					response = new ResponseFailure<Category>(
							HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.UPDATED),
							false, 
							ResponseHttpStatus.FAIL_UPDATED);
				}
			}catch(Exception e){
				e.printStackTrace();
				httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
				response = new ResponseFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.UPDATED),
						false, 
						ResponseHttpStatus.INTERNAL_SERVER_ERROR);
		}
			
		
		
		return new ResponseEntity<Response<Category>>(response , httpStatus);
	}
	
	@DeleteMapping(value="/{uuid}", headers = "Accept=application/json")
	public ResponseEntity<Response<Category>> delete(
			@PathVariable("uuid") String uuid
			){
		Response<Category> response = new Response<Category>();
		
		try{
				if(categoryService.delete(uuid)){
					httpStatus = HttpStatus.OK;
					response = new Response<Category>(
							HttpMessage.success(Table.CATEGORIES, Transaction.Success.DELETED), 
							true);
				}else{
					httpStatus = HttpStatus.NOT_ACCEPTABLE;
					response = new ResponseFailure<Category>(
							HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.DELETED),
							false, 
							ResponseHttpStatus.FAIL_DELETED);
				}
			}catch(Exception e){
				e.printStackTrace();
				httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
				response = new ResponseFailure<Category>(
						HttpMessage.fail(Table.CATEGORIES, Transaction.Fail.DELETED),
						false, 
						ResponseHttpStatus.INTERNAL_SERVER_ERROR);
		}
			
		
		
		return new ResponseEntity<Response<Category>>(response , httpStatus);
	}
	
}



















