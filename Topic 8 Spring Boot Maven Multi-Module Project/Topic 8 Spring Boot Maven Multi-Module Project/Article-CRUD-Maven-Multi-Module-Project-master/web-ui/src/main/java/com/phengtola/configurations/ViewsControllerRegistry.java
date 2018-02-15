package com.phengtola.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by tolapheng on 7/17/17.
 */
@Configuration
public class ViewsControllerRegistry extends WebMvcConfigurerAdapter{


    @Override
    public void addViewControllers(ViewControllerRegistry registry) {

        registry.addViewController("/").setViewName("/home");
        registry.addViewController("/home").setViewName("/home");
        registry.addViewController("/article").setViewName("/article");
        registry.addViewController("/article/9ed8dd14-9cf1-40e0-a108-da80184ae1ad").setViewName("/article-detail");




        // Back End
        registry.addViewController("/admin").setViewName("/admin/dashboard");
        registry.addViewController("/admin/dashboard").setViewName("/admin/dashboard");
        registry.addViewController("/admin/article").setViewName("/admin/article");
        registry.addViewController("/admin/category").setViewName("/admin/category");

    }
}
