<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%
	String eId = request.getParameter("eId");
	String pageNo = request.getParameter("pageNo");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String course = request.getParameter("course");
	String command = request.getParameter("command");
	String search = request.getParameter("search");
	ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
	if (command != null && "modify".equals(command)) {
		ExamPaper examPaper = new ExamPaper();
		examPaper.setEAnswer(request.getParameter("eAnswer"));
		examPaper.setEContent(request.getParameter("eContent"));
		examPaper.setECourse(request.getParameter("eCourse"));
		examPaper.setEName(request.getParameter("eName"));
		examPaper.setEType(request.getParameter("eType"));
		examPaper.setPId(request.getParameter("pId"));
		examPaper.setPName(request.getParameter("pName"));
		examPaper.setEId(Integer.parseInt(request.getParameter("eId")));
		examService.modifyExamPaper(examPaper);
		out.println("修改试题成功！");
	}
	ExamPaper examPaper = examService.findExamByPid(eId);
	String querycode = "&year=" + year + "&month=" + month + "&course=" + course + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改试题</title>
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
	function goBack() {
		window.self.location = "all_paper.jsp?pageNo=<%=pageNo%><%=querycode%>";
	}
</script>
</head>

<body>
<form method="post">
	<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="command" value="modify" type="hidden"/>
	<input name="year" value="<%=year %>" type="hidden"/>
	<input name="month" value="<%=month %>" type="hidden"/>
	<input name="course" value="<%=course %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<input name="eId" value="<%=eId %>" type="hidden"/>
	<div class="litte_left">系统管理&gt;&gt;试卷信息&gt;&gt;修改</div>
	<hr  style="display:block"/>
	<div align="center">
	<table align="center">
		<tr>
			<td align="right">试题名字：</td><td align="left"><input name="eName" value="<%=examPaper.getEName() %>" /></td>
		</tr>
		<tr>
			<td align="right">试卷号：</td><td align="left"><input name="pId" value="<%=examPaper.getPId() %>" /></td>
		</tr>
		<tr>
			<td align="right">试卷名称：</td><td align="left"><input name="pName" value="<%=examPaper.getPName() %>" /></td>
		</tr>
		<tr>
			<td align="right">试题内容：</td><td align="left"><textarea name="eContent" cols="70" rows="6"><%=examPaper.getEContent() %></textarea></td>
		</tr>
		<tr>
			<td align="right">试题类型：</td><td align="left"><input name="eType" value="<%=examPaper.getEType() %>" /></td>
		</tr>
		<tr>
			<td align="right">试题课别：</td><td align="left"><input name="eCourse" value="<%=examPaper.getECourse() %>" /></td>
		</tr>
		<tr>
			<td align="right">试题答案：</td><td align="left"><input name="eAnswer" value="<%=examPaper.getEAnswer() %>" /></td>
		</tr>
  	</table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="submit" value="提交" />
	&nbsp;&nbsp;<input type="button" value="返回" onclick="goBack()" /></div>
</form>

</body>
</html>
