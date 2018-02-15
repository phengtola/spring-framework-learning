//package com.phengtola.controllers.rest;
//
//import com.phengtola.domain.Category;
//import com.phengtola.services.CategoryService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * Created by tolapheng on 7/17/17.
// */
//
//@RestController
//@RequestMapping("/api/v1/category0")
//public class CategoryRController {
//
//    private CategoryService categoryService;
//
//    @Autowired
//    public CategoryRController(CategoryService categoryService){
//           this.categoryService = categoryService;
//    }
//
//    @GetMapping
//    public Category category(){
//        return  categoryService.findByUUID("c69925e1-5203-4fa8-ba9e-8d2216b99127");
//    }
//
//}
