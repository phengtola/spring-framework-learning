package com.phengtola.spring.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {                                    
	@Bean
	public Docket api() {                
	    return new Docket(DocumentationType.SWAGGER_2)          
	      .select()
	      .apis(RequestHandlerSelectors.basePackage("com.phengtola.spring.controllers.rest"))
	      //.apis(RequestHandlerSelectors.any())
	      .paths(PathSelectors.any())
	      .build()
	      .apiInfo(apiInfo());
	}
	
	private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Spring RESTful Web Service")
                .description("Korea Software HRD Center")
                .termsOfServiceUrl("http://khmeracademy.org")
                .license("License: Spring RESTful")
                .licenseUrl("http://khmeracademy.org")
                .version("1.0")
                .contact(new Contact("Pheng Tola", "http://khmeracademy.org", "tolapheng99@gmail.com"))
                .build();
    }
	
}

