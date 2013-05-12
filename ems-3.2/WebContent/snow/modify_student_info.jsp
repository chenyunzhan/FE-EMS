<!-- ���ߣ�����չ -->
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
		out.println("�޸�ѧ���ɹ���");
	}
	Student student = studentService.findStudentById(sId);	
	String querycode = "&gra=" + gra + "&dep=" + dep + "&cla=" + cla + "&search=" + search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�ѧ����Ϣ</title>
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
		alert("�û����Ʊ������룡");
		document.forms[0].sName.focus();
		return;
	}
	if (document.getElementById("sPassword").value.length < 6) {
		alert("�û����벻��С��6λ��");
		document.getElementById("sPassword").focus();
		return;
	}
	if(studentForm.sName.value==""){
		alert("������ѧ��ѧ����");
		return;
	}
	if(studentForm.sDepartment.value==""){
		alert("�������ѧ������ϵ��");
		return;
	}
	if(studentForm.sDepartmentId.value==""){
		alert("�������ѧ������ϵ����ţ�");
		return;
	}
	if(studentForm.sGrade.value==""){
		alert("�������ѧ�������꼶��");
		return;
	}
	if(studentForm.sClasses.value==""){
		alert("�������ѧ�����ڰ༶��");
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
	<div class="litte_left">ϵͳ����&gt;&gt;ѧ����Ϣ&gt;&gt;�޸�</div>
	<hr  style="display:block"/>
	<div align="center">
	<table>
					<tr>
						<td>
							<div align="right">
								ѧ��ѧ��:&nbsp;&nbsp;
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
								<font color="#FF0000">*</font>ѧ������:
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
								<font color="#FF0000">*</font>ѧ������:
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
								ѧ���Ա�:
							</div>
						</td>
						<td><%
							String man = "",woman="";
							if("��".equals(student.getSSex())){
								man = "checked";
							} 
							%>
							<input type="radio" name="sSex" value="��" <%=man %>/>��
							<% 
							if("Ů".equals(student.getSSex())){
								woman = "checked";
							} 
							%>
							<input type="radio" name="sSex" value="Ů" <%=woman %>/>Ů
						</td>
					</tr>
					<tr>
						<td height="26">
							<div align="right">
								ѧ������:
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
								ѧ��ϵ��:
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
								<font color="#FF0000">*</font>ϵ�����:
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
								<font color="#FF0000">*</font>ѧ���꼶:
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
								<font color="#FF0000">*</font>ѧ���༶:
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
								<font color="#FF0000">*</font>ѧ���绰:
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
								<font color="#FF0000">*</font>ѧ������:
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
	<div align="center"><input type="button" value="�ύ" onclick="modifyStudent()"/>
	&nbsp;&nbsp;<input type="button" value="����" onclick="goBack()" /></div>
</form>

</body>
</html>