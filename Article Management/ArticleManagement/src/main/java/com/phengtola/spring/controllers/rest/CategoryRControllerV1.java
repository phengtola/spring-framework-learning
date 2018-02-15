package com.phengtola.spring.controllers.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phengtola.spring.entities.Category;
import com.phengtola.spring.services.CategoryService;

import springfox.documentation.annotations.ApiIgnore;

/**
 * 
 * @author Tola Created Date: 2017/07/03
 *
 */

@RestController
@RequestMapping("/v1/api/category")
@ApiIgnore
public class CategoryRControllerV1 {

	private HttpStatus httpStatus = HttpStatus.OK;
	private Map<String , Object> map = null;
	
	private CategoryService categoryService;

	@Autowired
	public CategoryRControllerV1(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	//@ApiIgnore
	@GetMapping(headers = "Accept=application/json")
	public ResponseEntity<Map<String , Object>> findAll(){
		List<Category> categories = null;
		map = new HashMap<String , Object>();
		try{
			categories = categoryService.findAll();
			if(!categories.isEmpty()){
				map.put("data", categories);
				map.put("message", "Categories have been found.");
				map.put("status", true);
			}else{
				map.put("message", "Categories have not been found.");
				map.put("status", false);
				httpStatus = HttpStatus.NOT_FOUND;
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("status", false);
			map.put("message", "Something is broken. Please contact to developer team!");
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String,Object>>(map , httpStatus);
	}
	
	@GetMapping(value="/{uuid}" , headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> findByUUID(
			@PathVariable("uuid") String uuid
		){
		map = new HashMap<String, Object>();
		try{
			Category category = categoryService.findByUUID(uuid);
			if(category != null){
				map.put("data", category);
				map.put("message", "Category has been found.");
				map.put("status", true);
			}else{
				map.put("message", "Category has not been found.");
				map.put("status", false);
				httpStatus = HttpStatus.NOT_FOUND;
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("message", "Something is broken. Please contact to developer team!");
			map.put("status", false);
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String,Object>>(map , httpStatus);
	}
	
//	@PostMapping
//	public ResponseEntity<Map<String,Object>> save(@RequestBody Category category){
//		map = new HashMap<String,Object>();
//		try{
//			if(categoryService.save(category)){
//				map.put("message","Category has been inserted successfully.");
//				map.put("status", true);
//			}else{
//				map.put("message","Category has not been inserted successfully.");
//				map.put("status", false);
//				httpStatus = HttpStatus.NOT_FOUND;
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//			map.put("message","Some is broken. Please contact to developer team!");
//			map.put("status", false);
//			httpStatus = HttpStatus.NOT_FOUND;
//		}
//		return new ResponseEntity<Map<String,Object>>(map , httpStatus);
//	}

	@PatchMapping(value="/update/status/{status}/{uuid}" , headers = "Accept=application/json")
	public ResponseEntity<Map<String , Object>> update(
			@PathVariable("status") String status,
			@PathVariable("uuid") String uuid
			){
		map = new HashMap<String,Object>();
		try{
			if(categoryService.updateStatusByUUID(status, uuid)){
				map.put("message","Category has been updated successfully.");
				map.put("status", true);
			}else{
				map.put("message","Category has not been updated successfully.");
				map.put("status", false);
				httpStatus = HttpStatus.NOT_FOUND;
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("message","Some is broken. Please contact to developer team!");
			map.put("status", false);
			httpStatus = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String,Object>>(map , httpStatus);
	}
	
}
