<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>

<jsp:useBean id="Test" class="com.fe.ems.util.Test" scope="session" />
 
<%
	String pageNo = request.getParameter("pageNo");
	String gra = request.getParameter("gra");
	String dep = request.getParameter("dep");
	String cla = request.getParameter("cla");
	String search = request.getParameter("search");
%>
<%
	String sId = request.getParameter("sId");
	StudentService studentService = (StudentService)this.getServletContext().getAttribute("studentService");
	Student student = studentService.findStudentById(sId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>为学生上传图片页面</title>
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
	function changeImg(){
		var obj1 = document.getElementById("img");
		var obj2 = document.getElementById("upload");
		obj1.src = obj2.value;
	}
	
</script>
</head>

<body>
<form ENCTYPE="multipart/form-data" action="../servlet/FileUpload" method="post">
	<input type="hidden" name="sId" value="<%=student.getSId() %>"/>
	<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="year" value="<%=gra %>" type="hidden"/>
	<input name="month" value="<%=dep %>" type="hidden"/>
	<input name="course" value="<%=cla %>" type="hidden"/>
	<input name="isStudent" value="true" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">系统管理&gt;&gt;学生信息&gt;&gt;上传图片</div>
	<hr  style="display:block"/>
	<div align="center"">
	<table align="center">
		<tr>
			<td>学生ID：</td><td><%=student.getSId() %></td>
		</tr>
		<tr>
			<td>学生名字：</td><td><%=student.getSName() %></td>
		</tr>
		<tr>
			<td>学生班级：</td><td><%=student.getSGrade()+student.getSDepartment()+student.getSClasses() %></td>
		</tr>
		<tr>
			<td>图片：</td><td><img id="img" width="120" height="147" src="../images/upload_images/<%=student.getSId() %>.jpg" alt="" /></td>
		</tr>
		<tr>
			<td>上传图片：</td><td><input id="upload" name="fileName" type="file" onchange="changeImg()"/></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="submit" value="提交" />
	&nbsp;&nbsp;<input type="button" value="返回" onclick="history.go(-1)" /></div>
</form>
<script type="text/javascript">
<%
	if(Test.isB()){
		//System.out.println(Test.isB());
		Test.setB(false);
		//System.out.println(Test.isB());
%>
	window.parent.frames.clientDispAreaFrame.location.reload();
	//alert("成功啦！");
<%		
	}
%>
</script>
</body>
</html>