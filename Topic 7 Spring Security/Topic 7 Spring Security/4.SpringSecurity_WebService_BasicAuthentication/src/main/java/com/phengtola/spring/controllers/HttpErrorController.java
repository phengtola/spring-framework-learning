package com.phengtola.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class HttpErrorController {
	
	@RequestMapping("/403")
	public String accessDeniedPage(){
		return "errors/access-denied";
	}

}
