<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Ñ§Éú×¢²á</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}
.user {
	position:absolute;
	width:125px;
	height:25px;
	z-index:1;
	left: 950px;
	top: 146px;
	color:#FFFFFF;
	font-size:13px;
}
</style>
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
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="../index.jsp" class="first">µÇÂ¼</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="#">×¢²á</a></li>
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="select_course.jsp">Á·Ï°</a></li><%--
          <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">ÍË³öµÇÂ¼</a></li>--%>
        </ul>
      </div>
	  <!-- end #menu -->
     <div class="user">
		<%=Login.getS_name()== null?"»¶Ó­Ê¹ÓÃ±¾ÏµÍ³!":Login.getS_name()+",»¶Ó­Äã!"%> 
	</div>
	  <!-- end #search -->
    </div>
	<!-- InstanceEndEditable -->
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<!-- InstanceBeginEditable name="main" -->
	<div id="mypage">
	<br />
	<br />
	<br />
	 <IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='iframe_register.jsp' frameBorder=0 noResize width=1050 scrolling=no height=850 vspale='0'></IFRAME>
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