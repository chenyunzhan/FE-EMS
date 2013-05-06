<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.util.Login" %>

<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />  
 
  <%
 	if(Login.isSuccess()){
 		session.invalidate();
 		response.sendRedirect("../index.jsp");
 	}
 	else{
 		response.sendRedirect("../index.jsp");
 	}
  %>

