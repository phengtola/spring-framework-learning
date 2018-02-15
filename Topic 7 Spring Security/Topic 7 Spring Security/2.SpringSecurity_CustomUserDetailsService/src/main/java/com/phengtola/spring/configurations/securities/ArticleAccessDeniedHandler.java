package com.phengtola.spring.configurations.securities;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component("articleAccesDeniedHandler")
public class ArticleAccessDeniedHandler implements AccessDeniedHandler{

	private static Logger logger = LoggerFactory.getLogger(ArticleAccessDeniedHandler.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedEx)
			throws IOException, ServletException {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth != null){
			logger.info("Username: '" + auth.getName() + "' attempted to access the protected URL: '"+ request.getRequestURI() );
		}
		
		response.sendRedirect("/error/403");
		
	}

}
