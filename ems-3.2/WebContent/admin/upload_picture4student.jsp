<!-- ���ߣ�����չ -->
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
<title>Ϊѧ���ϴ�ͼƬҳ��</title>
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
	<div class="litte_left">ϵͳ����&gt;&gt;ѧ����Ϣ&gt;&gt;�ϴ�ͼƬ</div>
	<hr  style="display:block"/>
	<div align="center"">
	<table align="center">
		<tr>
			<td>ѧ��ID��</td><td><%=student.getSId() %></td>
		</tr>
		<tr>
			<td>ѧ�����֣�</td><td><%=student.getSName() %></td>
		</tr>
		<tr>
			<td>ѧ���༶��</td><td><%=student.getSGrade()+student.getSDepartment()+student.getSClasses() %></td>
		</tr>
		<tr>
			<td>ͼƬ��</td><td><img id="img" width="120" height="147" src="../images/upload_images/<%=student.getSId() %>.jpg" alt="" /></td>
		</tr>
		<tr>
			<td>�ϴ�ͼƬ��</td><td><input id="upload" name="fileName" type="file" onchange="changeImg()"/></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="submit" value="�ύ" />
	&nbsp;&nbsp;<input type="button" value="����" onclick="history.go(-1)" /></div>
</form>
<script type="text/javascript">
<%
	if(Test.isB()){
		//System.out.println(Test.isB());
		Test.setB(false);
		//System.out.println(Test.isB());
%>
	window.parent.frames.clientDispAreaFrame.location.reload();
	//alert("�ɹ�����");
<%		
	}
%>
</script>
</body>
</html>