package com.hrd.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping({"/home" , "/index","/"})
	public String homePage(){
		System.out.println("Home Page");
		return "home";
	}
	
	@RequestMapping("/about")
	public String aboutPage(){
		return "about";
	}
	
}
