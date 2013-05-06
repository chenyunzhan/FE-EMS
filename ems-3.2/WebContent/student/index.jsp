<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
<jsp:useBean id="userInfoUpdata" class="com.fe.ems.manager.UserInfoManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
 
<%
	userInfoUpdata.setInfoUpdataStates(false);
	userInfoUpdata.setInfoUpdataStatesPassword(false);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>学生首页</title>
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
.STYLE1 {
	color: #66665E;
	font-size: medium;
	font-weight: bold;
}
.STYLE2 {font-size: medium}
.STYLE3 {color: #FF0000}
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
<script src="../js/alertBarExam.js"></script>
<!-- InstanceEndEditable -->
</head>
<body>

<%	//在此处判断用户是否正常交卷，如果没有正常交卷则重新跳转到答题界面
	String p_id = examtime.getP_id(Login.getId(),0);
	if(examtime.getUserProtectMess(Login.getId(),p_id,0) && examtime.getAllowstates(Login.getId(),p_id,0) == 0 && !examtime.isPreventfresh()){
		examtime.setPreventfresh(true);
		out.println("<script>");
		out.println("divMessageBox('考试提示','您没有正常提交试卷,正在跳转到考试页面!',300,130)");
		out.println("</script>");
	}
	else if(examtime.getUserProtectMess(Login.getId(),p_id,0) && examtime.getAllowstates(Login.getId(),p_id,0) == 1){
		System.out.println("你已经参加过本次考试，不能再次进入。");
		response.sendRedirect("exit.jsp");
	}
%>

<div id="wrapper">
  <div id="logo"></div>
	<hr />
	<!-- end #logo -->
	<!-- InstanceBeginEditable name="menu" -->
  <div id="header">
    <div id="menu">
      <ul>
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">考生首页</a></li>
        <% if(Login.isSuccess()){
			%>
			 <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="student_info.jsp">个人信息</a></li>
			  <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="examimitate_new.jsp?">模拟考试</a></li>
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
	   <%=Login.getS_name()==null?"欢迎使用本系统!":Login.getS_name() + ",欢迎你!"%> 
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
      <div>
        <iu>
          <li>
            <h2 style="margin-top:15px">考试操作说明&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										</h2>
          </li>
        </iu>
        <div align="center">
          <p align="center"> <span>根据考题大纲考试，严格按照正规考试比例出题。模拟正规考试系统界面，让学生提前适应</span>考试。 <span class="xg_czsm"><br />
              <span class="STYLE1">操作说明：</span></b>在远东模拟考试系统首页选择所在省市，点击进入后选择全真模拟功能。选择所做试题的类型后</br>
              										，点击进入。鼠标点击“开始答题”或键盘数字键上的“0”开始做题。答完所有试题后点击确认交卷可看到成</br>
              										绩及错题。</span>
			 <span style="text-align:center"><b><br />
			 <span class="STYLE2">键盘说明：</span></b></span><br />
			  <span class="jptp"> <img src="../images/tp_03.gif" width="585" height="323" /></span> <span><br />
            ·选择题：点击小键盘中的“A”“B”“C”“D”键中的一个来选择答案。</span> <span><br />
            ·判断题：点击小键盘中的“对”“错”键中的一个来选择答案。</span> <span><br />
            ·选定答案后，点击“确认向下翻页”键翻到下一题。若考生暂时不能确定答案，可按“下翻”键继续答下一题。</span> <br />
            ·按下小键盘中的“上翻”“下翻”键，可到前一题或后一题。 <span><br />
            ·按下键盘中的“交卷”卷，可以看到交卷提示界面。按“确认交卷”提交试卷显示成绩，按“继续考试”键回</br>
            	到试题界面，可查看是否有漏题或修改考题答案。</span> <span><br />
            ·若学生想要答题时选定答案后自动翻页，可在“自动前进”的选项前勾选。若学生答题过程中想随时了解自己</br>
            	是否做对，可在“自动判错”选项前勾选。可也勾选“答题情况”了解自己答题的对错比例。“自动前进”与“</br>
            	自动判错”不可同时勾选。</span><span class="xg_zy"><em><br />
            </em><span class="STYLE3">注意：题目有多个答案的，答案之间请用"#"号隔开(“#”输入方法为shift + 3)否则答案无效!</span></span><span class="xg_djck"><a href="exam.jsp"> <img src="../images/dj_072.jpg" alt="" width="177" height="35" /></a></span> </p>
        </div>
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