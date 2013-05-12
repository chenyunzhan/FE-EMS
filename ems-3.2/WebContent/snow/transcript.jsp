<!-- 作者：陈云展 -->
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.util.*" %>
<%
	String classes = request.getParameter("classes");
	String paper = request.getParameter("paper");
	AdminService adminService = (AdminService)this.getServletContext().getAttribute("adminService");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>成绩单</title>
<script type="text/javascript">
	function addPaper() {
		window.self.location = "add_student_score.html";	
	}
	
	function modifyPaper() {
		window.self.location = "modify_student_score.html";
	}
	
	function deletePaper() {
		
	}

	function saveTranscript() {
		window.self.location = "save_transcript.jsp";
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
      <table width="90%" border="0" cellspacing="0" cellpadding="0"	align="center">
        <tr bgcolor="#F5FAFE">
          <td height="10" nowrap align="left"> 系统管理&gt;&gt;成绩信息&gt;&gt;生成成绩单</td>
          <td height="10" nowrap >&nbsp;</td>
        </tr>
      </table>
	 <hr style="display:block" />
      <table width="90%" id="mytab"  border="1" class="t1">
        <thead>
       	  <th width="10%"></th>
       	  <%
       	  	char a = 'a';
       	  	for(int i=0; i<9; i++){ 
	       		String pId = paper + a;
	       		ExamPaper examPaper = adminService.findPaperByPid(pId);
	       		a = (char)(a+1);
	       		System.out.println(pId);
	       		if(examPaper != null){
       	  %>
         	 <th width="10%"><%=examPaper.getECourse() %></th>
       	  		<%}else{%>
       	  	 <th width="10%"></th>
       	 		<%}}%>
          </thead>
          
        <%
        	String No = null;
        	for(int i=1; i<50; i++){
        	if (i<10){
        		No = "0" + String.valueOf(i);
        	}else{
        		No = String.valueOf(i);
        	}

	        	String id = classes + No;
	        	Student student = adminService.findStudentById(id);
	        	String style = null;
	        	if(i % 2 == 1){
					style = "a1";
				}
         %>
        <tr class=<%=style %>>
			<%if(student != null){ %>
			<td><%=student.getSName() %></td>
			<%}else{ %>
				<td></td>
			<%} %>
			<%
				String paperId = paper + 'a';
				String studentId = classes + No;;
				Score score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'b';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'c';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	
         	 <%
				paperId = paper + 'd';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'e';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'f';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'g';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'h';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>
         	 <%
				paperId = paper + 'i';
				studentId = classes + No;;
				score = adminService.findScore(paperId,studentId);
				if(score.getScore() != 0){
			%>
         	 <td><%=score.getScore() %></td>
         	 <%}else{ %>
         	 <td></td>
         	 <%} %>

        </tr> 
        <%} %>
      </table>
     
</body>
</html>