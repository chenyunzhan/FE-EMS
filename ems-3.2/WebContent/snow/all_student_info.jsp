<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.util.*" %>

<jsp:useBean id="Test" class="com.fe.ems.util.Test" scope="session" />
<%Test.setB(true); %>


<%
	int pageNo = 1;
	int pageSize = 18;
	StudentService studentService = (StudentService)this.getServletContext().getAttribute("studentService");
	String command = request.getParameter("command");
	if(command != null && "delete".equals(command)){
		String[] studentIds = request.getParameterValues("selectFlag");
		for(int i=0; i<studentIds.length; i++){
			studentService.deleteStudentById(studentIds[i]);	
		}
	}
	PageModel pageModel = null;
	String gra = request.getParameter("gra");
	String dep = request.getParameter("dep");
	String cla = request.getParameter("cla");
	String pageNoStr = request.getParameter("pageNo");
	String search = request.getParameter("search");
	if (pageNoStr != null && !"".equals(pageNoStr)) {
		pageNo = Integer.parseInt(pageNoStr);
	}
	if (search != null && !"".equals(search) && search.length() == 2){
		gra = search;
		pageModel = studentService.findAllStudent(pageNo,pageSize,gra,dep,cla);
	}else if (search != null && !"".equals(search) && search.length() == 4){
		gra = search.substring(0,2);
		dep = search.substring(2,4);
		pageModel = studentService.findAllStudent(pageNo,pageSize,gra,dep,cla);
	}else if (search != null && !"".equals(search) && search.length() == 6){
		gra = search.substring(0,2);
		dep = search.substring(2,4);
		cla = search.substring(4,6);
		pageModel = studentService.findAllStudent(pageNo,pageSize,gra,dep,cla);
	}else if(search != null && !"".equals(search) && search.length() == 8){
		String id = search;
		Student student = studentService.findStudentById(id);
		List studentList = new ArrayList();
		studentList.add(student);
		pageModel = new PageModel();
		pageModel.setList(studentList);
		pageModel.setTotalRecords(1);
		pageModel.setPageNo(pageNo);
		pageModel.setPageSize(pageSize);
	}else{
		pageModel = studentService.findAllStudent(pageNo,pageSize,gra,dep,cla);
	}
	if(gra == null){
		gra = "";
	}
	if(dep == null){
		dep = "";
	}
	if(cla == null){
		cla = "";
	}
	if(search == null){
		search = "";
	}
	String querycode = "&gra=" + gra + "&dep=" + dep + "&cla=" + cla + "&search=" + search;
	System.out.println(querycode);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- 作者：陈云展 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>学生信息</title>
<script type="text/javascript">
	function addPaper() {
		window.self.location = "add_student_info.jsp?pageNo=<%=pageNo%><%=querycode%>";	
	}
	
	function modifyPaper() {
		var selectFlags = document.getElementsByName("selectFlag");
		var count = 0;
		var j = 0;
		for(i=0; i<selectFlags.length; i++){
			if(selectFlags[i].checked){
				count ++;
				j = i;
			}
		}
		if(count == 0){
			alert("请选择所要修改的数据！");
			return;
		}
		if(count > 1){
			alert("一次只能修改一条数据！");
			return;
		}
		//alert(selectFlags[j].value);
		window.self.location = "modify_student_info.jsp?sId=" + selectFlags[j].value + "&pageNo=" +<%=pageNo%> + "<%=querycode%>";
	}
	
	function deleteStudent() {
		var selectFlags = document.getElementsByName("selectFlag");
		var flag = false;
		for(i=0; i<selectFlags.length; i++){
			if(selectFlags[i].checked){
				flag = true;
				break;
			}
		}
		if(!flag){
			alert("请选择需要删除的数据");
			return;
		}
		if(window.confirm("确认删除吗？")){
			with(document.getElementById("studentForm")){
				action="all_student_info.jsp?command=delete&pageNo=<%=pageNo%><%=querycode%>";
				method="post";
				submit();
			}
		}
	}

	function checkAll(ifAll) {
		var selectFlags = document.getElementsByName("selectFlag");
		for(i=0; i<selectFlags.length; i++){
			selectFlags[i].checked = ifAll.checked;
		}
	}
	
	
	function uploadPic4Paper(){
		var selectFlags = document.getElementsByName("selectFlag");
		var count = 0;
		var j = 0;
		for(i=0; i<selectFlags.length; i++){
			if(selectFlags[i].checked){
				count ++;
				j = i;
			}
		}
		if(count == 0){
			alert("请选择所要修改的数据！");
			return;
		}
		if(count > 1){
			alert("一次只能修改一条数据！");
			return;
		}
		window.self.location = "upload_picture4student.jsp?sId=" + selectFlags[j].value + "&pageNo=" +<%=pageNo%> + "<%=querycode%>";
	}

	function topPage() {
		window.location="all_student_info.jsp?pageNo=<%=pageModel.getTopPageNo()%><%=querycode%>";
	}
	
	function previousPage() {
		window.location="all_student_info.jsp?pageNo=<%=pageModel.getPreviousPageNo()%><%=querycode%>";
	}	
	
	function nextPage() {
		window.location="all_student_info.jsp?pageNo=<%=pageModel.getNextPageNo()%><%=querycode%>";
	}
	
	function bottomPage() {
		window.location="all_student_info.jsp?pageNo=<%=pageModel.getBottomPageNo()%><%=querycode%>";
	}
	
