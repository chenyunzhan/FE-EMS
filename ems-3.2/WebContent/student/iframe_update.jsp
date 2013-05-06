<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.*" %>

<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session"/>
<jsp:useBean id="userInfoUpdata" class="com.fe.ems.manager.UserInfoManager" scope="session"/>

<jsp:setProperty name="userInfoUpdata" property="*" />
<jsp:setProperty name="Login" property="*" />

<%	
	String s_name = request.getParameter("s_name");
	String s_password = request.getParameter("s_password");
	
	if(s_name == null || s_name.equals("") || s_password == null || s_password.equals("")){
		userInfoUpdata.showUserInfo(Login.getId());
	}
	else{
		userInfoUpdata.infoUpdata(Login.getId());
		userInfoUpdata.showUserInfo(Login.getId());
	}
	
	String bool = request.getParameter("bool");
	if(bool == null || bool.equals("")){
		userInfoUpdata.setBackNews("");
	}
%>		

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息修改页面</title>
<style type="text/css">

/* global */
* { padding:0; margin:0; list-style:none; color:#333 }

body { background:#fff; font:normal 12px/1.2em Tahoma, Arial; color:#333 }

img, table, tr, td {border-collapse:collapse }

input { vertical-align:middle }

a { text-decoration:none; color: #2B4A78 }

a:hover { color: #2B4A78; text-decoration:underline }

.txt_error { color:red }

/* global clear fix */
.clear { clear:both; font-size:0; line-height:0 }

.clfix:after { content:'.'; clear:both; display:block; height:0; visibility:hidden; line-height:0 }

.clfix { zoom:1 }

/* global function class */
.hide { display:none!important }

.hidden { visibility:hidden!important }

.noborder { border:none!important }

.nobg { background:none!important }

/* layout */
.main { }

.main form { }

/* form box line */
.box { min-height:25px; _height:25px; padding-bottom:15px }

.box:after { content:'.'; clear:both; display:block; height:0; visibility:hidden; line-height:0 }

.box { zoom:1 }

/* form box column 3 */
.box .l { float:left; width:80px; padding-right:5px; padding-top:3px; text-align:right }

.box .c { float:left; width:255px }

.box .r { float:left; height:20px; padding-left:15px; padding-top:3px }

.box .tip_normal { clear:both; padding-left:85px; padding-top:5px; color:#999 }

.box .tip { padding-left:2px; color:#999 }

.box .tip_list { position:absolute; height:60px; padding: 0 0 0 20px; background: url(http://mat1.gtimg.com/www/mb/images/openTipbg.png) no-repeat 0 -103px }

.box .tip_list p { line-height:20px; color:#999 }

.box .tip_list p.txt_error { color:red }

.box .error { color:#f00; background:url(http://mat1.gtimg.com/www/mb/images/page/ico_form_error.png) 2px 7px no-repeat }

.box .ok { width:16px; color:#f00; background:url(http://mat1.gtimg.com/www/mb/images/page/ico_form_ok.png) 2px 4px no-repeat }

.box .c input.txt { float:left; width: 240px; height:14px; padding:3px; line-height:14px; font-size:12px; border: 1px solid #7F9CBA }

.box .c input.txt_gray { color:#999 }

.box .c .radio_item { display:block; float:left; margin-right:20px }

.box .c select { float: left; margin-right:5px; height: 22px; line-height: 14px }

.remName { width: 272px; padding-top:5px; padding-left:85px; line-height: 18px }

.remName a { margin-right:10px; display:inline-block; text-decoration: underline; white-space: nowrap }

.box_2 .l img { vertical-align:middle }
.box_2 .ico_wb {background:url(http://mat1.gtimg.com/www/mb/images/regBg3_1.png) no-repeat}
.box_2 .ico_wb {display:inline-block;width:10px;height:17px;margin-right:3px;background-position:-201px -2px;_background-position:-201px 0;vertical-align:middle;*vertical-align:top;_vertical-align:middle}

.box_2 .tip_list { margin-top: -20px; margin-left:0 }

.box_3 .tip_list { margin-top: -20px; margin-left:0 }

.box_6 .c .bir_txt { float:left; display:block; margin-right:5px; line-height:22px }
.box_6 .c { width:auto }

.box_8 .country { width:75px }

.box_8 .province { width:65px }

.box_8 .city { width:65px }

.box_9 { padding-bottom:5px }

.box_10 img { cursor:pointer }

.box_11 .c { }

.box_11 .c button { width:150px; padding: 3px 10px 4px 10px; font-size: 12px; vertical-align: middle; white-space: nowrap }

.box_11 button strong { font-size:14px }

.box_11 .c .waiting { background: url(http://mat1.gtimg.com/www/mb/images/loading.gif) no-repeat 0 center; display: inline-block; line-height: 20px; margin-left: 5px; padding-left: 20px }

.box_12 .c { line-height:18px }
#imweb_submit { width:auto; cursor:pointer }

.imweb_bak{width:800px;margin:0 auto;text-align:center;line-height:30px;}
.bg{height:30px;background:#ccc;}
.blank_bg{z-index:0;}
.codeBox{border:solid #74B4EF 1px;width:400px;height:270px;margin:0 auto;position:absolute;top:30px;left:150px;background:#fff;z-index:1;}
.codeBox .title{background:#B4D8F3;position:relative;height:32px;line-height:32px;font-size:14px;font-weight:bold;padding-left:10px;}
.codeBox .title span{position:absolute;width:32px;height:32px;right:0;top:0;background:url(http://zc.qq.com/iframe/0/img/dialog_close.png) center center no-repeat;cursor:pointer;}
.codeBox h4{color:#f00;line-height:30px;text-align:center;padding:10px 0;font-size:12px;}
.outer .left{float:left;width:100px;height:20px;text-align:right;}
.outer .right{float:left;width:300px;height:30px;}
.outer_1 .left{padding-top:7px;padding-right:5px;width:95px;}
.outer_1 .right{height:40px;}
.outer_1 .right input{padding:5px;ime-mode:disabled;}
.outer_1 .right span.error{color:#f00;}
.outer_3 .right{height:70px;}
.outer_3 .right img{cursor:pointer;}
.outer_4 .right span{background:url(http://zc.qq.com/iframe/0/img/exp_btn.png);width:66px;height:22px;line-height:22px;display:inline-block;text-align:center;cursor:pointer;}

.information1{
		font-size:0.4cm;
		color:red;
		
	}
</style>
<!-- 加载js倒计时跳转文件 -->
<script src="../js/alertBarEdit.js"></script>

<script language="javascript">
<!--	
	//javascript去空格函数 
function warnCharsNotInBag(s)
{
    var i;
    var returnString = false;
 
    for (i = 0; i < s.length; i++)
    {
        var c = s.charAt(i);
 
        if (c!=9 && c!=0 && c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8)
        {
            returnString = true;
        }
        else{
        	returnString = false;
        }
    }
 
    return returnString;
}
	function LTrim(str){ //去掉字符串 的头空格
		var i;
		for(i=0;i<str.length; i++) {
			if(str.charAt(i)!=" ") break;
		}
		str = str.substring(i,str.length);
		return str;
	}
	
	function RTrim(str){
		var i;
		for(i=str.length-1;i>=0;i--){
			if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
		}
		str = str.substring(0,i+1);
		return str;
	}
	function Trim(str){
	
		return LTrim(RTrim(str));
	
	}
	
	function check() {
		
		if(Trim(document.form.s_name.value) == "") {
			alert("请输入姓名!");
			document.form.s_name.focus();
			return false;
		}
		if(Trim(document.form.s_password.value) != <%=Login.getS_password() %>) {
			alert("请在'密码确认'处填写正确密码修改信息!");
			document.form.s_password.focus();
			return false;
		}
		
		if(Trim(document.form.s_sex.value) == "") {
			alert("请选择性别!");
			document.form.s_sex.focus();
			return false;
		}
		if(Trim(document.form.s_classes.value) == "") {
			alert("请选择所在班级!");
			document.form.s_classes.focus();
			return false;
		}
		return true;
		
	}
-->
</script>

<!-- <link href="css/reg.css" rel="stylesheet" /> -->
<!--<script src="js/simple.js"></script>-->
<script src="reg_data/simple.js"></script>
<script src="reg_data/ver.js"></script><script src="reg_data/location_chs.js"></script><link href="reg_data/mi.css" type="text/css" rel="stylesheet"><script async="true" src="reg_data/mi.js" type="text/javascript" charset="utf-8"></script></head>
<body>
<!-- 必须在body体里面才能运行 -->
<script>
if(<%=userInfoUpdata.isInfoUpdataStates()%>){
	divMessageBox('修改提示','修改成功!',300,100);
}
</script>
<div id="imweb_main" class="main" >
    <form action="" method="post" name="form" onsubmit="return check()">
	<div class="information1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=userInfoUpdata.getBackNews() %></div><br/>
	<input type="hidden" name="bool" value="bool" />
	 <div class="box box_3">
            <div class="l">姓名：</div>
            <div class="c">
                <input name="s_name" id="weiboNick" class="txt" tabindex="3" maxlength="24" type="text" value=<%=userInfoUpdata.getS_name() == ""?"''":userInfoUpdata.getS_name()%> />
            </div>
            <div class="r tip" id="weiboNickInfo"></div>
        </div>

       
        <%--
        <div class="box box_5">
            <div class="l">确认密码：</div>
            <div class="c">
                <input name="imweb_passwordAgain" id="imweb_passwordAgain" class="txt" maxlength="16" tabindex="5" type="password">
            </div>
            <div class="r tip" id="imweb_passwordAgainInfo"></div>
        </div>
        --%>
        <div class="box box_001">
            <div class="l"> 年龄：</div>
             <div class="c">
                <input name="s_age" id="imweb_passwordAgain" class="txt" maxlength="10" tabindex="5" type="text" value=<%=userInfoUpdata.getS_age() == ""?"''":userInfoUpdata.getS_age()%> />
            </div>
        <div class="r tip" id="imweb_otherEmailInfo"></div>
        </div>
        
        <div class="box box_7">
            <div class="l">性别：</div>
            <div class="c">
            	<input type="button" name="sex" value=<%=userInfoUpdata.getS_sex()%> />
                <input name="s_sex" type="radio" value="男" checked="checked" />男
                <input name="s_sex" type="radio" value="女" />女
            </div>
            <div class="r" id="imweb_sexInfo"></div>
        </div>
			
		<div class="box box_001">
            <div class="l"> 所在班级：</div>
             <div class="c">
		<select name="s_classes">
			<option value=<%=userInfoUpdata.getS_classes() == ""?"''":userInfoUpdata.getS_classes()%> ><%=userInfoUpdata.getS_classes() == ""?"--请选择--":userInfoUpdata.getS_classes()%></option>
			<option value="软件一班" >软件一班</option>
			<option value="软件二班" >软件二班</option>
			<option value="计算机一班" >计算机一班</option>
			<option value="计算机二班" >计算机二班</option>
			<option value="其他" >其他</option>
		</select>
		</div>
        <div class="r tip" id="imweb_otherEmailInfo"></div>
        </div>
	
		<div class="box box_001">
            <div class="l"> 所属系别：</div>
             <div class="c">
		<select name="s_department">
			<option value=<%=userInfoUpdata.getS_department() == ""?"''":userInfoUpdata.getS_department()%> ><%=userInfoUpdata.getS_department() == ""?"--请选择--":userInfoUpdata.getS_department()%></option>
			<option value="计算机系" >计算机系</option>
			<option value="工商管理系" >工商管理系</option>
			<option value="日语系" >日语系</option>
			<option value="韩语系" >韩语系</option>
			<option value="其他" >其他</option>
		</select>
		</div>
        <div class="r tip" id="imweb_otherEmailInfo"></div>
        </div>
	
		<div class="box box_001">
            <div class="l"> 入学年份：</div>
             <div class="c">
		<select name="s_grade">
			<option value=<%=userInfoUpdata.getS_grade() == "" ? "''":userInfoUpdata.getS_grade() %> ><%=userInfoUpdata.getS_grade() == "" ? "--请选择--":userInfoUpdata.getS_grade() %></option>
			<option value="08级" >08级</option>
			<option value="09级" >09级</option>
			<option value="10级" >10级</option>
			<option value="11级" >11级</option>
			<option value="其他" >其他</option>
		</select>
		</div>
        <div class="r tip" id="imweb_otherEmailInfo"></div>
        </div>
	
        <div class="box box_1">
            <div class="l">电子邮箱：</div>
            <div class="c">
                <input name="s_email" id="imweb_otherEmail" class="txt" tabindex="1" maxlength="38" type="text" value=<%=userInfoUpdata.getS_email() %> />
            </div>
            <div class="r tip" id="imweb_otherEmailInfo"></div>
        </div>
        
        <div class="box box_2">
            <div class="l"><span></span>手机号：</div>
            <div class="c">
                <input name="s_phone" id="weiboAccount" class="txt" tabindex="2" maxlength="38" type="text" value=<%=userInfoUpdata.getS_phone() %> />
            </div>
            <div class="r tip" id="weiboAccountInfo"></div>
        </div>


		<div class="box box_2">
            <div class="l"><span></span>头像：</div>
            <div class="c">
            	<img id="imgold" border="1" height="220" width="250" style="border-color:#000000" src="../images/upload_images/<%=Login.getId() %>.jpg" />
            </div>
        </div>

		<div class="box box_2">
            <div align="life">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="updatePhoto.jsp">点此上传头像</a></div>
        </div>

 		<div class="box box_4">
            <div class="l">密码确认：</div>
            <div class="c">
                <input name="s_password" id="imweb_password" class="txt" maxlength="16" tabindex="4" type="password" value="" >
            </div>
            <div class="r tip" id="imweb_passwordInfo"></div>
        </div>

		<div class="box box_2">
            <div align="life">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="updatePassword.jsp">点此修改密码</a></div>
        </div>

        <div class="box box_11">
            <div class="l">&nbsp;</div>
            <div class="c">
                <button type="submit" tabindex="21" id="imweb_submit">提交</button>
                <span id="imweb_waiting" class="waiting hidden">正在提交信息</span>
                
            </div>
            <div class="r"></div>
        </div>
      
    </form>
    <div class="clear"></div>
</div>

<script type="text/javascript">
<%
	if(Login.isB()){
		//System.out.println(Test.isB());
		Login.setB(false);
		//System.out.println(Test.isB());
%>
	window.parent.location.reload();
	//alert("头像重新加载啦！");
<%		
	}
%>
</script>

<div id="imweb_bak" class="imweb_bak hide"> </div>
<!--<script src="js/reg.js"></script>-->
<script src="reg_data/reg.js"></script>
<script type="text/javascript">
MIApp={};
</script>
<script src="reg_data/mi_111215e.js"></script>
<!--<script src="js/d.js"></script>-->
<script src="reg_data/emailreg_new.js"></script>

<div style="display:none"></div><div style="display:none"><img src="reg_data/mi_003.js"><img src="reg_data/mi_005.js"><img src="reg_data/mi_002.js"><img src="reg_data/mi_004.js"></div></body></html>
