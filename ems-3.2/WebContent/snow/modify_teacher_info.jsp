<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%
	String aId = request.getParameter("aId");
	String aName = request.getParameter("aName");
	String aSex = request.getParameter("aSex");
	String aPhone = request.getParameter("aPhone");
	String aEmail = request.getParameter("aEmail");
	String command = request.getParameter("command");
	boolean success = false;
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
	if(command != null && "modify".equals(command)){
		Admin admin = new Admin();
		admin.setAAge(Integer.parseInt(request.getParameter("aAge")));
		admin.setAId(aId);
		admin.setAEmail(aEmail);
		admin.setAName(aName);
		admin.setAPhone(aPhone);
		admin.setASex(aSex);
		adminService.modifyAdmin(admin);
		success = true;
	}

	Admin admin = (Admin)session.getAttribute("admin");
	admin = adminService.findAdminById(admin.getAId());
	if(admin.getAAge()==0){
		admin.setAAge(0);
	}
	if(admin.getAEmail()==null){
		admin.setAEmail("");
	}
	if(admin.getAPhone()==null){
		admin.setAPhone("");
	}
	if(admin.getAName()==null){
		admin.setAName("");
	}
	if(admin.getASex()==null){
		admin.setASex("");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>修改管理员信息</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
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
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">管理首页</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_paper.jsp">考题信息</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_info.jsp">学生信息</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="see_student_score.jsp">查询成绩</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="login_out.jsp">退出登陆</a></li>
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
	<br />
	<%
	if(command != null && "modify".equals(command) && success){
		out.println("修改信息成功！");
	}else if(command != null && "modify".equals(command)){
		out.println("修改信息失败！");	
	}
	%>
	<div id="page"><br /><br /><br /><br />基础数据管理>>修改信息<br />
	<hr  style="display:block"/>
		<form action="modify_teacher_info.jsp" method="post">
			<input value="modify" name="command" type="hidden"/>
			帐号：<input value="<%=admin.getAId() %>" readonly="readonly" name="aId"/><br />
			姓名：<input value="<%=admin.getAName() %>" name="aName"/><br />
			性别：<input value="<%=admin.getASex() %>" name="aSex"/><br />
			年龄：<input value="<%=admin.getAAge() %>" name="aAge"/><br />
			电话：<input value="<%=admin.getAPhone() %>" name="aPhone"/><br />
			邮箱：<input value="<%=admin.getAEmail() %>" name="aEmail" /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交" />
		</form>
	<hr  style="display:block"/>
	<br /><br /><br /><br /><br /><br /><br /><br /></div>
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