</script>
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



.checkbox{
	width:50px;
	height:20px;
}
.STYLE2 {color: #666666}

-->
</style>
</head>
<body>
	<form name="studentForm" id="studentForm">
      <table width="90%" border="0" cellspacing="0" cellpadding="0"	align="center">
        <tr bgcolor="#F5FAFE">
          <td height="10" nowrap align="left"> 系统管理&gt;&gt;学生信息 </td>
          <td height="10" nowrap >&nbsp;</td>
        </tr>
      </table>
	 <hr style="display:block" />
      <table width="90%" id="mytab"  border="1" class="t1">
       <tr>
        <th class="checkbox"><input type="checkbox" name="ifAll" id="ifAll" onclick="checkAll(this)"/></th>
          <th width="10%">学号</th>
          <th width="10%">姓名</th>
          <th width="10%">密码</th>
          <th width="10%">性别</th>
          <th width="30%">班级</th>
          <th width="30%">邮箱</th>
          </tr>
        <%
        List studentList = pageModel.getList();
     	int count = 0;
		for(Iterator iter=studentList.iterator(); iter.hasNext();){
			Student student = (Student)iter.next();
			String style = null;
			count ++;
			if(count % 2 == 1){
				style = "a1";
			}
        %>
        <tr class=<%=style %>>
          <td class="checkbox"><input type="checkbox" name="selectFlag" value="<%=student.getSId() %>"/></td>
          <td><%=student.getSId() %></td>
          <td><%=student.getSName() %></td>
          <td><%=student.getSPassword() %></td>
          <td><%=student.getSSex() %></td>
          <td><%=student.getSGrade()+student.getSDepartment()+student.getSClasses() %></td>
          <td><%=student.getSEmail() %></td>
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

								onClick="topPage()">
              <input name="btnPreviousPage" class="button1" type="button"

								id="btnPreviousPage" value=" &lt;  " title="上页"

								onClick="previousPage()">
              <input name="btnNextPage" class="button1" type="button"

								id="btnNextPage" value="  &gt; " title="下页" onClick="nextPage()">
              <input name="btnBottomPage" class="button1" type="button"

								id="btnBottomPage" value=" &gt;&gt;|" title="尾页"

								onClick="bottomPage()">
              <input name="btnAdd" type="button" class="button1" id="btnAdd"

								value="添加" onClick="addPaper()">
              <input name="btnDelete" class="button1" type="button"

								id="btnDelete" value="删除" onClick="deleteStudent()">
              <input name="btnModify" class="button1" type="button"

								id="btnModify" value="修改" onClick="modifyPaper()">
			  <input name="btnUpload" class="button1" type="button"

								id="btnUpload" value="上传图片" onClick="uploadPic4Paper()">
            </div></td>
        </tr>
      </table>
	</form>
</body>
</html>