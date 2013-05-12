<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%
	String sId = "";
	String sName = "";
	String sPassword = "";
	String sSex = "";
	String sAge = "";
	String sClasses = "";
	String sDepartmentId = "";
	String sDepartment = "";
	String sGrade = "";
	String sPhone = "";
	String sEmail = "";
	String gra = request.getParameter("gra");
	String dep = request.getParameter("dep");
	String cla = request.getParameter("cla");
	String search = request.getParameter("search");
	String pageNo = request.getParameter("pageNo");
	String command = request.getParameter("command");
	StudentService studentService = (StudentService)this.getServletContext().getAttribute("studentService");
	if (command != null && "add".equals(command)) {
		if(studentService.findStudentById(request.getParameter("sId")) == null){
			Student student = new Student();
			student.setSAge(request.getParameter("sAge"));
			student.setSClasses(request.getParameter("sClasses"));
			student.setSDepartment(request.getParameter("sDepartment"));
			student.setSDepartmentId(request.getParameter("sDepartmentId"));
			student.setSEmail(request.getParameter("sEmail"));
			student.setSGrade(request.getParameter("sGrade"));
			student.setSId(request.getParameter("sId"));
			student.setSName(request.getParameter("sName"));
			student.setSPassword(request.getParameter("sPassword"));
			student.setSPhone(request.getParameter("sPhone"));
			student.setSSex(request.getParameter("sSex"));
			
			studentService.addStudent(student);
			
			sPassword = request.getParameter("sPassword");
			sClasses = request.getParameter("sClasses");
			sDepartmentId = request.getParameter("sDepartmentId");
			sDepartment = request.getParameter("sDepartment");
			sGrade = request.getParameter("sGrade");
			out.println("学生添加成功!");
		}else{
			sId = request.getParameter("sId");
			sName = request.getParameter("sName");
			sPassword = request.getParameter("sPassword");
			sSex = request.getParameter("sSex");
			sAge = request.getParameter("sAge");
			sClasses = request.getParameter("sClasses");
			sDepartmentId = request.getParameter("sDepartmentId");
			sDepartment = request.getParameter("sDepartment");
			sGrade = request.getParameter("sGrade");
			sPhone = request.getParameter("sPhone");
			sEmail = request.getParameter("sEmail");
			out.println("学生添加失败！");
		}
	}
	String querycode = "&gra=" + gra + "&dep=" + dep + "&cla=" + cla + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加学生信息</title>
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
	function addStudent(){
		if(studentForm.sId.value==""){
			alert("请输入8位学生学号！");
			return;
		}
		if(studentForm.sName.value==""){
			alert("请输入学生学生！");
			return;
		}
		if (document.getElementById("sPassword").value.length < 6) {
			alert("用户密码不能小于6位！");
			document.getElementById("sPassword").focus();
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
		with(document.getElementById("studentForm")){
			action="add_student_info.jsp?command=add";
			method="post";
			submit();
		}
	}
	function goBack() {
		window.self.location = "all_student_info.jsp?pageNo=<%=pageNo%><%=querycode%>";
	}
</script>
</head>

<body>
<form id="studentForm" name="studentForm">
<input name="pageNo" type="hidden" value="<%=pageNo %>"/>
	<input name="gra" value="<%=gra %>" type="hidden"/>
	<input name="dep" value="<%=dep %>" type="hidden"/>
	<input name="cla" value="<%=cla %>" type="hidden"/>
	<input name="search" value="<%=search %>" type="hidden"/>
	<div class="litte_left">系统管理&gt;&gt;学生信息&gt;&gt;添加</div>
	<hr  style="display:block"/>
	<div align="center">
	<table>
					<tr>
						<td>
							<div align="right">
								<font color="#FF0000">*</font>学生学号:
							</div>
						</td>
						<td>
							<input align="left" name="sId" type="text" id="sId"
								value="<%=sId %>"/>
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
								size="20" maxlength="20" value="<%=sName %>"/>
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
									id="sPassword" size="20" maxlength="20" value="<%=sPassword %>"/>
							</label>
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生性别:
							</div>
						</td>
						<td>
							<input type="radio" name="sSex" value="男" checked/>男
							<input type="radio" name="sSex" value="女" />女
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
								size="20" maxlength="20" value="<%=sAge %>"/>
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
								size="20" maxlength="20" value="<%=sDepartment %>"/>
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
								size="20" maxlength="20" value="<%=sDepartmentId %>"/>
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								<font color="#FF0000">*</font>学生年级:&nbsp;
							</div>
						</td>
						<td>
							<input name="sGrade" type="text" class="text1" id="sGrade"
								size="20" maxlength="20" value="<%=sGrade %>"/>
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
								size="20" maxlength="20" value="<%=sClasses %>"/>
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生电话:
							</div>
						</td>
						<td>
							<input name="sPhone" type="text" class="text1" id="sPhone"
								size="20" maxlength="20" value="<%=sPhone %>"/>
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								学生邮箱:
							</div>
						</td>
						<td>
							<input name="sEmail" type="text" class="text1" id="sEmail"
								size="20" maxlength="20" value="<%=sEmail %>"/>
						</td>
					</tr>
				</table>
  	</div>
	<hr style="display:block" />
	<div align="center"><input type="button" value="提交" onclick="addStudent()"/>
	&nbsp;&nbsp;<input type="button" value="返回" onclick="goBack()" /></div>
</form>

</body>
</html>