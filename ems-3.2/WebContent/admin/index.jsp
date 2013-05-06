<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%
	Admin admin = (Admin)session.getAttribute("admin");
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
	String aId = admin.getAId();
	admin = adminService.findAdminById(aId); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>管理员首页</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.STYLE1 {font-size: 60px}
.STYLE2 {font-size: 20px}
.STYLE4 {font-size: 60px; font-weight: bold; }
.STYLE6 {font-size: 24px; color: #000000; }
-->
</style>
<!-- InstanceEndEditable -->
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
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="#" class="first">管理首页</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_paper.jsp">考题信息</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_info.jsp">学生信息</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_score.jsp">查询成绩</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="login_out.jsp">退出登录</a></li>
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
	<div class="STYLE1" style="height:340px; width:800px;" id="page">      
	  <div align="right"><br /><br />
	    <span class="STYLE4">欢迎管理员<%=admin.getAName()%>使用本系统<br />
	    </span><br /><a href="see_teacher_info.jsp" class="STYLE2">查看其他管理员信息</a>
	    <a href="modify_teacher_password.jsp" class="STYLE2">修改本人密码</a>
        <a href="modify_teacher_info.jsp" class="STYLE2">查询本人信息</a> 
        <a href="exam_view.jsp" class="STYLE2">试卷预览</a></div>
	</div>
  <!-- InstanceEndEditable -->
	<div style="width:728px; margin:auto;"><script language=javascript >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script></div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
</body>
<!-- InstanceEnd --></html>