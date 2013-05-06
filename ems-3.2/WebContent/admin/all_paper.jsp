<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.util.*" %>

<jsp:useBean id="Test" class="com.fe.ems.util.Test" scope="session" />
<%Test.setB(true); %>

<%
	int pageNo = 1;
	int pageSize = 9;
	ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
	PageModel pageModel = null;
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String course = request.getParameter("course");
	String pageNoStr = request.getParameter("pageNo");
	String search = request.getParameter("search");
	String command = request.getParameter("command");
	if(command != null && "delete".equals(command)){
		String[] examIds = request.getParameterValues("selectFlag");
		for(int i=0; i<examIds.length; i++){
			examService.deleteExamPaperById(examIds[i]);	
		}
	}
	if (pageNoStr != null && !"".equals(pageNoStr)) {
		pageNo = Integer.parseInt(pageNoStr);
	}
	if (search != null && !"".equals(search) && search.length() == 2){
		year = search;
	}else if (search != null && !"".equals(search) && search.length() == 4){
		year = search.substring(0,2);
		month = search.substring(2,4);
	}else if (search != null && !"".equals(search) && search.length() >= 5){
		year = search.substring(0,2);
		month = search.substring(2,4);
		course = search.substring(4);
		//System.out.println(course);
	}
	pageModel = examService.findAllExam(pageNo,pageSize,year,month,course);
	if(year == null){
		year = "";
	}
	if(month == null){
		month = "";
	}
	if(course == null){
		course = "";
	}
	if(search == null){
		search = "";
	}
	String querycode = "&year=" + year + "&month=" + month + "&course=" + course + "&search=" + search;
	System.out.println(querycode);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- 作者：陈云展 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030" />
<title>试题信息</title>
<script type="text/javascript">
	function addPaper() {
		window.self.location = "add_paper.jsp?pageNo=<%=pageNo%><%=querycode%>";
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
		window.self.location = "modify_paper.jsp?eId=" + selectFlags[j].value + "&pageNo=" +<%=pageNo%> + "<%=querycode%>";
	}
	
	function deleteExamPaper() {
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
			with(document.getElementById("paperForm")){
				action="all_paper.jsp?command=delete&pageNo=<%=pageNo%><%=querycode%>";
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
			alert("请选择所要上传图片的数据！");
			return;
		}
		if(count > 1){
			alert("一次只能上传一条数据的图片！");
			return;
		}
		window.self.location = "upload_picture4paper.jsp?eId=" + selectFlags[j].value + "&pageNo=" +<%=pageNo%> + "<%=querycode%>";
	}

	function topPage() {
		window.location="all_paper.jsp?pageNo=<%=pageModel.getTopPageNo()%><%=querycode%>";
	}
	
	function previousPage() {
		window.location="all_paper.jsp?pageNo=<%=pageModel.getPreviousPageNo()%><%=querycode%>";
	}	
	
	function nextPage() {
		window.location="all_paper.jsp?pageNo=<%=pageModel.getNextPageNo()%><%=querycode%>";
	}
	
	function bottomPage() {
		window.location="all_paper.jsp?pageNo=<%=pageModel.getBottomPageNo()%><%=querycode%>";
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
	width:20px;
	height:20px;
}
.STYLE2 {color: #666666}

-->
</style>
</head>
<body>
<form name="paperForm" id="paperForm">
      <table width="90%" border="0" cellspacing="0" cellpadding="0"	align="center">
        <tr bgcolor="#F5FAFE">
          <td height="10" nowrap align="left"> 系统管理&gt;&gt;试卷信息 </td>
          <td height="10" nowrap >&nbsp;</td>
        </tr>
      </table>
	 <hr style="display:block" />
      <table width="95%" id="mytab"  border="1" class="t1">
        <thead>
        <th class="checkbox"><input type="checkbox" name="ifAll" id="ifAll" onclick="checkAll(this)"/></th>
          <th width="7%">名称</th>
          <th width="24%">试卷名称</th>
          <th width="55%">内容</th>
          <th width="7%">类型</th>
          <th width="7%">答案</th>
          </thead>
        <%
        List examPaperList = pageModel.getList();
     	int count = 0;
		for(Iterator iter=examPaperList.iterator(); iter.hasNext();){
			ExamPaper examPaper = (ExamPaper)iter.next();
			String style = null;
			count ++;
			if(count % 2 == 1){
				style = "a1";
			}
        %>
        <tr class=<%=style %>>
          <td class="checkbox"><input type="checkbox" name="selectFlag" value="<%=examPaper.getEId() %>" /></td>
          <td><%=examPaper.getEName() %></td>
          <td><%=examPaper.getPName() %></td>
          <td><%=examPaper.getEContent() %></td>
          <td><%=examPaper.getEType() %></td>
          <td><%=examPaper.getEAnswer() %></td>
        </tr>
        <%} %> 
      </table>
      <table width="95%" height="30" border="0" align="center"

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

								id="btnDelete" value="删除" onClick="deleteExamPaper()">
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