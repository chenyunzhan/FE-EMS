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
<title>ѧ����ҳ</title>
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

<%	//�ڴ˴��ж��û��Ƿ������������û������������������ת���������
	String p_id = examtime.getP_id(Login.getId(),0);
	if(examtime.getUserProtectMess(Login.getId(),p_id,0) && examtime.getAllowstates(Login.getId(),p_id,0) == 0 && !examtime.isPreventfresh()){
		examtime.setPreventfresh(true);
		out.println("<script>");
		out.println("divMessageBox('������ʾ','��û�������ύ�Ծ�,������ת������ҳ��!',300,130)");
		out.println("</script>");
	}
	else if(examtime.getUserProtectMess(Login.getId(),p_id,0) && examtime.getAllowstates(Login.getId(),p_id,0) == 1){
		System.out.println("���Ѿ��μӹ����ο��ԣ������ٴν��롣");
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
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">������ҳ</a></li>
        <% if(Login.isSuccess()){
			%>
			 <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="student_info.jsp">������Ϣ</a></li>
			  <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="examimitate_new.jsp?">ģ�⿼��</a></li>
			<%	
		}%>
       
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">
		<% if(Login.isSuccess()){
			%>
			�˳���¼
			<%
			}else{
			%>
			���ص�¼
			<%	
			}%>
		</a></li>
      </ul>
    </div>
    <!-- end #menu -->
    <div class="user">
	   <%=Login.getS_name()==null?"��ӭʹ�ñ�ϵͳ!":Login.getS_name() + ",��ӭ��!"%> 
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
            <h2 style="margin-top:15px">���Բ���˵��&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            										</h2>
          </li>
        </iu>
        <div align="center">
          <p align="center"> <span>���ݿ����ٿ��ԣ��ϸ������濼�Ա������⡣ģ�����濼��ϵͳ���棬��ѧ����ǰ��Ӧ</span>���ԡ� <span class="xg_czsm"><br />
              <span class="STYLE1">����˵����</span></b>��Զ��ģ�⿼��ϵͳ��ҳѡ������ʡ�У���������ѡ��ȫ��ģ�⹦�ܡ�ѡ��������������ͺ�</br>
              										��������롣���������ʼ���⡱��������ּ��ϵġ�0����ʼ���⡣���������������ȷ�Ͻ���ɿ�����</br>
              										�������⡣</span>
			 <span style="text-align:center"><b><br />
			 <span class="STYLE2">����˵����</span></b></span><br />
			  <span class="jptp"> <img src="../images/tp_03.gif" width="585" height="323" /></span> <span><br />
            ��ѡ���⣺���С�����еġ�A����B����C����D�����е�һ����ѡ��𰸡�</span> <span><br />
            ���ж��⣺���С�����еġ��ԡ��������е�һ����ѡ��𰸡�</span> <span><br />
            ��ѡ���𰸺󣬵����ȷ�����·�ҳ����������һ�⡣��������ʱ����ȷ���𰸣��ɰ����·�������������һ�⡣</span> <br />
            ������С�����еġ��Ϸ������·��������ɵ�ǰһ����һ�⡣ <span><br />
            �����¼����еġ����������Կ���������ʾ���档����ȷ�Ͻ����ύ�Ծ���ʾ�ɼ��������������ԡ�����</br>
            	��������棬�ɲ鿴�Ƿ���©����޸Ŀ���𰸡�</span> <span><br />
            ����ѧ����Ҫ����ʱѡ���𰸺��Զ���ҳ�����ڡ��Զ�ǰ������ѡ��ǰ��ѡ����ѧ���������������ʱ�˽��Լ�</br>
            	�Ƿ����ԣ����ڡ��Զ��д�ѡ��ǰ��ѡ����Ҳ��ѡ������������˽��Լ�����ĶԴ���������Զ�ǰ�����롰</br>
            	�Զ��д�����ͬʱ��ѡ��</span><span class="xg_zy"><em><br />
            </em><span class="STYLE3">ע�⣺��Ŀ�ж���𰸵ģ���֮������"#"�Ÿ���(��#�����뷽��Ϊshift + 3)�������Ч!</span></span><span class="xg_djck"><a href="exam.jsp"> <img src="../images/dj_072.jpg" alt="" width="177" height="35" /></a></span> </p>
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