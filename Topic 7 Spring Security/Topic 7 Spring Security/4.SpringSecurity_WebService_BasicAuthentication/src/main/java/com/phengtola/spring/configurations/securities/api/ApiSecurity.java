package com.phengtola.spring.configurations.securities.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;

@Order(1)
@Configuration
public class ApiSecurity extends WebSecurityConfigurerAdapter{

	private AuthenticationEntryPoint authenticationEntryPoint;

	@Autowired
	public ApiSecurity(
			@Qualifier("RESTfulAuthenticationEntryPoint") AuthenticationEntryPoint authenticationEntryPoint) {
		this.authenticationEntryPoint = authenticationEntryPoint;
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
			.withUser("USER").password("PWD").roles("RESTFUL_API");
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
		//web.ignoring().antMatchers("/static/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.antMatcher("/api/**")
			.authorizeRequests()
			.anyRequest()
			.hasRole("RESTFUL_API");
		// Basic Authenticatino
		http.httpBasic()
			.authenticationEntryPoint(authenticationEntryPoint);
		// Clear session after request
		http.sessionManagement()
			.sessionCreationPolicy(SessionCreationPolicy.STATELESS);

	}
}
