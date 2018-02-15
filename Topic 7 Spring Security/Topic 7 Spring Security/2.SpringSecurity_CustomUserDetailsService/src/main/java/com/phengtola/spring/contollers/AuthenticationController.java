package com.phengtola.spring.contollers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthenticationController {

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse reponse){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null){
			new SecurityContextLogoutHandler().logout(request, reponse, auth);
		}
		return "redirect:/login?logout";
	}
	
	@RequestMapping("/login")
	public String loginPage(ModelMap model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!auth.getPrincipal().equals("anonymousUser")){
			System.out.println(auth.getPrincipal());
			model.addAttribute("logged",true);
			return "redirect:/home";
		}
		return "login";
	}
	
}

