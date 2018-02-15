package com.kshrd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * Created by tolapheng on 7/17/17.
 */
@SpringBootApplication
public class WebUiSpringBootApplication  extends SpringBootServletInitializer{


    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(WebUiSpringBootApplication.class);
    }


    public static void main(String[] args){
        SpringApplication.run(WebUiSpringBootApplication.class , args);
    }
}
