<!-- ���ߣ�����չ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%
	String eCourse = "";
	String eContent = "";
	String eAnswer = "";
	String eType = "";
	String eName = "";
	String pId = "";
	String pName = "";
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String course = request.getParameter("course");
	String command = request.getParameter("command");
	String search = request.getParameter("search");
	String pageNo = request.getParameter("pageNo");
	ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
	if (command != null && "add".equals(command)) {
		if(examService.findExamByPid(request.getParameter("sId")) == null){
			ExamPaper examPaper = new ExamPaper();
			examPaper.setEAnswer(request.getParameter("eAnswer"));
			examPaper.setEContent(request.getParameter("eContent"));
			examPaper.setECourse(request.getParameter("eCourse"));
			examPaper.setEName(request.getParameter("eName"));
			examPaper.setEType(request.getParameter("eType"));
			examPaper.setPId(request.getParameter("pId"));
			examPaper.setPName(request.getParameter("pName"));
			examService.addExamPaper(examPaper);
			out.println("������ӳɹ�!");
			eCourse = request.getParameter("eCourse");
			eType = request.getParameter("eType");
			pId = request.getParameter("pId");
			pName = request.getParameter("pName");
		}else{
			eCourse = request.getParameter("eCourse");
			eContent = request.getParameter("eContent");
			eAnswer = request.getParameter("eAnswer");
			eType = request.getParameter("eType");
			eName = request.getParameter("eName");
			pId = request.getParameter("pId");
			pName = request.getParameter("pName");
			out.println("�������ʧ�ܣ�");
		}
	}
	String querycode = "&year=" + year + "&month=" + month + "&course=" + course + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������</title>
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
	function addExamPaper(){
		if(examPaperForm.eName.value==""){
			alert("�������������֣�");
			return;
		}
		if(examPaperForm.pId.value==""){
			alert("�������Ծ�ţ�");
			return;
		}
		if(examPaperForm.pName.value==""){
			alert("�������Ծ����ƣ�");
			return;
		}
		if(examPaperForm.eContent.value==""){
			alert("�������������ݣ�");
			return;
		}
		if(examPaperForm.eType.value==""){
			alert("�������������ͣ�");
			return;
		}
		var e = examPaperForm.eType.value;

		if(e<0||e>2){
			alert("��������0Ϊ�ж�,1Ϊѡ��,2Ϊ���.��");
			return;
		}
		if(examPaperForm.eCourse.value==""){
			alert("����������α�");
			return;
		}
		if(examPaperForm.eAnswer.value==""){
			alert("����������𰸣�");
			return;
		}
		with(document.getElementById("examPaperForm")){
			action="add_paper.jsp?command=add";
			method="post";
			submit();
		}
	}
	
	function goBack() {
		window.self.location = "all_paper.jsp?pageNo=<%=pageNo%><%=querycode%>";
	}
</script>
</head>

<body>
<form id="examPaperForm" name="examPaperForm">
<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="year" value="<%=year %>" type="hidden"/>
	<input name="month" value="<%=month %>" type="hidden"/>
	<input name="course" value="<%=course %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">ϵͳ����&gt;&gt;�Ծ���Ϣ&gt;&gt;���</div>
	<hr  style="display:block"/>
	<div align="center">
	<table>
		<tr>
			<td align="right">�������֣�</td><td align="left"><input name="eName" value="<%=eName %>" /></td>
		</tr>
		<tr>
			<td align="right">�Ծ�ţ�</td><td align="left"><input name="pId" value="<%=pId %>" /></td>
		</tr>
		<tr>
			<td align="right">�Ծ����ƣ�</td><td align="left"><input name="pName" value="<%=pName %>" /></td>
		</tr>
		<tr>
			<td align="right">�������ݣ�</td><td align="left"><textarea name="eContent" cols="70" rows="6"><%=eContent %></textarea></td>
		</tr>
		<tr>
			<td align="right">�������ͣ�</td><td align="left"><input name="eType" value="<%=eType %>" /></td>
		</tr>
		<tr>
			<td align="right">����α�</td><td align="left"><input name="eCourse" value="<%=eCourse %>" /></td>
		</tr>
		<tr>
			<td align="right">����𰸣�</td><td align="left"><input name="eAnswer" value="<%=eAnswer %>" /></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" value="�ύ" onclick="addExamPaper()"/>
	&nbsp;&nbsp;<input type="button" value="����" onclick="goBack()" /></div>
</form>

</body>
</html>
