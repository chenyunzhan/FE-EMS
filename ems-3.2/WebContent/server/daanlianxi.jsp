<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>

<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>

<%!
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("ISO-8859-1");
			s = new String(bb);
		}
		catch(Exception e){}
		return s;
	}
%>

<%
response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);

String tiMuid = request.getParameter("id");
String useranswer = handleString(request.getParameter("answer"));
if(useranswer == null){
	useranswer = " ";
}

//System.out.println("�û���" + useranswer);

PaperModel paper = paperManager.findPaperById(examtime.getP_id(),tiMuid);
String answer = paper.getAnswer();
int flag = 0;
if(useranswer.equals(answer)){
	flag = 1;
}
else{
	flag = 0;
}
//System.out.println("��ĿdeID: " +tiMuid + "; ��Ŀ��: " + answer + "; danan.jsp������");
response.getWriter().write("<msg><msg>" + flag + "</msg></msg>");
%>