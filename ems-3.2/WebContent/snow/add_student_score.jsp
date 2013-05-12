<!-- ���ߣ�����չ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="java.util.*" %>
<% 	
	String studentId = "";
	String paperId = "";
	int score = 0;
	String sGrade = request.getParameter("sGrade");
	String sDepartmentId = request.getParameter("sDepartmentId");
	String sClasses = request.getParameter("sClasses");
	String search = request.getParameter("search");
	String pageNo = request.getParameter("pageNo");
	String command = request.getParameter("command");
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService"); 
	if (command != null && "add".equals(command)) {
		if (adminService.findScore(request.getParameter("paperId"), request.getParameter("studentNo")).getScore() == 0) {
			Score scores = new Score();
			scores.setPaperId(request.getParameter("paperId"));
			scores.setStudentId(request.getParameter("studentNo"));
			scores.setScore(Integer.parseInt(request.getParameter("score")));
			adminService.addScore(scores);
			studentId = request.getParameter("studentNo");
			out.println("��ӷ����ɹ���");
		}else {
			studentId = request.getParameter("studentNo");
			paperId = request.getParameter("paperId");
			score = Integer.parseInt(request.getParameter("score"));
			out.println("��ѧ���ÿη����Ѵ��ڣ�");			
		}
	}
	String querycode = "&sGrade=" + sGrade + "&sDepartmentId=" + sDepartmentId + "&sClasses=" + sClasses + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ѧ������</title>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<style type="text/css">
body,table{
    font-size:12px;
	background-image:none;
	margin-left: 0px;
 	margin-top: 0px;
}
.litte_left{
	text-indent: 100px;	
}
.big_left{
	
}
</style>
<script type="text/javascript">
function addScore() {
	if (document.getElementById("studentNo").value.length != 8){
		alert("ѧ��ѧ�ű���Ϊ8λ���֣�");
		document.getElementById("studentNo").focus();
		return;
	}
	if (document.getElementById("score").value == "" || document.getElementById("score").value.length>3){
		alert("������Ϸ�������");
		return
	}
	with (document.getElementById("scoreForm")) {
		action="add_student_score.jsp?command=add";
		method="post";
		submit();
	}
}
function goBack() {
	window.self.location = "all_student_score.jsp?pageNo=<%=pageNo%><%=querycode%>";
}
</script>
</head>

<body>
<form id="scoreForm">
	<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="sGrade" value="<%=sGrade %>" type="hidden"/>
	<input name="sDepartmentId" value="<%=sDepartmentId %>" type="hidden"/>
	<input name="sClasses" value="<%=sClasses %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">ϵͳ����&gt;&gt;��������&gt;&gt;���</div>
	<hr  style="display:block"/>
	<div align="center">
	<table style="text-align:center;">
		<tr>
			<td align="right">ѧ��ѧ�ţ�</td><td align="left"><input type="text" id="studentNo" name="studentNo" value="<%=studentId %>"/></td>
		</tr>
		<tr>
			<td align="right">�Ծ����ƣ�</td>
			<td align="left"><select name="paperId">
			<%
				List paperList = adminService.getPaperList();
				for(Iterator iter = paperList.iterator(); iter.hasNext();){
					ExamPaper examPaper = (ExamPaper)iter.next();
			%>
		    <option value="<%=examPaper.getPId() %>"><%=examPaper.getPName() %></option>
		    <%} %>
		 	</select></td>
		</tr>
		<tr>
			<td align="right">���÷�����</td><td align="left"><input name="score" id="score"/></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" value="�ύ" onclick="addScore()"/>
	&nbsp;&nbsp;<input type="button" value="����" onclick="goBack()" /></div>
</form>

</body>
</html>