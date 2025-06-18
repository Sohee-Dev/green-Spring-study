package com.example.jjwt01.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.jjwt01.controller.JwtUserController;
import com.example.jjwt01.utils.JWTUtil;

@Configuration
public class FilterConfig {

	
	@Bean
	public FilterRegistrationBean<JwtAuthFilter> jwtFilter(JWTUtil jwtutil){
		FilterRegistrationBean<JwtAuthFilter> registrationBean = new FilterRegistrationBean<>();
		
		registrationBean.setFilter(new JwtAuthFilter(jwtutil));
		registrationBean.addUrlPatterns("/user");
		registrationBean.setOrder(1);
		
		
		
		return registrationBean;
	}
}
