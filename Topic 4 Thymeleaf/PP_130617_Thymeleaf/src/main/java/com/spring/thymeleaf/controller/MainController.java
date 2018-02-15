package com.spring.thymeleaf.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/student-c" , method=RequestMethod.POST)
	@ResponseBody
	public Student studentC(@ModelAttribute Student student ){
		return student;
	}
		
	@RequestMapping("/link")
	public String link(ModelMap model){
		model.addAttribute("STUDENT_ID", 18);
		model.addAttribute("SCHOOL_ID", 5);
		return "link";
	}

	@RequestMapping("/student/{studentId}/detail/{score}")
	@ResponseBody
	public int path(
			@PathVariable("studentId") int stuId ,
			@PathVariable("score") int score
		){
		System.out.println("Student ID : " + stuId);
		System.out.println("Score : " + score);
		return stuId;
	}
	
	@RequestMapping("/student")
	@ResponseBody
	public int query(
			@RequestParam("student-id") int stuId,
			@RequestParam(name="score-id", required=false, defaultValue="199") int scoreId
		){
		System.out.println("Student ID : " + stuId);
		System.out.println("Score ID : " + scoreId);
		return stuId;
	}
	
	@RequestMapping("/school/{schoolId}/students")
	@ResponseBody
	public int studentInSchool(
			@PathVariable("schoolId") int schId,
			@RequestParam(name="page", required=false, defaultValue="1") int page,
			@RequestParam(name="limit", required=false, defaultValue="20") int limit
 		){
		System.out.println("School id : "+ schId);
		System.out.println("Page : " + page);
		System.out.println("Limit :"+ limit);
		
		return 0;
	}
	
}











