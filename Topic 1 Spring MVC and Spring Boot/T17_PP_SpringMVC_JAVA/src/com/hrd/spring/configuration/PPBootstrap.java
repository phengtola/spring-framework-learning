package com.hrd.spring.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class PPBootstrap implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext container) throws ServletException {

		// 1. Create AnnotationConfigWebApplicationContext Object
		AnnotationConfigWebApplicationContext servletContext = new AnnotationConfigWebApplicationContext();
		// 2. Add the Configuration class
		servletContext.register(PPWebConfiguration.class);
		// 3. Create DispatcherServlet, add it to container, and assign it to
		// the servletRegistration
		ServletRegistration.Dynamic dispatcherServlet = container.addServlet("MyspringDispatcher",
				new DispatcherServlet(servletContext));
		
		dispatcherServlet.addMapping("/");
		
		dispatcherServlet.setLoadOnStartup(1);
		

	}

}