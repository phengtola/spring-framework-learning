package com.spring.thymeleaf.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.thymeleaf.model.Student;

@Controller
public class MainController {

	@RequestMapping({"/home"})
	public String homePage(ModelMap model){
		model.addAttribute("MESSAGE","Hello <b>world</b>!");
		model.addAttribute("STUDENT", new Student(1,"Dara","O"));
		ArrayList<Student> students = new ArrayList<Student>();
		for(int i=0;i<5;i++){
			students.add(new Student(i, "name"+i, "M"));
		}
		model.addAttribute("STUDENTS", students);
		return "home";
	}
	
	
	@RequestMapping("/student-cu")
	public String studentCU(ModelMap model){
		model.addAttribute("STUDENT", new Student());
		return "student-cu";
	}
	
	@RequestMapping(value="/student-c" , method=org.springframework.web.bind.annotation.RequestMethod.POST)
	@ResponseBody
	public Student studentC(@ModelAttribute Student student ){
		return student;
	}
	
	
	
}
