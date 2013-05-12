<!-- ���ߣ�����չ -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.exceptions.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%
	Admin admin = (Admin)session.getAttribute("admin");
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
	String aId = admin.getAId();
	admin = adminService.findAdminById(aId);
	String command = request.getParameter("command");
	String oldpassword = request.getParameter("oldpassword");
	String newpassword = request.getParameter("newpassword");
	String renewpassword = request.getParameter("renewpassword");
	//System.out.println(newpassword);
	//System.out.println(renewpassword);
	//System.out.println(newpassword.equals( renewpassword));
	String success = null;
	if(command != null && "modifyPassword".equals(command) && admin.getAPassword().equals(oldpassword) && (newpassword.equals(renewpassword))){
		try{
			adminService.modifyTeacherPassword(admin.getAId(), newpassword);
			success = "modifyPasswordSuccess";
		}catch(AppException app){
			success = "modifyPasswordFailure";
		}
	}
	if(command != null && "modifyPassword".equals(command) && !admin.getAPassword().equals(oldpassword) || command != null && "modifyPassword".equals(command) && !(newpassword.equals(renewpassword))){
			success = "modifyPasswordFailure";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>�޸Ĺ���Ա����</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}</style>
<script src="../js/jquery-latest.js" type="text/javascript"></script>    
<script src="../js/Jquery.L.Message.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>
<body>
<div id="wrapper">
  <div id="logo"></div>
	<hr />
	<!-- end #logo -->
	<!-- InstanceBeginEditable name="menu" -->
	<div id="header">
      <div id="menu">
        <ul>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">������ҳ</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_paper.jsp">������Ϣ</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_info.jsp">ѧ����Ϣ</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_score.jsp">��ѯ�ɼ�</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="login_out.jsp">�˳���½</a></li>
        </ul>
      </div>
	  <!-- end #menu -->
      <div id="search">
        <form method="get" action="">
          <fieldset>
          <input type="text" name="s" id="search-text" size="15" />
          <input name="submit" type="submit" id="search-submit" value="GO" />
          </fieldset>
        </form>
      </div>
	  <!-- end #search -->
    </div>
	<!-- InstanceEndEditable -->
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<!-- InstanceBeginEditable name="main" -->
	<div id="page"><br /><br /><br /><br /><br />�������ݹ���>>�޸�����<br />
	<hr  style="display:block"/>
		<form action="modify_teacher_password.jsp" method="post">
			<input type="hidden" name="command" value="modifyPassword"/>
			��ľ����룺<input name="oldpassword" type="password" /><br />
			��������룺<input name="newpassword" type="password"/><br />
			�ظ������룺<input name="renewpassword" type="password"/><br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="�ύ" />
		</form>
	<hr  style="display:block"/>
	<br /><br /><br /><br /><br /><br /><br /><br /></div>
  <!-- InstanceEndEditable -->
	<div style="width:728px; margin:auto;"><script language="javascript" >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script></div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
<%if(success != null && "modifyPasswordSuccess".equals(success)){ %>
	<div id="hello" style="height:350px;"></div>
	<form name="form1" action="javascript:$('#hello').messagebox('�޸�����ɹ�������Ϊ����ת����̨������ҳ��', 'index.jsp', 1, 2000);" method="get"> </form> <script language="javascript"> document.form1.submit() </script>
<%}else if(success != null && "modifyPasswordFailure".equals(success)){ %>
<div id="hello" style="height:5x;"></div>
	<form name="form1" action="javascript:$('#hello').messagebox('����ԭʼ�����������β�һ�£����������롣', '', 0, 1000);" method="get"> </form> <script language="javascript"> document.form1.submit() </script>
<%}%>
</body>
<!-- InstanceEnd --></html>