package com.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class SessionFilter extends OncePerRequestFilter{
	
	/**
	 * 当用户session过期，禁止用户访问特殊页面
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		//检测session是否有该用户
		if(request.getSession().getAttribute("user")==null){//未登录
			//定义游客请求接口：格式       a.do,b.do,c.do
			String sb="home,regist,login,existsuser,jobdetail,about";
			//访问游客页面，自动重定向到主页
			String uri=request.getRequestURI();
			String action=uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
			if(!sb.contains(action)){//请求了非法请求
				response.sendRedirect("/SSM/user/home.do");
				return;
			}
		}
		//登录的用户直接通过
		chain.doFilter(request, response);
	}
}
