package org.itadventure.spring.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import java.util.Collections;

@Configuration
@EnableSwagger2WebMvc
public class SpringfoxConfiguration {

    @Bean
    public Docket restApi(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("REST API (V1)")
                .select()
                .paths(PathSelectors.ant("/api/v1/**"))
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo(){
        return new ApiInfo(
                "Springfox API Specification",
                "Spring REST APIs",
                "V01",
                "www.itadventure.org",
                new Contact("IT","www.itadventure.org", "itadventure@gmail.com"),
                "Lincense of API",
                "www.itadventure.org",
                Collections.emptyList()
        );
    }


}
