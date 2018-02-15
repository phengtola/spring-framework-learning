package com.phengtola.spring.configurations.securities;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("customSuccessHandler")
public class CustomSuccessHandler implements AuthenticationSuccessHandler{


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		
		
		String targetUrl = determineTargetUrl(authentication);
		System.out.println(targetUrl);
		if(response.isCommitted()){
			System.out.println("Response has already been committed. Unable to redirect to " + targetUrl);
			return;
		}
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60*24);
		
		
		System.out.println("User has been logged in successfully and redirect to " + targetUrl);
		
		response.sendRedirect(targetUrl);
	}
	
	
	/**
	 * This method extracts the roles of currently logged-in user and return
	 * appropriate URL according to user's role.
	 * @param authentication
	 * @return
	 */
	public String determineTargetUrl(Authentication authentication){
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		List<String> roles = new ArrayList<String>();
		for(GrantedAuthority authority: authorities){
			System.out.println("ROLE: "+ authority.getAuthority());
			roles.add(authority.getAuthority());
		}
		if(roles.contains("ROLE_ADMIN")){
			return "/admin";
		}else if(roles.contains("ROLE_USER")){
			return "/article";
		}else{
			return "/error/403"; // Access Denied
		}
	}
	
	
	
	
}
