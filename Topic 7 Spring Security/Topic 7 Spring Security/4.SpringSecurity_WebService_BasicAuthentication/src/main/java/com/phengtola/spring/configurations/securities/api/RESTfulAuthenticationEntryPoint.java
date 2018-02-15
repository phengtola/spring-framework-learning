package com.phengtola.spring.configurations.securities.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Component("RESTfulAuthenticationEntryPoint")
public class RESTfulAuthenticationEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		
		System.out.println(auth.getMessage());
		request.setAttribute("msg", auth.getMessage());
		request.getRequestDispatcher("/401").forward(request, response);
	}

}
