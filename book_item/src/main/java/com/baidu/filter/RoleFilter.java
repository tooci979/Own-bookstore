package com.baidu.filter;

import com.baidu.pojo.Role;
import com.baidu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.List;

@Configuration("roleFilter")
public class RoleFilter implements Filter {

    @Autowired
    RoleService roleService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        List<Role> roles = roleService.getAllRole();
        servletRequest.setAttribute("roleList",roles);
        System.out.println("getAttribute----------"+servletRequest.getAttribute("roleList"));
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
