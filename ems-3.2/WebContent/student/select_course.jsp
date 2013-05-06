<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>试卷选择</title>
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
          	<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="../index.jsp" class="first">考生首页</a></li>
			 <% if(Login.isSuccess()){
			%>
			 <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="student_info.jsp">个人信息</a></li>
			  <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="examimitate_new.jsp">模拟考试</a></li>
			<%	
			}%>
			<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">
			<% if(Login.isSuccess()){
			%>
			退出登录
			<%
			}else{
			%>
			返回登录
			<%	
			}%>
			</a></li>
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
	<!-- InstanceBeginEditable name="main" -->
	<div id="page">
      <div id="page-bgtop">
        <!-- end #content -->
<div style="height:300px">
          <ul>
            <li>
              <h2>选择试卷：</h2>
              <ul>
              <%
                int lianxinums = Integer.parseInt(this.getServletContext().getInitParameter("lianxinums"));
                int lianxistartid = Integer.parseInt(this.getServletContext().getInitParameter("lianxistartid"));
                for(;lianxinums>0;lianxinums--){
              %>
                	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VF练习  <a href="test.jsp?pidno=<%=++lianxistartid%>">试卷 <%=lianxistartid%></a></li>
              <%
                }
              %>
              </ul>
            </li>
          </ul>
        </div>
        <!-- end #sidebar -->
      </div>
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