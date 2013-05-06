<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.*" %>
 
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session"/>
<jsp:useBean id="userInfoUpdata" class="com.fe.ems.manager.UserInfoManager" scope="session"/>

<%	if(!Login.isSuccess()) 
	{
		response.sendRedirect("../index.jsp");
	}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Condition  by Free CSS Templates</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">
td img {display: block;}
</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.STYLE1 {color: #0C95C9}
.STYLE2 {
	font-size: 18px;
	font-weight: bold;
}
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
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">考生首页</a></li>
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="#">个人信息</a></li>
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="examimitate_new.jsp?">模拟考试</a></li>
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">退出登录</a></li>
      </ul>
    </div>
    <!-- end #menu -->
    <div class="user">
		<%=Login.getS_name()== null? "欢迎使用本系统!" : Login.getS_name() + ",欢迎你!"%> 
	</div>
    <!-- end #search -->
  </div>
  <!-- InstanceEndEditable -->
  <!-- end #header -->
  <!-- end #header-wrapper -->
  <!-- InstanceBeginEditable name="main" --> <br />
  <br />
  <br />
  <div id="page" style="background-color:#F1F1F1; width:1050px"> <br />
    <div style="margin:0 auto; margin-top:20px; width:796px; height:53px; background:url(../images/regBg_002.png) no-repeat"> </div>
    <div style="margin:0 auto; width:796px; height:850px; background-color:#FFFFFF">
      <div class="cWrap">
        <!-- //method QQ Number -->
        <br />
        <br />
        <div class="method clear" style="text-align:right"> <i class="iconMail" style="background:url(../images/regBg_001.png); margin-left:40px"></i>
          <div class="inner">
            <div style="height:30px;">
              <h2 align="left" style=" padding-top:10px">资料更新</h2>
            </div>
            <iframe style=" width:600px;" name="iframe_update" src="iframe_update.jsp" padding-righ="0px" padding-top="18px" onload="" frameborder="0" height="750" scrolling="no" width="660"></iframe>
            <!-- //cWrap -->
          </div>
        </div>
        <!-- //method Email -->
      </div>
    </div>
    <br />
    <br />
    <br />
    <br />
  </div>
  <!-- InstanceEndEditable -->
  <div style="width:728px; margin:auto;">
    <script language=javascript >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script>
  </div>
  <!-- end #page -->
  <div id="footer-bgcontent">
    <div id="footer">
      <p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
    </div>
  </div>
  <!-- end #footer -->
</div>

</body>
<!-- InstanceEnd -->
</html>
