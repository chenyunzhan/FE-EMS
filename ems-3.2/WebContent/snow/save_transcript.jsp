<!-- ���ߣ�����չ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ɼ���</title>
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
	<div class="litte_left">ϵͳ����&gt;&gt;�ɼ���Ϣ&gt;&gt;�ɼ�������</div>
	<hr  style="display:block"/>
	<div style="margin:0 auto; width:600px;">
	<table align="center">
		<tr>
			<td>�༶��Ϣ��</td><td><input name="classes" />&nbsp;*��дҪ���ɳɼ����İ༶������09�����ϵ1����д090101</td>
		</tr>
		<tr>
			<td>����ʱ�䣺</td><td><input name="paper" />&nbsp;*��дҪ���ɳɼ����Ŀ���ʱ�䣬����09��һ�·���д0901</td>
		</tr>
  </table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="submit" value="���ɳɼ���" />
	&nbsp;&nbsp;<input type="button" value="����" onclick="history.go(-1)" /></div>
</form>

</body>
</html>