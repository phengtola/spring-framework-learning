package com.phengtola.configurations;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
@Configuration
//@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// Swagger
		registry.addViewController("/docs/api/v1").setViewName("/swagger/swagger-ui");
		registry.addViewController("/swagger-ui.html").setViewName("/swagger/swagger-ui");


		registry.addViewController("/error/403").setViewName("/error/access-denied");
		registry.addViewController("/404").setViewName("/error/404");


	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/*
		 * Static Resources store in the project
		 */
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("classpath:/static/");
		/*
		 * Static Resources store outside the project
		 */
		registry.addResourceHandler("/files/**")
				.addResourceLocations("file:/opt/FILES_MANAGEMENT/images/");
	}


	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
				.allowedMethods("GET","POST","DELETE","PUT","OPTIONS","PATCH")
				//.allowedOrigins("*");
				.allowedOrigins("*");
	}




}
