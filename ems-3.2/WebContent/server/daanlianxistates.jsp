<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>

<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>

<%
response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);
String timuId = request.getParameter("id");
PaperModel paper = paperManager.findPaperById(examtime.getP_id(),timuId);
String answer = paper.getAnswer();
System.out.println("题目ID：" + timuId + "；题目答案：" + answer + ";daanlianxistates.jsp被调用");
response.getWriter().write("<msg>answer<msg>" + answer + "</msg></msg>");
%>