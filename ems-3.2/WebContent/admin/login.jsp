<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.exceptions.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.util.*" %>
<%
	String command = request.getParameter("command");	
	String isAdminLogined = null;
	if(command != null && "login".equals(command)) {
		String aId = request.getParameter("aId");
		String aPassword = request.getParameter("aPassword");
		try{
			AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
			Admin admin = adminService.adminLogin(aId, aPassword);
			session.setAttribute("admin",admin);
			isAdminLogined = "success";
		}catch(AppException app){
			isAdminLogined = "failure";
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- 作者：陈云展 -->
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>管理员登录页面</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-latest.js" type="text/javascript"></script>    
<script src="../js/Jquery.L.Message.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.STYLE2 {color: #999999}
-->
</style>
<script type="text/javascript">

if (window.self != window.top){
	window.top.location = window.self.location;
}

function submitForm()
{
	with (document.forms[1]){
		action="login.jsp?command=login";
		method="post";
		submit();
	}
}

</script>
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
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="../index.jsp" class="first">返回学生登录首页</a></li>
          <li class="welcome"> &nbsp;&nbsp;&nbsp;&nbsp;<span class="first STYLE2">欢迎管理员登录考试系统后台</span></li>
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
	<div id="page">
	<style type="text/css">td img {display: block;}</style>
		<div align="center"><br />
		    <br />
		    <br />
			<br />
			<br />
			<form method="get" action="index.jsp">
	      <table border="0" cellpadding="0" cellspacing="0" width="610">
<!-- fwtable fwsrc="未命名" fwbase="admin_login1.jpg" fwstyle="Dreamweaver" fwdocid = "72864132" fwnested="0" -->
  <tr>
   <td><img src="../images/spacer.gif" width="354" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="131" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="48" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="68" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="5"><img name="admin_login1_r1_c1" src="../images/admin_login1_r1_c1.jpg" width="610" height="200" border="0" id="admin_login1_r1_c1" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="200" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="6"><img name="admin_login1_r2_c1" src="../images/admin_login1_r2_c1.jpg" width="354" height="102" border="0" id="admin_login1_r2_c1" alt="" /></td>
   <td rowspan="2" background="../images/admin_login1_r2_c2.jpg"><input value="bll" name="aId" style="width:125px; height:13px; " type="text" /></td>
   <td colspan="3"><img name="admin_login1_r2_c3" src="../images/admin_login1_r2_c3.jpg" width="125" height="4" border="0" id="admin_login1_r2_c3" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="4" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="5"><img name="admin_login1_r3_c3" src="../images/admin_login1_r3_c3.jpg" width="9" height="98" border="0" id="admin_login1_r3_c3" alt="" /></td>
   <td rowspan="3" background="../images/admin_login1_r3_c4.jpg"><A href="javascript:submitForm()"><IMG height="20" src="../images/spacer.gif" width="48" height="41" border="0" name="button"></IMG></A></td>
   <td rowspan="5"><img name="admin_login1_r3_c5" src="../images/admin_login1_r3_c5.jpg" width="68" height="98" border="0" id="admin_login1_r3_c5" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="20" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="admin_login1_r4_c2" src="../images/admin_login1_r4_c2.jpg" width="131" height="7" border="0" id="admin_login1_r4_c2" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="7" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2" background="../images/admin_login1_r5_c2.jpg"><input value="111111" name="aPassword" style="width:125px; height:13px;" type="password" /></td>
   <td><img src="../images/spacer.gif" width="1" height="14" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="admin_login1_r6_c4" src="../images/admin_login1_r6_c4.jpg" width="48" height="57" border="0" id="admin_login1_r6_c4" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="7" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="admin_login1_r7_c2" src="../images/admin_login1_r7_c2.jpg" width="131" height="50" border="0" id="admin_login1_r7_c2" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="50" border="0" alt="" /></td>
  </tr>
</table>
</form>
	      </div>
	</div>
  <!-- InstanceEndEditable -->
	<div style="width:728px; margin:auto;"><script language="JavaScript" >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script></div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
	<%if(isAdminLogined != null && "success".equals(isAdminLogined)){ %>
	<div id="hello" style="height:350px;"></div>
	<form name="form1" action="javascript:$('#hello').messagebox('登录成功，马上为您跳转到后台管理首页！', 'index.jsp', 1, 2000);" method="get"> </form> <script language="javascript"> document.form1.submit() </script>
	<%}else if(isAdminLogined != null && "failure".equals(isAdminLogined)){ %>
	<div id="hello" style="height:5x;"></div>
	<form name="form1" action="javascript:$('#hello').messagebox('您的用户名或密码错误，请重新输入。', '', 0, 1000);" method="get"> </form> <script language="javascript"> document.form1.submit() </script>
	<%}%>
</body>
<!-- InstanceEnd --></html>