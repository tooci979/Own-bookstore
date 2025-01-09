package com.baidu.filter;

import com.baidu.pojo.Classify;
import com.baidu.pojo.Role;
import com.baidu.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;

@Configuration("classifyFilter")
public class ClassifyFilter implements Filter {

    @Autowired
    ClassifyService classifyService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        List<Classify> classifyAll = classifyService.getClassifyAll();
        servletRequest.setAttribute("classifys",classifyAll);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
