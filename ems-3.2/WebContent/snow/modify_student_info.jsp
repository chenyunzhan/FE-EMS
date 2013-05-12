<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%
	String sId = request.getParameter("sId");
	String pageNo = request.getParameter("pageNo");
	String gra = request.getParameter("gra");
	String dep = request.getParameter("dep");
	String cla = request.getParameter("cla");
	String search = request.getParameter("search");
	String command = request.getParameter("command");
	StudentService studentService = (StudentService)this.getServletContext().getAttribute("studentService");
	if (command != null && "modify".equals(command)) {
		Student student = new Student();
        student.setSPassword(request.getParameter("sPassword"));
		student.setSName(request.getParameter("sName"));
		student.setSSex(request.getParameter("sSex"));
		student.setSAge(request.getParameter("sAge"));
		student.setSClasses(request.getParameter("sClasses"));
		student.setSDepartment(request.getParameter("sDepartment"));
		student.setSGrade(request.getParameter("sGrade"));
		student.setSPhone(request.getParameter("sPhone"));
		student.setSEmail(request.getParameter("sEmail"));
		student.setSDepartmentId(request.getParameter("sDepartmentId"));
		student.setSId(request.getParameter("sId"));
		studentService.modifyStudent(student);
		out.println("修改学生成功！");
	}
	Student student = studentService.findStudentById(sId);	
	String querycode = "&gra=" + gra + "&dep=" + dep + "&cla=" + cla + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改学生信息</title>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<style type="text/css">
body,table{
    font-size:12px;
	background-image:none;
	margin-left: 0px;
 	margin-top: 0px;
}
.litte_left{
	text-indent: 100px;	
}
.big_left{
	
}
</style>
<script type="text/javascript">
function goBack() {
	window.self.location ="all_student_info.jsp?pageNo=<%=pageNo%><%=querycode%>";
}

function modifyStudent() {
	if (document.forms[0].sName.value == "") {
		alert("用户名称必须输入！");
		document.forms[0].sName.focus();
		return;
	}
	if (document.getElementById("sPassword").value.length < 6) {
		alert("用户密码不能小于6位！");
		document.getElementById("sPassword").focus();
		return;
	}
	if(studentForm.sName.value==""){
		alert("请输入学生学生！");
		return;
	}
	if(studentForm.sDepartment.value==""){
		alert("请输入该学生所在系别！");
		return;
	}
	if(studentForm.sDepartmentId.value==""){
		alert("请输入该学生所在系别代号！");
		return;
	}
	if(studentForm.sGrade.value==""){
		alert("请输入该学生所在年级！");
		return;
	}
	if(studentForm.sClasses.value==""){
		alert("请输入该学生所在班级！");
		return;
	}
	with (document.forms[0]) {
		action="modify_student_info.jsp?command=modify";
		method="post";
		submit();
	}
}
</script>
</head>

<body>
<form name="studentForm">
	<input type="hidden" name="pageNo" value="<%=pageNo %>"/>
	<input name="gra" value="<%=gra %>" type="hidden"/>
	<input name="dep" value="<%=dep %>" type="hidden"/>
	<input name="cla" value="<%=cla %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">系统管理&gt;&gt;学生信息&gt;&gt;修改</div>
	<hr  style="display:block"/>
	<div align="center">
	<table>
					<tr>
						<td>
							<div align="right">
								学生学号:&nbsp;&nbsp;
							</div>
						</td>
						<td>
							<input name="sId" type="text" id="sId"
								value="<%=student.getSId() %>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生姓名:
							</div>
						</td>
						<td>
							<input name="sName" type="text" class="text1" id="sName"
								size="20" maxlength="20" value="<%=student.getSName() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生密码:
							</div>
						</td>
						<td>
							<label>
								<input name="sPassword" type="password" class="text1"
									id="sPassword" size="20" maxlength="20" value="<%=student.getSPassword() %>">
							</label>
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生性别:
							</div>
						</td>
						<td><%
							String man = "",woman="";
							if("男".equals(student.getSSex())){
								man = "checked";
							} 
							%>
							<input type="radio" name="sSex" value="男" <%=man %>/>男
							<% 
							if("女".equals(student.getSSex())){
								woman = "checked";
							} 
							%>
							<input type="radio" name="sSex" value="女" <%=woman %>/>女
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生年龄:
							</div>
						</td>
						<td>
							<input name="sAge" type="text" class="text1" id="sAge"
								size="20" maxlength="20" value="<%=student.getSAge() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生系别:
							</div>
						</td>
						<td>
							<input name="sDepartment" type="text" class="text1" id="sDepartment"
								size="20" maxlength="20" value="<%=student.getSDepartment() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>系别代号:
							</div>
						</td>
						<td>
							<input name="sDepartmentId" type="text" class="text1" id="sDepartmentId"
								size="20" maxlength="20" value="<%=student.getSDepartmentId() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生年级:
							</div>
						</td>
						<td>
							<input name="sGrade" type="text" class="text1" id="sGrade"
								size="20" maxlength="20" value="<%=student.getSGrade() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生班级:
							</div>
						</td>
						<td>
							<input name="sClasses" type="text" class="text1" id="sClasses"
								size="20" maxlength="20" value="<%=student.getSClasses() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生电话:
							</div>
						</td>
						<td>
							<input name="sPhone" type="text" class="text1" id="sPhone"
								size="20" maxlength="20" value="<%=student.getSPhone() %>">
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生邮箱:
							</div>
						</td>
						<td>
							<input name="sEmail" type="text" class="text1" id="sEmail"
								size="20" maxlength="20" value="<%=student.getSEmail() %>">
						</td>
					</tr>
				</table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" value="提交" onclick="modifyStudent()"/>
	&nbsp;&nbsp;<input type="button" value="返回" onclick="goBack()" /></div>
</form>

</body>
</html>