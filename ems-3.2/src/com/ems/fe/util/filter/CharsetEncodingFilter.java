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
/**
 * ����������
 * @author ����չ
 *
 */
public class CharsetEncodingFilter implements Filter{
	
	private String encoding;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest)servletRequest;
			HttpServletResponse response = (HttpServletResponse)servletResponse;
			//request.setCharacterEncoding(this.encoding);
			if(encoding != null){
				request.setCharacterEncoding(encoding);   // ����request�ı����ʽ          
				//response.setContentType("text/html; charset="+encoding);   // ����response�ַ�����       
			}
			//System.out.println("---------filter-------begin------");
			filterChain.doFilter(request, response);
			//System.out.println("---------filter-------end------");

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.encoding = filterConfig.getInitParameter("encoding");
		System.out.println("-------init------" + this.encoding	);

	}

}
