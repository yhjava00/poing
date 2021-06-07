package com.spring.poing.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		String login = (String) request.getSession().getAttribute("loginCheck");
		String contextPath = request.getContextPath();
		
		if(login==null) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>alert('로그인 후 이용가능한 페이지입니다.'); location.href='" + contextPath + "/main.do';</script>");
			
			out.flush();
			
			return false;
		}
		
		return true;
	}
	
}
