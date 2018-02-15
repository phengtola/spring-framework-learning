package com.phengtola.spring.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MvcConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {

		// Front Pages
		registry.addViewController("/").setViewName("/home");
		registry.addViewController("/home").setViewName("/home");
		registry.addViewController("/about").setViewName("/about");
		registry.addViewController("/article").setViewName("/article");
		
		// Article Detail Page - Required Login
		//registry.addViewController("/login").setViewName("/login");
		
		registry.addViewController("/article/{uuid}").setViewName("/article-detail");

		// Admin Pages - Required Login
		registry.addViewController("/admin").setViewName("/admin/dashboard");
		registry.addViewController("/admin/dashboard").setViewName("/admin/dashboard");
		registry.addViewController("/admin/category").setViewName("/admin/category");
		registry.addViewController("/admin/user").setViewName("/admin/user");
		registry.addViewController("/admin/article").setViewName("/admin/article");

	}

}
