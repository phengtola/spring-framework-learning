package com.phengtola.configurations.securities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * Created by tolapheng on 7/17/17.
 */

@Configuration
@Order(2)
public class ArticleWebSecurity extends WebSecurityConfigurerAdapter{

    // Success Handler
    private CustomSuccessHandler customSuccessHandler;

    // AccessDenied Handler
    private AccessDeniedHandler accessDeniedHandler;

    //Failure Handler
    private CustomFailureHandler customFailureHandler;

    @Autowired
    public ArticleWebSecurity(
            @Qualifier("customSuccessHandler")
                    CustomSuccessHandler customSuccessHandler,
            @Qualifier("customAccesDeniedHandler")
                    AccessDeniedHandler accessDeniedHandler) {
        this.customSuccessHandler = customSuccessHandler;
        this.accessDeniedHandler = accessDeniedHandler;
        this.customFailureHandler = customFailureHandler;
    }

    /***
     * - "/","/home","/about","/article" : Allow all requests
     * - Role admin allow to access "/admin/**"
     * - Role user allow to access "/article/**"
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/docs/api/v1").hasAnyRole("API_DEV")
                .and()
                .formLogin()
                .successHandler(customSuccessHandler)
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .and()
                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    }




    /**
     * Create in memory users:
     * + User 1:
     * 	- Username: user
     * 	- Password: 123
     * 	- Roles: USER
     * + User 2:
     * 	- Username: admin
     * 	- Password: 123
     *  - Roles: USER and ADMIN
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                .withUser("swagger").password("123456").roles("API_DEV");
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
        web.ignoring().antMatchers("/static/**");
    }


}