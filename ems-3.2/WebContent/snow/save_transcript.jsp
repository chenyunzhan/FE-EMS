<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>保存成绩单</title>
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
</head>

<body>
<form action="transcript.jsp">
	<div class="litte_left">系统管理&gt;&gt;成绩信息&gt;&gt;成绩单生成</div>
	<hr  style="display:block"/>
	<div style="margin:0 auto; width:600px;">
	<table align="center">
		<tr>
			<td>班级信息：</td><td><input name="classes" />&nbsp;*填写要生成成绩单的班级，例如09计算机系1班填写090101</td>
		</tr>
		<tr>
			<td>考试时间：</td><td><input name="paper" />&nbsp;*填写要生成成绩单的考试时间，例如09年一月份填写0901</td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="submit" value="生成成绩单" />
	&nbsp;&nbsp;<input type="button" value="返回" onclick="history.go(-1)" /></div>
</form>

</body>
</html>