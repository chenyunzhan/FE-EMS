package com.ems.fe.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 管理员过滤器
 * @author 陈云展
 *
 */
public class AuthFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		HttpSession session = request.getSession(false);
		
		String requestURI = request.getRequestURI();
		
		String currentURI = requestURI.substring(requestURI.indexOf("/", 10), requestURI.length());
		//System.out.println(currentURI);
		if(!"/login.jsp".equals(currentURI)&&!"/blank.html".equals(currentURI)){
			if(session == null || session.getAttribute("admin") == null){
				response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
				return;
			}
		}
		
		filterChain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
