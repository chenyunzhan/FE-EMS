<!-- ×÷Õß£º³ÂÔÆÕ¹ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	session.removeAttribute("admin");
	response.sendRedirect("admin/login.jsp");
%>
