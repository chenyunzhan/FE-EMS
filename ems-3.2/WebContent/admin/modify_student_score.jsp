<!-- ���ߣ�����չ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%
	String scoreId = request.getParameter("scoreId");
	String pageNo = request.getParameter("pageNo");
	String command = request.getParameter("command");
	String sGrade = request.getParameter("sGrade");
	String sDepartmentId = request.getParameter("sDepartmentId");
	String sClasses = request.getParameter("sClasses");
	String search = request.getParameter("search");
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
	if(command != null && "modify".equals(command)){
		Score score = new Score();
		score.setScoreId(scoreId);
		score.setPaperId(request.getParameter("paperId"));
		score.setStudentId(request.getParameter("studentId"));
		score.setScore(Integer.parseInt(request.getParameter("score")));
		adminService.modifyScore(score);
		out.println("�����޸ĳɹ���");
	}
	Score score = adminService.findScore(scoreId);
	ExamPaper examPaper = adminService.findPaperByPid(score.getPaperId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�ѧ������</title>
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
function modifyScore() {
	//alert(scoreForm.score.value);
	if (scoreForm.score.value == "") {
		alert("���÷����������룡");
		scoreForm.score.focus();
		return;
	}
	
	with(document.forms[0]){
		action = "modify_student_score.jsp?command=modify";
		method = "post";
		submit();
	}
}
function goBack() {
	window.self.location = "all_student_score.jsp?pageNo=<%=pageNo%>";
}
</script>
</head>

<body>
<form name="scoreForm">
<input type="hidden" name="pageNo" value="<%=pageNo %>"/>
	<input value="<%=scoreId %>" name="scoreId" type="hidden"/>
	<input name="sGrade" value="<%=sGrade %>" type="hidden"/>
	<input name="sDepartmentId" value="<%=sDepartmentId %>" type="hidden"/>
	<input name="sClasses" value="<%=sClasses %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">ϵͳ����&gt;&gt;�ɼ���Ϣ&gt;&gt;�޸�</div>
	<hr  style="display:block"/>
	<div style="text-align:center;">
	<table style="text-align:center;">
		<tr>
			<td>ѧ��ѧ�ţ�</td><td><input value="<%=score.getStudentId() %>" readonly="readonly"/></td>
		</tr>
		<tr>
			<td>�Ծ����ƣ�</td><td><input value="<%=examPaper.getPName() %>" readonly="readonly"/></td>
		</tr>
		<tr>
			<td>���÷�����</td><td><input value="<%=score.getScore() %>" name="score"/></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" value="�ύ" onclick="modifyScore()"/>
	&nbsp;&nbsp;<input type="button" value="����" onclick="goBack()" /></div>
</form>

</body>
</html>