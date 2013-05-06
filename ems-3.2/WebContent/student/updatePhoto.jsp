<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<% Login.setB(true);//允许updatePhoto.jsp页面reload一次 %>

<html><head></head>
<style type="text/css">
img, table, tr, td {border-collapse:collapse }
.box { min-height:25px; _height:25px; padding-bottom:15px }
.box .l { float:left; width:80px; padding-right:5px; padding-top:3px; text-align:right }
.box .c { float:left; width:255px }
.box_2 .l img { vertical-align:middle }
.box_2 .ico_wb {background:url(http://mat1.gtimg.com/www/mb/images/regBg3_1.png) no-repeat}
.box_2 .ico_wb {display:inline-block;width:10px;height:17px;margin-right:3px;background-position:-201px -2px;_background-position:-201px 0;vertical-align:middle;*vertical-align:top;_vertical-align:middle}

.box_2 .tip_list { margin-top: -20px; margin-left:0 }

</style>
<script type="text/javascript">
	function changeImg(){
		var objImg = document.getElementById("img");
		var objUpload = document.getElementById("upload");
		//alert("img:" + obj1.src);
		//alert("upload:" + obj2.value);
		objImg.src = objUpload.value;
		//alert("img:" + obj1.src);
	}
</script>

<body>
<form ENCTYPE="multipart/form-data" action="../servlet/FileUploadStudent" method="post">
	<input type="hidden" name="sId" value="<%=Login.getId() %>"/>
	
<div class="box box_2">
         <div class="l"><span></span>选择头像:</div>
            <div class="c">
            	<input id="upload" type="file" name="fileName" onchange="changeImg()"/>
         	</div>
</div>

<div class="box box_2">
            <div class="l"><span></span>头&nbsp&nbsp像：</div>
            <div class="c">
            	<img id="img" border="1" height="220" width="220" style="border-color:#000000" src="../images/upload_images/<%=Login.getId() %>.jpg" alt="" />
            </div>
        </div>
        
<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="提交" />&nbsp;&nbsp;
	<input type="button" value="返回" onclick="history.go(-1)" />
</div>

</form>

</body>
</html>




