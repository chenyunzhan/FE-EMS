<%@ page contentType="text/html;charset=GB18030" %>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>

<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);
String timuId = request.getParameter("id");
if(timuId.equals("0")){
	timuId = "1";
}

System.out.println(timuId);
System.out.println(examtime.getP_id());

PaperModel paper = paperManager.findPaperById(examtime.getP_id(),timuId);
String content = paper.getContent();
String type = paper.getType();
String str = content + "$" + type;
//System.out.println("题目ID：" + timuId + "题目内容：" + content + "题目类型：" +type + "lianxi.jsp被调用" );
response.getWriter().write(str);

%>