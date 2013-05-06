<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.model.*" %>
<%@ page import="com.fe.ems.*" %>

<jsp:useBean id="userManager" class="com.fe.ems.manager.UserManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<%
UserModel user = new UserModel();
String userId = Login.getId();
int score = Integer.parseInt(request.getParameter("score"));

System.out.println("用户ID:" +userId + " 分数:" + score);
user.setId(userId);
user.setScore(score);

System.out.println(user.getId());
System.out.println(user.getScore());
System.out.println(examtime.getP_id());

userManager.modifyScore(user,examtime.getP_id());
examtime.setAllowstates(1,userId,examtime.getP_id());
String[] str = new String[100];
examtime.setStr(str);
examtime.setAnswer(str,userId,examtime.getP_id());
//examtime.deleteUserProtectMess(user.getId(),examtime.getP_id());
response.sendRedirect("../student/index.jsp");
%>