<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.*" %>

<jsp:useBean id="register" class="com.fe.ems.manager.RegisterManager" scope="session"/>

<jsp:setProperty name="register" property="id" param="id" />
<jsp:setProperty name="register" property="s_password" param="s_password" />
<jsp:setProperty name="register" property="s_name" param="s_name" />
<jsp:setProperty name="register" property="s_sex" param="s_sex" />
<jsp:setProperty name="register" property="s_classes" param="s_sex" />

<%
	String id = request.getParameter("id");
	String s_password = request.getParameter("s_password");
	if(register.getId() != null && !register.getId().equals("")){
		register.registerManager();
	}
	if(!register.isRegisterstates() && id == null && s_password == null){
		register.setBackNews("");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script type="text/javascript" src="../js/base.js"></script>
<script type="text/javascript" src="../js/select_mode.js"></script>
<title>ѧ��ע��</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 24px}
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

-->
</style>

<!-- ������֤��Ϣ��js���� -->
<script src="../js/check.js"></script>

<!-- ����js����ʱ��ת�ļ� -->
<script src="../js/alertBarRegister.js"></script>

</head>
<body>

<!-- ������body������������� -->
<%
out.println("<script>");
if(!register.isRegisterstates() && request.getParameter("id") != null && request.getParameter("id") != "")
{
	out.println("divMessageBox('ע����ʾ','ע��ʧ��,��������д��Ϣ��ע��!',300,100,false);");
}
else if(register.isRegisterstates())
{
	out.println("divMessageBox('ע����ʾ','ע��ɹ�,������ת����¼��ҳ!',300,100,true);");
}
out.println("</script>");
%>
<br />
<div class="nav">
</div>
<div class="main1">
<form id="fReg" method="post" action="" autocomplete="off" name="form" onsubmit="return reg()">
            <div align="center" class="STYLE1" style="color:#FF0000"><%=register.getBackNews() %></div>
			<ul class="main_form">
    <li>
    
      <div class="fm_left"><span class="star"></span>&nbsp;ѧ�ţ�</div>
      <div class="fm_right">
            <tr>
              <td><span class="suggest_box" id="useremail_box">
<!-- �û�ID -->
                <input type="text" class="input" name="id" value=""  /><span style="position:absolute;top:10px;left:263px;width:300px;height:20px" class="states1">������ѧ��</span>
                </span></td>
            </tr>
        <div class="f_s_12 clear">
          <div class="f_s_12 c_8A8A8A clear" id="email_name_r_info">&nbsp<br/><br/></div>
        </div>
      </div>
      
	  <div class="fm_left"><span class="star"></span>&nbsp;������</div>
	  <div class="fm_right">
<!-- �û����� -->
        <input type="text" name="s_name" class="input" value=""><span class="states1">����������</span>
        <div class="f_s_12 c_8A8A8A clear" id="pass_word_info">&nbsp</div>
      </div>
    </li>
    
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;���룺</div>
      <div class="fm_right">
<!-- �û����� -->
        <input type="password" name="s_password" id="password" class="input" value=""><span class="states1">����������</span>
        <div class="clear"></div>
        <div class="f_s_12 c_8A8A8A clear" id="password_info">&nbsp</div>
      </div>
    </li>
    
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;ȷ�����룺</div>
      <div class="fm_right">
<!-- �û��ظ����� -->
        <input type="password" class="input" name="s_password1" id="re_password" value=""><span class="states1">�������ظ�����</span>
        <input type="hidden" id="p1" name="p1" value="0">
        <span style="display:none" class="right_img" id="re_password_right"></span><span style="display:none" id="re_password_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        <div class="f_s_12 c_8A8A8A clear" id="re_password_info">&nbsp</div>
      </div>
    </li>
    
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;�ձ�</div>
      <div class="fm_right">
        <div><input type="radio" name="s_sex" value="��" checked="checked"/>&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        				<br/><input type="radio" name="s_sex" value="Ů"/>&nbsp;&nbsp;Ů
        </div>
        </span>
        
      </div>
    </li>
   
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;�༶��</div>
      <div class="fm_right">
		<div style="position:absolute;top:468px;left:323px;">
			<select name="s_classes" style="width:120px;height:25px;">
				<option value="1" >--��ѡ��--</option>
				<option value="���һ��" >���һ��</option>
				<option value="�������" >�������</option>
				<option value="�����һ��" >�����һ��</option>
				<option value="���������" >���������</option>
				<option value="����" >����</option>
			</select>
		</div>
		</div>
		
		
    </li>
    <script type="text/javascript">

    window.isNotShowRandomImg = false;

</script>
   
   
    	<li>
      <div class="fm_left">&nbsp;</div>
      <div class="fm_right">
        <input type="checkbox" name="agree" id="agree" checked="checked">
        ��ͬ��<a href="http://reg.163.com/agreement.shtml?v=20110118" target="_blank">������ע�����</a>��<a href="http://reg.163.com/agreement_game.shtml" target="_blank">����������</a> </div>
    </li>
    <li>
      <div class="fm_left">&nbsp;</div>
      <div class="fm_right" style="background:url(../images/icon4.jpg) no-repeat bottom left">
        <input class="button1" id="submit" type="submit" value="">
      </div>
    </li>
  </ul>
</form>
</div>
<div class="main2"></div>
<br />
<br />
<br />
<br />

<script type="text/javascript">
    new Mselect($_id("s_select"));
</script>

</body>
</html>
