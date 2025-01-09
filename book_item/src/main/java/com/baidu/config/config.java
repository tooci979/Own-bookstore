package com.baidu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class config implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        System.out.println(11);
        registry.addResourceHandler("/img/**").addResourceLocations("file:E:\\1java\\book_item\\src\\main\\webapp\\img");
    }
}