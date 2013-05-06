<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.util.*" %>
<%
	int pageNo = 1;
	int pageSize = 3;
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
	PageModel pageModel = adminService.findAllAdmin(pageNo,pageSize);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>查看管理员信息</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}</style>
<script type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
body,table{
    font-size:12px;
	margin-left: 0px;
 	margin-top: 0px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
td{
    height:20px;
}
h1,h2,h3{
    font-size:12px;
    margin:0;
    padding:0;
}

.title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C url(../temp/th_bg2.gif); background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
        .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


/*这个是借鉴一个论坛的样式*/
table.t1{
    border:1px solid #cad9ea;
    color:#666;
}
table.t1 th {
    background-image: url(../temp/th_bg1.gif);
    background-repeat::repeat-x;
    height:30px;
}
table.t1 td,table.t1 th{
    border:1px solid #cad9ea;
    padding:0 1em 0;
}
table.t1 tr.a1{
    background-color:#f5fafe;
}

.STYLE2 {color: #666666}

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
	<div id="page" style="height:400px"><br /><br /><br />
      <table width="90%" border="0" cellspacing="0" cellpadding="0"	align="center">
        <tr bgcolor="#F5FAFE">
          <td height="10" nowrap align="left"> 系统管理&gt;&gt;管理员信息 </td>
          <td height="10" nowrap >&nbsp;</td>
        </tr>
      </table>
	 <hr style="display:block" />
      <table width="90%" id="mytab"  border="1" class="t1">
        <thead>
      	  <th width="10%">职工号</th>
          <th width="10%">姓名</th>
          <th width="10%">姓别</th>
          <th width="10%">年龄</th>
          <th width="20%">电话</th>
          <th width="30%">邮箱</th>
          </thead>
    <%
   		List adminList = pageModel.getList();
       	int count = 0;
		for(Iterator iter=adminList.iterator(); iter.hasNext();){
			Admin admin = (Admin)iter.next();
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
			String style = null;
			count ++;
			if(count % 2 == 1){
				style = "a1";
			}
	%>
        <tr class=<%=style %>>
          <td><%=admin.getAId() %></td>
          <td><%=admin.getAName() %></td>
          <td><%=admin.getASex() %></td>
          <td><%=admin.getAAge() %></td>
          <td><%=admin.getAPhone() %></td>
          <td><%=admin.getAEmail() %></td>
        </tr>
    <%} %>      
      </table>
      <table width="90%" height="30" border="0" align="center"

				cellpadding="0" cellspacing="0" class="rd1">
        <tr bgcolor="#F5FAFE">
          <td width="36%" height="2" nowrap class="rd19"><div align="left"> <font color="#FFFFFF">&nbsp;</font><span class="STYLE2">共&nbsp<%=pageModel.getBottomPageNo() %>&nbsp页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当前第&nbsp<%=pageNo %>&nbsp 页</span> </div></td>
          <td width="64%" nowrap class="rd19"><div align="right">
              <input name="btnTopPage" class="button1" type="button"

								id="btnTopPage" value="|&lt;&lt; " title="首页"

								onClick="topPage()"/>
              <input name="btnPreviousPage" class="button1" type="button"

								id="btnPreviousPage" value=" &lt;  " title="上页"

								onClick="previousPage()"/>
              <input name="btnNextPage" class="button1" type="button"

								id="btnNextPage" value="  &gt; " title="下页" onClick="nextPage()"/>
              <input name="btnBottomPage" class="button1" type="button"

								id="btnBottomPage" value=" &gt;&gt;|" title="尾页"

								onClick="bottomPage()"/>
			</div></td>
        </tr>
      </table>
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