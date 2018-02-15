package com.phengtola.spring.controllers.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phengtola.spring.services.CategoryService;

@Controller
@RequestMapping("/admin/category")
public class CategoryWController {

	private CategoryService categoryService;
	
	@Autowired
	public CategoryWController(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@RequestMapping
	public String categoryPage(ModelMap m){
		//m.addAttribute("categories",categoryService.findAll());
		return "/admin/category";
	}
	
	@RequestMapping("/fragment/categories")
	public String categoryFragment(ModelMap m){
		m.addAttribute("categories",categoryService.findAll());
		return "/admin/category :: categoriesList";
	}
	
}
