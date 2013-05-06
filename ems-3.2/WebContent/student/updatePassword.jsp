<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
<jsp:useBean id="userInfoUpdata" class="com.fe.ems.manager.UserInfoManager" scope="session"/>

<%
	String s_password = request.getParameter("s_password");
	String s_password1 = request.getParameter("s_password1");
	if(s_password != null && s_password1 != null){
		userInfoUpdata.infoUpdata(Login.getId(),s_password);
		userInfoUpdata.setS_password(s_password);
		
	}
	String bool = request.getParameter("bol");
	if(bool == null || bool.equals("")){
		userInfoUpdata.setBackNews("");
	}
%>

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
.information1{
		font-size:0.4cm;
		color:red;
		
	}
.states1{
		color:#aaa;
		font-size: 14px;
}
.states2{
	color:#000;
	font-size: 14px;
}
.states3{
	color:red;
	font-size: 14px;
}
.states4{
	color:green;
	font-size: 14px;
}

</style>

<!-- ������֤��Ϣ��js���� -->
<script>
function gspan(cobj){
	while(true){
		if(cobj.nextSibling.nodeName != "SPAN"){
			cobj = cobj.nextSibling;
		}
		else{
			return cobj.nextSibling;	
		}
	}
}

function check(obj,info,fun){
	var sp = gspan(obj);
	
	obj.onfocus = function(){
		sp.className = "states2";
		sp.innerHTML = info;
	}
	
	obj.onblur = function(){
		if(fun(this.value)){
			sp.className = "states4";
			sp.innerHTML = "<img src='../images/yes.png' />��ȷ";
		}
		else{
			sp.className = "states3";	
			sp.innerHTML = "<img src='../images/no.png' />" + info;
		}
	}
}

 //�ύʱ sΪtrue�ύ�ɹ� Ϊfalse�ύʧ��
var s = false;

<!-- �÷�������ִ��ע����Ϣ�ļ��-->
onload = function(){
	var s_password = document.getElementsByName("s_password")[0];
	var s_password1 = document.getElementsByName("s_password1")[0];
	var oldpassword = document.getElementsByName("oldpassword")[0];
	
	check(oldpassword,"��ȷ����ԭ���뱣��һ��",function(val){
										  if(val == <%=Login.getS_password() %>){
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
	
	check(s_password,"����Ӧ����6--20λ֮��,���ܺ��пո�",function(val){
										  if(val.match(/^\S+$/) && val.length >= 6 && val.length <= 20){
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
	
	check(s_password1,"ȷ������Ҫ������һ�£�����ҲҪ��ͬ",function(val){
										  if(val.match(/^\S+$/) && val.length >= 6 && val.length <= 20 && val == s_password.value){
											  s = true;
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
					
	
}
function reg(){
	
	return s;	
}
</script>




<!-- ����js����ʱ��ת�ļ� -->
<script src="../js/alertBarEdit.js"></script>
<body>
<!-- ������body������������� -->
<script>
if(<%=userInfoUpdata.isInfoUpdataStatesPassword()%>){
	<%Login.setS_password(userInfoUpdata.getS_password());%>
	divMessageBox('�޸���ʾ','�޸ĳɹ�!',-180,-110);
}
</script>
<form name="form" action="" method="post" onsubmit="return reg()" >
	<div class="information1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=userInfoUpdata.getBackNews() %></div><br/>
	<input type="hidden" name="bol" value="bool" />
		<div class="box box_2">
		         <div class="l"><span></span>ԭ����:</div>
		            <div class="c">
		            	<input  type="password" name="oldpassword" /><br><span class="states1">������ԭ����</span>
		         	</div>
		</div>

		<div class="box box_2">
            <div class="l"><span></span>������:</div>
            <div class="c">
            	<input  type="password" name="s_password" /><br><span class="states1">������������</span>
            </div>
        </div>
        
        <div class="box box_2">
            <div class="l"><span></span>�ظ�����:</div>
            <div class="c">
            	<input  type="password" name="s_password1" /><br><span class="states1">�������ظ�����</span>
            </div>
        </div>
        
<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="�ύ" />&nbsp;&nbsp;
	<input type="button" value="����" onclick="history.go(-1)" />
</div>

</form>
</body>
</html>
