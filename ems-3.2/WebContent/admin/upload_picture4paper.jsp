<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<jsp:useBean id="Test" class="com.fe.ems.util.Test" scope="session" />
<%
	String pageNo = request.getParameter("pageNo");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String course = request.getParameter("course");
	String search = request.getParameter("search");
%>

<%
	String eId = request.getParameter("eId");
	ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
	ExamPaper examPaper = examService.findExamByPid(eId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>为试题上传图片页面</title>
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
	
	function sub() {
		if(document.getElementById('upload').value) {
			document.form.submit();
		}else {
			alert('请选择需要上传的图片');
		}
		
	}
</script>
</head>
<body>

<form ENCTYPE="multipart/form-data" action="../servlet/FileUpload" method="post" name="form">
	<input name="sId" type="hidden" value="<%=examPaper.getPId()+examPaper.getEName() %>"/>
	<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="year" value="<%=year %>" type="hidden"/>
	<input name="month" value="<%=month %>" type="hidden"/>
	<input name="course" value="<%=course %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">系统管理&gt;&gt;试题信息&gt;&gt;上传图片</div>
	<hr  style="display:block"/>
	<div style="margin:0 auto; width:400px;">
	<table align="center">
		<tr>
			<td>试题ID:</td><td><%=examPaper.getEId() %></td>
		</tr>
		<tr>
			<td>试题名字:</td><td><%=examPaper.getEName() %></td>
		</tr>
		<tr>
			<td>试题内容:</td><td><textarea readonly="readonly" name="eContent" cols="40" rows="5"><%=examPaper.getEContent() %></textarea></td>
		</tr>
		<tr>
			<td>图片:</td><td><img id="img" width="120" height="147" src="../images/upload_images/<%=examPaper.getPId()+examPaper.getEName() %>.jpg" alt="" /></td>
		</tr>
		<tr>
			<td>上传图片:</td><td><input id="upload" type="file" name="fileName" onchange="changeImg()"/></td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" onclick="sub()" value="提交" />
	&nbsp;&nbsp;<input type="button" value="返回" onclick="history.go(-1)" /></div>
</form>


<script type="text/javascript">

<%
	//主要是解决图片更新问题。
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
