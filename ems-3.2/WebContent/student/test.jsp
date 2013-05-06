<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="com.fe.ems.manager.*" %>
<%@ page import="com.fe.ems.util.*" %>
<%@ page import="com.fe.ems.model.*" %>
 
<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>

<%
	int lianxinums = Integer.parseInt(this.getServletContext().getInitParameter("lianxinums"));
	int lianxistartid = Integer.parseInt(this.getServletContext().getInitParameter("lianxistartid"));
	int pidno = Integer.parseInt(request.getParameter("pidno"));
	if(lianxistartid >= pidno && pidno > (lianxinums+lianxistartid)){
		pidno = lianxistartid+1;
	}
	String p_id = this.getServletContext().getInitParameter("examname") + pidno;
	examtime.setP_id(p_id);
%>
<%
	int pageNo = 1;
	int pageSize =2;
	
	paperManager.findAllPaper(pageNo, pageSize, p_id);
	List paperList = paperManager.getList();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>学生练习页面</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">
td img {display: block;}
</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<link href="../css/exam.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	color: #0D5585;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.STYLE3 {
	color: #66665E;
	font-size: 12px;
}
.STYLE5 {color: #FF0000}
.Layer1 {
	position:absolute;
	width:195px;
	height:316px;
	z-index:1;
	left: 577px;
	top: 0px;
	overflow:inherit;
}
#Layer2 {
	position:absolute;
	width:200px;
	height:73px;
	z-index:2;
	top: 460px;
	left: 320px;
}
.user {
	position:absolute;
	width:125px;
	height:25px;
	z-index:1;
	left: 950px;
	top: 146px;
	color:#FFFFFF;
	font-size:13px;
}
.exam_photo {
	position: absolute;
	height: 147px;
	width: 120px;
	left: 30px;
	top: 12px;
	background-image: url(../images/exam_photo.jpg);
	border:1；
}
a:hover img { 
	z-index : 100; 
	width : 400px; 
	height : 400px; 
	padding : 5px; 
	background-color : #fff; 
	border : 1px solid #333; 
}
.tiankonganswer{
	position: absolute;
	left: 0px;
	top: -30px;
	font-size:17px;
}
-->
</style>
<!-- InstanceEndEditable -->
</head>
<body>
<div id="wrapper">
  <div id="logo"></div>
	<hr />
	<!-- end #logo -->
	<!-- InstanceBeginEditable name="menu" -->
  <div id="header">
    <div id="menu">
      <ul>
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="../index.jsp" class="first">考生首页</a></li>
        <% if(Login.isSuccess()){
			%>
			 <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="student_info.jsp">个人信息</a></li>
			<%	
		}%>
        <!-- <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="examimitate.jsp?id=1206a">模拟考试</a></li> -->
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">
			<% if(Login.isSuccess()){
			%>
			退出登录
			<%
			}else{
			%>
			返回登录
			<%	
			}%>
			</a></li>
      </ul>
    </div>
    <!-- end #menu -->
    <div class="user">
		<%=Login.getS_name()== null? "欢迎你使用本系统!" : Login.getS_name() + ",欢迎你!"%> 
	</div>
    <!-- end #search -->
  </div>
  <!-- InstanceEndEditable -->
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<!-- InstanceBeginEditable name="main" -->
	
	<form name="form1" method="post" action="">
	
  <div onmousemove="javascript:refresh()" onmouseover="javascript:refresh()" > <!-- 随时更新图片，如果找不到，则显示默认图片  -->
  
  <br /><br /><br /><br />
	<div class="exam_main" style="margin-left:auto; margin-right:auto;">
	  <div class="exam_left">
	  <!-- 此处放置学生的头像 -->
	    <div class="exam_photo" >
	   <img id="studentPhoto" border="1" height="147" width="120" style="border-color:#000000" src="../images/upload_images/<%=Login.getId() %>.jpg" alt="" />
	    </div>
	    
        <div class="exam_username STYLE1">用户名<br />
        <span class="STYLE3"><%=Login.getS_name()== null?"临时用户": Login.getS_name()%></span></div>
		<div class="exam_userNo STYLE1">考试号<br />
	    <span class="STYLE3"><%=Login.getId()== null?"000":Login.getId() %></span></div>
	    <div class="exam_oper"><img src="../images/exam_oper.jpg" alt="操作说明" width="168" height="39" /></div>
		
	      <div class="exam_oper_content">
	      <br/><br/>
	       1.判断题按<br/>
	        “对 /错”<br />
	                  键答题<br/>
           <br/>2.选择题按<br/>
          “A/B/C/D” <br/>
                            键答题<br />
           <br/>3.按“上翻”<br/>
	                  键 查看<br/>
	                上一题<br />
          <br/>4.按“下翻”<br/>
                           键进入<br/>
                          下一题<br/>
        </div>
	  </div>
	  
      <div class="exam_right">
        <UL class="cstm" id=timu><IMG 
 			 src="../images/20080320132844619.gif" width="37" height="37">正在出题中，请稍等！ 
		</UL>
		
		<!-- 填空题位置 -->
		<div id="Layer2" class="tiankonganswer"><br/>
			<!-- <input type="text" name="tiankong" value=""  onchange="xxti(document.form1.tiankong.value)"/>  -->
		</div>
		
		<!-- 试题图片摆放位置 -->
		<div class="Layer1" ><a href="#"><img height="321" width="200" id="examimage" src="../images/defaultImage.gif" /></a></div>
		
			<div class="kszuo">
                    <ul class="qhcon">
                        <li class="rw" id="imgzidongpancuo">
                      </li>
                        <li class="result"><span class="sysjtest">正确答案：</span><span class="zqda" style="font-size: 35px;
                            display: none" id="spzhengquedaan"></span><span class="daan">本次答案：</span>
                            <span class="answer" style="font-size: 20px;" id="spyhdaan"></span></li>
                        <li class="record"><span id="spdatiqingkuang" style="display: none"></span><span
                            style="float: right; padding-right: 20px;" id="spanZhidao">
                            </span></li>
                        <li class="options"><span>
                            <input id="ckbdatiqingkuang" type="checkbox" value="0" onclick="xianshidantiqingkuang()" />答题情况</span><span><input
                                id="ckbzhengquedaan" type="checkbox" value="0" onclick="xianshizhengquedaan()" />正确答案</span><span><input
                                    id="ckbzidongqianjin" onclick="fzidongqianjin()" type="checkbox" value="0" />自动前进</span>
                           <span><input id="ckbzidongpancuo" type="checkbox" value="0" onclick="fzidongpancuo()" />自动判错</span></li> 
                    </ul>
           </div>
<TABLE class=man_zone_table id=ta cellSpacing=1 cellPadding=0 align=center 
border=0>
  <TBODY>
  
  <SCRIPT language=javascript type=text/javascript>
  
     //解决返回和刷新问题！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
	function before(){
    	 //if(tijiao == false){
    	//	event.returnValue = "您还没有提交试卷，离开页面会退出考试成绩无效，您是否继续?"; 
    	 //}
	}
     
	function unload()//关闭网页再重新打开登录界面   
	{
		if(tijiao == false){
			var n = window.event.screenX - window.screenLeft;
    		var b = n > document.documentElement.scrollWidth-20;
    		if(b && window.event.clientY < 0 || window.event.altKey){
      		  //关闭
    		}else{
      	    //刷新
       	    document.getElementById('iie')
    		}
    	 }
	   
	}
	function brs()//插入object   
	{
		if(tijiao == false){
	    	//document.body.innerHTML += 
	       		//"<object id='iie' width='0' height='0' classid='CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6'></object>";
	    }
	}   
	  window.attachEvent("onbeforeunload",before);
      window.attachEvent('onload',brs);
	  window.attachEvent('onunload',unload);
</SCRIPT>
  </TBODY></TABLE>
<DIV class=ksyou>
		
			<table border="0" cellpadding="0" cellspacing="0" width="194">
<!-- fwtable fwsrc="未命名" fwbase="exam_oper.jpg" fwstyle="Dreamweaver" fwdocid = "278736020" fwnested="0" -->
  <tr>
   <td><img src="../images/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="45" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="43" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="46" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="46" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="5" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="6"><img name="exam_oper_r1_c1" src="../images/exam_oper_r1_c1.jpg" width="194" height="7" border="0" id="exam_oper_r1_c1" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="7" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r2_c1" src="../images/exam_oper_r2_c1.jpg" width="9" height="45" border="0" id="exam_oper_r2_c1" alt="" /></td>
   <td><img name="exam_oper_r2_c2" src="../images/exam_oper_r2_c2.jpg" width="45" height="45" border="0" id="exam_oper_r2_c2" alt="" onClick="shangyiti()" /></td>
   <td><img name="exam_oper_r2_c3" src="../images/exam_oper_r2_c3.jpg" width="43" height="45" border="0" id="exam_oper_r2_c3" alt="" onClick="xiayiti()" /></td>
   <td><img name="exam_oper_r2_c4" src="../images/exam_oper_r2_c4.jpg" width="46" height="45" border="0" id="exam_oper_r2_c4" alt="" onClick="closeObj()" /></td>
   <td><img name="exam_oper_r2_c5" src="../images/exam_oper_r2_c5.jpg" width="46" height="45" border="0" id="exam_oper_r2_c5" alt="" onClick="ftijiao()" /></td>
   <td><img name="exam_oper_r2_c6" src="../images/exam_oper_r2_c6.jpg" width="5" height="45" border="0" id="exam_oper_r2_c6" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="45" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r3_c1" src="../images/exam_oper_r3_c1.jpg" width="9" height="43" border="0" id="exam_oper_r3_c1" alt="" /></td>
   <td><img name="exam_oper_r3_c2" src="../images/exam_oper_r3_c2.jpg" width="45" height="43" border="0" id="exam_oper_r3_c2" alt="" onClick="xxti('A')" /></td>
   <td><img name="exam_oper_r3_c3" src="../images/exam_oper_r3_c3.jpg" width="43" height="43" border="0" id="exam_oper_r3_c3" alt="" onClick="xxti('B')" /></td>
   <td><img name="exam_oper_r3_c4" src="../images/exam_oper_r3_c4.jpg" width="46" height="43" border="0" id="exam_oper_r3_c4" alt="" onClick="xxti('C')" /></td>
   <td rowspan="2"><img name="exam_oper_r3_c5" src="../images/exam_oper_r3_c5.jpg" width="46" height="89" border="0" id="exam_oper_r3_c5" alt="" onClick="qrtijiao()" /></td>
   <td rowspan="5"><img name="exam_oper_r3_c6" src="../images/exam_oper_r3_c6.jpg" width="5" height="185" border="0" id="exam_oper_r3_c6" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="43" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r4_c1" src="../images/exam_oper_r4_c1.jpg" width="9" height="46" border="0" id="exam_oper_r4_c1" alt="" /></td>
   <td><img name="exam_oper_r4_c2" src="../images/exam_oper_r4_c2.jpg" width="45" height="46" border="0" id="exam_oper_r4_c2" alt="" onClick="xxti('D')" /></td>
   <td><img name="exam_oper_r4_c3" src="../images/exam_oper_r4_c3.jpg" width="43" height="46" border="0" id="exam_oper_r4_c3" alt="" onClick="pdti('A')" /></td>
    <td><img name="exam_oper_r4_c4" src="../images/exam_oper_r4_c4.jpg" width="46" height="46" border="0" id="exam_oper_r4_c4" alt="" onClick="pdti('B')" /></td>
   <td><img src="../images/spacer.gif" width="1" height="46" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="3"><img name="exam_oper_r5_c1" src="../images/exam_oper_r5_c1.jpg" width="9" height="96" border="0" id="exam_oper_r5_c1" alt="" /></td>
    <td><img name="exam_oper_r5_c2" src="../images/exam_oper_r5_c2.jpg" width="45" height="45" border="0" id="exam_oper_r5_c2" alt="" onClick="diyiti()" /></td>
    <td><img name="exam_oper_r5_c3" src="../images/exam_oper_r5_c3.jpg" width="43" height="45" border="0" id="exam_oper_r5_c3" alt="" onClick="alert('登录后才可使用!')" /></td>
    <td><img name="exam_oper_r5_c4" src="../images/exam_oper_r5_c4.jpg" width="46" height="45" border="0" id="exam_oper_r5_c4" alt="" onclick="zuihoutiyi()" /></td>
    <td rowspan="2"><img name="exam_oper_r5_c5" src="../images/exam_oper_r5_c5.jpg" width="46" height="88" border="0" id="exam_oper_r5_c5" alt="" onClick="xiayiti()" /></td>
   <td><img src="../images/spacer.gif" width="1" height="45" border="0" alt="" /></td>
  </tr>
  <tr>
  <td colspan="2"><img name="exam_oper_r6_c2" src="../images/exam_oper_r6_c2.jpg" width="88" height="43" border="0" id="exam_oper_r6_c2" alt="" onClick="ksdt()" /></td>
  <td><img name="exam_oper_r6_c4" src="../images/exam_oper_r6_c4.jpg" width="46" height="43" border="0" id="exam_oper_r6_c4" alt="" onclick="chongxinkaishi()" /></td>
   <td><img src="../images/spacer.gif" width="1" height="43" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3"><img name="exam_oper_r7_c2" src="../images/exam_oper_r7_c2.jpg" width="134" height="8" border="0" id="exam_oper_r7_c2" alt="" /></td>
   <td><img name="exam_oper_r7_c5" src="../images/exam_oper_r7_c5.jpg" width="46" height="8" border="0" id="exam_oper_r7_c5" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="8" border="0" alt="" /></td>
  </tr>
</table>
		
</DIV>




<script src="../js/jquery.min.js" type="text/javascript" language="JavaScript"></script>

        <script language="javascript" type="text/javascript">
                var miaozhong =45*60;//时间秒钟
                var fenshu = 0;//总分数
                var t;//时间
                var total = <%=paperManager.getTotalRecords()%> ;//题目总数
                var timuId = new Array(1367);//题目ID
                var timuindex = new Array(1367);//题目序号
                var totalright = 0;//答对的总记录数
                var totalwrong = 0;//答错的总记录数
                var yhdaan = new Array(total);//用户答案
                var zqdaan = new Array(total);//正确答案
                var cwdaan = new Array(total);//错误答案
                for(var i =0;i<total;i++)
                {
                    yhdaan[i] ="";//初始化
                    zqdaan[i]="";
                    cwdaan[i]="";
                }
                var jianpan = true;//开启键盘，false关闭键盘
                var start = false;//false未开始考试，true 开始考试
                var zhengquedaan = false;//false 不显示正确答案，true显示正确答案
                var datiqingkuang = false;//false 不显示答题情况，true显示
                var zidongpancuo = false;//false 不显示 判错，true显示
                var zidongqianjin = false;//false 不自动前进，true 自动前进， 和自动判错不能同时为true
                var panduan = 0;//false 选择题，true判断题
                var tijiao = false;//未确认提交，true 确认提交
                var keynum;//键盘对应keycode
                var index = 1;//当前第几题
                 <%  
                	int count = 0;
                	for (Iterator iter=paperList.iterator(); iter.hasNext();) {
        				PaperModel paper = (PaperModel)iter.next();
        				String str = paper.getName();
        				out.print("timuId[" + count + "]=" + str + ";");
        				count ++;
       				} 
    		    %>
    		    
				 //alert(Shuffle(sequence));
				 //将数组里面的数字随机排序
				     for ( var i=<%=paperManager.getTotalRecords()-1%> ; i >= 0 ; i-- )
				      {
				    	  //alert(i);
				          //var v = parseInt(Math.random()*(i+1));
				          //var tmp = timuId[v];
				          //timuId[v] = timuId[i];
				          //timuId[i] = tmp;   
				     }
    		    
				$(function(){

	                    //初始化第一题
	                  jiazaitimu(1);
	                    t = setInterval("shijian()",1000);
	                  start = true;
	              })

                    //选择题型
                    function xuanzetixing()
                    {
                        if($("#rd1").attr("checked") == true)
                        {
                            window.location.href = window.location.href +"?stype=0";//判断题
                        }
                        else{
                            window.location.href = window.location.href +"?stype=1";//选择题
                        }
                    }
                    //错题反馈
                    function fk()
                    { jianpan = false;
                         $.ajax({
                            type:"get",
                            url:"server/fankui.ashx",
                            data:"id="+timuId[index-1],
                            success:function(data)
                            {
                                 $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                .width($(window).width())  
                                .height($(window).height())
                                .fadeIn(1000);
                                $("#mydiv").html(data);
                                var objWH=getObjWh('mydiv');
                                var tbT=objWH.split("|")[0]+"px";
                                var tbL=objWH.split("|")[1]+"px"
                                var n = window.event.screenX - window.screenLeft-1000;
		    					var b = document.documentElement.scrollWidth-20-1130;
		    					//alert("n:" + n);
		    					//alert("b" + b);
		                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                                //$("#mydiv").css({"top":tbT,"left":tbL,"z-index":"9999","display":"block"})
                            }
                            })
                    }
                   function fankui()
                    {
                    
                     var name =$("#ttname").val();
                     var phone =$("#ttphone").val();
                     var note =$("#ttnote").val();
                     $.ajax({
                        type:"get",
                        url:"server/fankui.ashx",
                      data:"cityid="+1+"&id="+timuId[index-1]+"&n="+escape(name)+"&p="+phone+"&nt="+escape(note),
                        success:function(data)
                        {
                            if(data == "ok")
                            {
                                alert('提交成功，感谢你的支持!');
                                $("#mark").hide();
                                 jianpan = true;
                            }
                            else
                            {
                             alert('提交出错，请再试一次!');
                              jianpan = true;
                             return false;
                             }
                        }
                        })
                    }
                    //加载对应ID的题目
                    //index 当前第几题
                    var req;
                    function jiazaitimu(i)
                    {   
                        var dnow = new Date(); 
                        index = i;
                        $("#timu").html("<img src=\"../images/20080320132844619.gif\" />题目正在加载中，请稍等！");
						//加载题目时将判错的图片设置为默认的背景色
						$("#imgzidongpancuo").html("<img src=\"../images/rw_4.png\" />");

                        if(yhdaan[index-1]!="")
                        {
                            $("#spyhdaan").html(yhdaan[index-1]);//当前用户答案
                        }
                        else
                        {
                            $("#spyhdaan").html("");//还没作答
                            //$("#td"+i).css("background","#FF7E00");//当前题目
                        }                     

                        $("#spwdt").html((<%=paperManager.getTotalRecords()%>-totalright-totalwrong)+"题未答");//未答题目
						//alert(timuId[index-1]);
                        var uri = "../server/lianxi.jsp?id=" + timuId[index-1];
                        var obj = document.getElementById("examimage");//获得题目图片显示的id
						//alert(timuId[index-1]);
                        //将题目图片加载到显示位置
                        obj.src = "../images/upload_images/" + "<%=examtime.getP_id() %>" + timuId[index-1] + ".jpg";
						//alert(obj.src); 
                        if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                        }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        req.open("get", uri, false);
                        req.onreadystatechange = callback;
                        req.send(null);

                        if(req.readyState == 4){
							if(req.status == 200) {
                       			 var str = req.responseText.split("$");
                       			 //alert("加载题目："+req.responseText);
                        		 var msg = str[0];
                      			 var type = str[1];
                        	   	 $("#timu").html(msg);//题目
                        		 panduan = type;//题型
                       			 if(panduan == 2){
                       			 	var Layer2 = document.getElementById("Layer2");
                       			 	Layer2.innerHTML = "填空答案：<input type='text' name='tiankong' onchange='xxti(document.form1.tiankong.value)' />";
                       			 }
                       			 else{
                       				var Layer2 = document.getElementById("Layer2");
                       			 	Layer2.innerHTML = "<p/>";
                       			 }
							}
                        }
                    }

                     function refresh(){
                    	var obj = document.getElementById("examimage");//获得题目图片显示的id
                    	var objstudentPhoto = document.getElementById("studentPhoto");//获得学生头像显示的id
                    	//alert(obj.readyState);
                       if (obj.readyState == "loading") {
				            obj.src = "../images/defaultImage.gif";
				            //alert(obj.src);
				        }
                    	if (objstudentPhoto.readyState == "uninitialized") {
				            objstudentPhoto.src = "../images/exam_photo.jpg";
				            //alert(objstudentPhoto.src);
				        }
                    	//alert(objstudentPhoto.readyState);
                    	//alert(objstudentPhoto.src);
                    }
                    
                    function callback(){
                    	//alert("''''jjjj''");
						if(req.readyState == 4){
							if(req.status == 200) {
								//salert(req.responseText);
								var temp = req.responseText.split("$-$");
								if(temp.length>1){
									var type=temp[0];
								    var msg=temp[1];
								    setMsg(type, msg);
								}else{
									var type = req.responseXML.getElementsByTagName("msg")[0];
									var msg = req.responseXML.getElementsByTagName("msg")[1];
									setMsg(type.childNodes[0].nodeValue, msg.childNodes[0].nodeValue);
								}
								
							}

						}

                    }

                    function setMsg(type, msg){
						contentdiv = document.getElementById("usermsg");
						answerdiv = document.getElementById("spzhengquedaan");
						if(type == "content"){
							contentdiv.innerHTML = msg;
						}else {
							answerdiv.innerHTML = msg;
							
							if(zidongpancuo)
                            {//自动判错
                                if(yhdaan[index-1] !="")
                                {
                                    if(msg == yhdaan[index-1])
                                    {//正确
                                    	//alert(yhdaan[index-1]);
                                        //alert(msg);
                                        $("#imgzidongpancuo").html("<img width='60px' height'50px' src=\"../images/rw_5.png\" />");
                                    }
                                    else
                                    {//错误
                                        $("#imgzidongpancuo").html("<img width='60px' height'50px' src=\"../images/rw_03.png\" />");
                                    }
                                 }
                                 else
                                 {
                                    $("#imgzidongpancuo").html("&nbsp;");
                                 }
                            }
						}

                    }
                    //练习时间
                    function shijian()
                    {
                        if(miaozhong == 0)
                        {
                            qrtijiao();
                            return false;
                        }
                        miaozhong--;
                        $("#spsyshijian").html(""+parseInt(miaozhong/60)+":" + miaozhong %60);
                        $("#spsyshijian1").html(""+parseInt(miaozhong/60)+":" + miaozhong %60);
                    }

                    //添加收藏 s=0 错题，s=1收藏题
                    function shouchang(s)
                    {
                        $.ajax({
                        type:"get",
                        url:"server/cuoti.ashx",
                        data:"city="+1+"&uid="+-1+"&id="+timuId[index-1]+"&t="+s,
                        success:function(data)
                        {
                            if(s=="1")
                            alert('收藏成功!');
                        }
                        })
                    }
                   //开启正确答案
                   function  xianshizhengquedaan()
                   {
                        if($("#ckbzhengquedaan").attr("checked") == true)
                        {//设置选中 显示正确答案
                            zhengquedaan = true;
                            $("#spzhengquedaan").css("display","block");
                        }
                        else
                        {//隐藏答案
                            zhengquedaan = false;
                            $("#spzhengquedaan").css("display","none");
                        }
                        chadaan();//查询答案
                   }
                   //开启答题情况
                   function xianshidantiqingkuang()
                   {
                        if($("#ckbdatiqingkuang").attr("checked") == true)
                        {//设置选中 显示
                            datiqingkuang = true;
                            $("#spdatiqingkuang").css("display","block");
                            $("#spdatiqingkuang").html("共"+total+"题，正确"+totalright+"题，错误"+totalwrong+"题");
                        }
                        else
                        {//隐藏
                            datiqingkuang = false;
                            $("#spdatiqingkuang").css("display","none");
                        }    
                   }
                   //自动判错
                   function fzidongpancuo()
                   {
                        if($("#ckbzidongpancuo").attr("checked") == true)
                        {//显示
                            zidongpancuo = true;
                            zidongqianjin = false;//设置自动前进为false;
                            $("#ckbzidongqianjin").attr("checked",false);
                            $("#imgzidongpancuo").html("");
                             chapancuo();
                        }
                        else
                        {
                            zidongpancuo = false;
                            $("#imgzidongpancuo").html("");
                        }
                   }
                   //自动前进
                   function fzidongqianjin()
                   {
                        if($("#ckbzidongqianjin").attr("checked") == true)
                        {//自动前进
                            zidongpancuo = false;//设置自动判错为false;
                            $("#ckbzidongpancuo").attr("checked",false);
                            zidongqianjin = true;
                        }
                        else
                        {
                            zidongqianjin = false;
                        }
                   }
                   //作答 v 用户答案
                   function zuoda(v)
                   {
                        if(zhengquedaan)
                        {
                          chadaan();//加载正确答案
                          
                        }

                       fdatiqingkuang(v);//答题情况            
                        yhdaan[index-1] = v;//赋值用户答案
                        $("#spyhdaan").html(yhdaan[index-1]);//显示用户答案
                          if(zidongpancuo)
                        {
                            chapancuo();//自动判错
                        } 
                        if(index == total)
                        {
                        	alert("已经是最后一题了！");
                            return false;
                        }            
                        if(zidongqianjin)
                        {//自动加载下一题  
                            index ++;
                            jiazaitimu(index);
                        }               
                      
                   }

                   //答题情况 v 用户答案
                  function fdatiqingkuang(v)
                   {
                	   var uri = "../server/daanlianxi.jsp?id=" + timuId[index-1] + "&answer=" +v;
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       //req.onreadystatechange = callback;
                       req.send(null);
                       //alert(req.responseText);
                       var msg = req.responseXML.getElementsByTagName("msg")[1];
                       var msg = msg.childNodes[0].nodeValue
                       //alert(msg);
                       if(msg == 1)
                       {//正确
                           zqdaan[index-1] = 1;
                           cwdaan[index-1] = 0;
                       }
                       else
                       {//错误                                
                           cwdaan[index-1] = 1;
                           zqdaan[index-1] = 0;
                           if(-1 != -1)
                           {
                               shouchang('0');
                           }
                       }
                   
	                   var rightnum = 0;
	                   var wrongnum = 0;
	                   for(var j=0;j<zqdaan.length;j++)
	                   {
	                        rightnum += Number(zqdaan[j]);
	                   }
	                   for(var k=0;k<cwdaan.length;k++)
	                   {
	                       wrongnum += Number(cwdaan[k]);
	                   }
	                   $("#spdatiqingkuang").html("共"+total+"题，正确"+rightnum+"题，错误"+wrongnum+"题");
	                   totalright = rightnum;
	                   totalwrong = wrongnum;
	                   $("#spwdt").html((<%=paperManager.getTotalRecords()%>-totalright-totalwrong)+"题未答");//未答题目
                       $("#td"+index).css("background","#6ACDF2");//已答题目
                       $("#spyhdaan").html(yhdaan[index-1]);//显示用户答案
              
                   }
                   //自动判错
                   function chapancuo()
                   {     
                	   var uri = "../server/daanlianxistates.jsp?id=" + timuId[index-1];
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       req.onreadystatechange = callback;
                       req.send(null);
                       alert(req.responseText);
                   }
                   //查询正确答案
                   function chadaan()
                   {                          
                	   var uri = "../server/daanlianxistates.jsp?id=" + timuId[index-1];
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       req.onreadystatechange = callback;
                       //alert(callback);
                       req.send(null);
                   }             
                   
                   function kaoshi()
                   { 
                        closeObj();//关闭遮罩层
                        t = setInterval("shijian()",1000);
                        start = true;
                            //$("#td1").css("background","#FF7E00");//当前题样式
                            $("#btishi").html("<b>判断题</b><span>按“<font>对/错</font>”键答题</span><b>选择题</b><span>按“<font>A/B/C/D</font>”键答题</span><span>按“<font>上翻</font>”键查看上一题</span><span>按“<font>下翻</font>”键进入下一题</span>");
                        
                   }
                   //小键盘
                    ie4 = (document.all) ? true : false;
                    function keyDown(e){      
                        if(ie4)
                        {
                             keynum=event.keyCode;
                        }
                        else
                        {
                             keynum=e.which;
                        }
                        if(keynum == 96 || keynum == 45) 
                        {//开始考试
                         //更新时间
                            if(!start)
                            {
                                     if(jianpan ==  true)
                                    {
                                       ksdt();
                                    }
                                
                            }
                        }
                        if(!start)
                        {//没有点开始考试
                             if(keynum ==96 || keynum==45)
                            {
                           
                            } else{alert('练习还没开始，请点击开始练习!');}
                        }
                        else
                        {   
                        if(jianpan ==  true)
                          {
                            if(keynum == 144)
                            {//上一题
                                
                                if(index!=1)
                                {//当前不是第一题
                                    index--;
                                    jiazaitimu(index);
                                }
                            }
                            else if(keynum == 111 || keynum == 13)
                            {//下一题
                                if(index !=total)
                                {//当前不是最后一题
                                    index ++ ;
                                    jiazaitimu(index);
                                }else
                                {
                                     tijiao = true;
                                     $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                    .width($(window).width())
                                    .height($(window).height())
                                    .fadeIn(1000);
                                    var objWH=getObjWh('mydiv');
                                    var tbT=objWH.split("|")[0]+"px";
                                    var tbL=objWH.split("|")[1]+"px"
                                    var n = window.event.screenX - window.screenLeft-1000;
			    					var b = document.documentElement.scrollWidth-20-1130;
			    					//alert("n:" + n);
			    					//alert("b" + b);
			                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                                    //$("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                                    .html("<div class=\"jjts\"><b>提 示</b><p class=\"hand\">已经是最后一题，你要提交本次练习吗？<br/>点击“确认”，将显示练习成绩。<br/>点击“返回”，将关闭本窗口。</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao()\">确认</a><a href=\"javascript:closeObj()\">返回</a></div></div>");    
                                    return false;
                                }
                            }
                           else if(keynum == 99 || keynum == 34)
                            {//最后一题
                                index = total;
                                jiazaitimu(index);
                            }
                            else if(keynum == 97 || keynum == 35)
                            {//第一题
                                index = 1;
                                jiazaitimu(index);
                            }
                            else if(keynum ==98 || keynum == 40)
                            {//收藏
                                       if(-1!=-1)
                                {
                                shouchang('1');
                                }else
                                {
                                    alert('请登录后操作!');
                                    return false;
                                }
                            }
                            else if(keynum == 101 || keynum ==12)
                            {//对
                                if(panduan == 0)
                                {//判断题
                                    zuoda('A');
                                }
                            }
                            else if(keynum == 102 || keynum == 39)
                            {//错
                                if(panduan == 0)
                                {//判断题
                                    zuoda('B');
                                }
                            }
                            else if(keynum == 103 || keynum == 36)
                            {//A
                                if(panduan == 1)
                                {
                                    zuoda('A');
                                }
                            }
                            else if(keynum == 104 || keynum == 38)
                            {//B
                                if(panduan == 1)
                                {
                                    zuoda('B');
                                }
                            }
                            else if(keynum == 105 || keynum == 33)
                            {//C
                                if(panduan == 1)
                                {
                                    zuoda('C');
                                }
                            }
                            else if(keynum == 100 || keynum == 37)
                            {//D
                                if(panduan == 1)
                                {
                                    zuoda('D');
                                }
                            }
                            else if(keynum == 109)
                            {//提交
                                ftijiao();
                            }else if(keynum ==110 || keynum == 46)
                            {
                                chongxinkaishi();
                            }
                            else if(keynum == 106)
                            {//继续答题
                               closeObj();
                            }
                            else if(keynum == 107)
                            {//确认提交
                                if(tijiao)
                                {//已确认
                                    qrtijiao();
                                }
                                else
                                {
                                    ftijiao();
                                }
                            }
                            
                            }
                        }
                    }
                    document.onkeydown = keyDown;
                    //document.onkeypress  = keyDown;
                    //关闭，继续答题
                    function closeObj()
                    {     
                          tijiao  = false;               
                           jianpan = true;  
                          $("#mydiv").css("display","none"); 
                          $("#mark").css("display","none");
                    }
                    //结束练习
                    function fjieshu()
                    {
                        t = clearInterval(t);
                        tijiao  = false;                 
                        $("#mydiv").css("display","none"); 
                        $("#mark").css("display","none");
                        location="select_course.jsp"
                    }
                    //提交

                    function ftijiao()
                    {
                         tijiao = true;
                         $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                        .width($(window).width())
                        .height($(window).height())
                        .fadeIn(1000);
                        var objWH=getObjWh('mydiv');
                        var tbT=objWH.split("|")[0]+"px";
                        var tbL=objWH.split("|")[1]+"px";
                        var n = window.event.screenX - window.screenLeft-1000;
    					var b = document.documentElement.scrollWidth-20-1130;
    					//alert("n:" + n);
    					//alert("b" + b);
                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                        .html("<div class=\"jjts\"><b>提 示</b><p class=\"hand\"><br/>点击“确认”，将提交练习成绩，练习结束。<br/>点击“返回”，将关闭本窗口继续练习。</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao();\">确认</a><a href=\"javascript:closeObj()\" onclick=\"closeObj()\">返回</a></div></div>");
                        //alert("11111111");
                    }
                    //确认提交
                 function qrtijiao()
                    {  if(!tijiao)
                        {
                            ftijiao();
                        }
                        else{
	                        t = clearInterval(t);
	                        $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
	                        .width($(window).width())
	                        .height($(window).height())
	                        .fadeIn(1000);
	                        var objWH=getObjWh('mydiv');
	                        var tbT=objWH.split("|")[0]-200+"px";
	                        var tbL=objWH.split("|")[1]-270+"px"
	                         $("#mydiv").css({"top":tbT,"left":tbL,"z-index":"9999","display":"block"})
	                        .html("<div class=\"jjts\"><b>考试结束</b><div class=\"end\"><i></i><i><span class=\"ysjg\">已用时："+parseInt((45*60-miaozhong)/60)+"分"+(45*60-miaozhong)%60+"秒</span><span>共得分数：<font class=\"hong\">"+totalright+"分</font></span></i></div><div class=\"end2\">已答题："+(totalright+totalwrong)+"  正确答题："+totalright+"  错误答题："+totalwrong+"  未答题："+(<%=paperManager.getTotalRecords()%>-totalright-totalwrong)+"</div><div class=\"tjan mz2\"><a href=\"javascript:fjieshu()\">结 束</a><a href=\"javascript:closeObj()\">浏览试卷</a></div></div>"); 
	                        //记录考试成绩
	                        
	                        //记录考试成绩
	                       // data:"uid="+-1+"&fs="+totalright+"&d="+d,
	                        if(-1!=-1)
	                        {   
	                            var d = new Date();
	                            $.ajax({
	                                type:"get",
	                                url:"server/fenshu.ashx",
	                                data:"uid="+-1+"&fs="+totalright+"&d="+d,
	                                success:function(data)
	                                {
	                                }
	                            })
	                        }
                        }
                    }
                    //重新开始
                    function chongxinkaishi()
                    {
                         $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                        .width($(window).width())
                        .height($(window).height())
                        .fadeIn(1000);
                        var objWH=getObjWh('mydiv');
                        var tbT=objWH.split("|")[0]+"px";
                        var tbL=objWH.split("|")[1]+"px"
                        var n = window.event.screenX - window.screenLeft-1000;
    					var b = document.documentElement.scrollWidth-20-1130;
    					//alert("n:" + n);
    					//alert("b" + b);
                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                        //$("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                        .html("<div class=\"jjts\"><b>提示</b><p class=\"hand\">您还剩余时间：<span id=\"spsyshijian1\">45:00</span><br/>点击“确认提交”，将重新练习。<br/>点击“继续”，将关闭本窗口继续练习。</p><div class=\"tjan mz\"><a href=\"javascript:ftijiao();\">确认提交</a><a href=\"javascript:closeObj()\" onclick=\"closeObj()\">继续练习</a></div></div>");    
                    
               
                    }//重新开始
                    function chongxingkaishi1()
                    {       
                        totalright = 0;
                        totalwrong =0;
                        $("#spwdt").html((<%=paperManager.getTotalRecords()%>-totalright-totalwrong)+"题未答");//未答题目
                         miaozhong = 45*60;
                        index =1;
                        t = clearInterval(t);
                        jiazaitimu(1);
                        for(var i =0;i<total + 1;i++)
                        {
                            yhdaan[i] ="";//初始化
                            zqdaan[i]="";
                            cwdaan[i]="";
                             $("#td"+i).css("background","#fff");//
                        }    
                         $("#spyhdaan").html("");//还没作答t
                        t = setInterval("shijian()",1000);
                        closeObj();//关闭遮罩层
                    }
                    //返回 top,left
                    function getObjWh(obj){
                    var st=document.documentElement.scrollTop;//滚动条距顶部的距离
                    var sl=document.documentElement.scrollLeft;//滚动条距左边的距离
                    var ch=document.documentElement.clientHeight;//屏幕的高度
                    var cw=document.documentElement.clientWidth;//屏幕的宽度
                    var objH=253;//浮动对象的高度
                    var objW=535;//浮动对象的宽度
                    var objT=Number(st)+(Number(ch)-Number(objH))/2;
                    var objL=Number(sl)+(Number(cw)-Number(objW))/2;
                    return objT+"|"+objL;
                    }
                      //上一题
                    function shangyiti()
                    {
                        if(!start)
                        {//没有点开始考试
                            alert('练习还没开始，请点击开始练习!');
                            return false;
                        }
                        if(index!=1)
                        {//当前不是第一题
                            index--;
                            jiazaitimu(index);
                        }
                    }
                    //下一题
                    function xiayiti()
                    {if(!start)
                        {//没有点开始考试
                            alert('练习还没开始，请点击开始练习!');
                              return false;
                        }
                       if(index !=total)
                        {//当前不是最后一题
                            index ++ ;
                            jiazaitimu(index);
                        }else
                                {
                                     tijiao = true;
                                     $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                    .width($(window).width())
                                    .height($(window).height())
                                    .fadeIn(1000);
                                    var objWH=getObjWh('mydiv');
                                    var tbT=objWH.split("|")[0]+"px";
                                    var tbL=objWH.split("|")[1]+"px"
                                    var n = window.event.screenX - window.screenLeft-1000;
			    					var b = document.documentElement.scrollWidth-20-1130;
			    					//alert("n:" + n);
			    					//alert("b" + b);
			                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                                    //$("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                                    .html("<div class=\"jjts\"><b>提 示</b><p class=\"hand\">已经是最后一题，你要提交本次练习吗？<br/>点击“确认”，将显示练习成绩。<br/>点击“返回”，将关闭本窗口。</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao()\">确认</a><a href=\"javascript:closeObj()\">返回</a></div></div>");    
                                    return false;
                                }
                    }
                    //最后一题
                    function zuihoutiyi()
                    {   if(!start)
                        {//没有点开始考试
                            alert('练习还没开始，请点击开始练习!');
                              return false;
                        }
                       index = total;
                       jiazaitimu(index);
                   }
                   //第一题 
                   function diyiti()
                   {   if(!start)
                        {//没有点开始考试
                            alert('练习还没开始，请点击开始练习!');
                              return false;
                        }
                      index = 1;
                      jiazaitimu(index);
                   }
                   //判断题
                   function pdti(xx)
                   {    if(!start)
                        {//没有点开始考试
                            alert('练习还没开始，请点击开始练习!');
                              return false;
                        }
                        if(panduan == 0)
                        {//判断题
                            zuoda(xx);
                        }
                   }
                   //选择题
                   function xxti(xx)
                   {    
                        //alert("xxti()"+xx+" panduan"+panduan);
                        if(panduan == 0 && (xx=="A" || xx=="B") )
                        {//判断题
                            zuoda(xx);
                        }
                        else if(panduan == 1 && (xx=="A" || xx=="B" || xx=="C" || xx=="D") )
                        {//选择题
                            zuoda(xx);
                        }
                        else if(panduan == 2  )
                        {//填空题
                            zuoda(xx);
                        }
                   }
                   //开始答题
                   function ksdt()
                   { 
                        if(!start)
                        {
                                $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                .width($(window).width())
                                .height($(window).height())
                                .fadeIn(1000);
                                var objWH=getObjWh('mydiv');
                                var tbT=objWH.split("|")[0]+"px";
                                var tbL=objWH.split("|")[1]+"px"
                                var n = window.event.screenX - window.screenLeft-1000;
		    					var b = document.documentElement.scrollWidth-20-1130;
		    					//alert("n:" + n);
		    					//alert("b" + b);
		                        $("#mydiv").css({"top":n,"left":b,"z-index":"9999","display":"block"})
                                //$("#mydiv").css({"top":200,"230":tbL,"z-index":"9999","display":"block"})
                                .html("<div class=\"jjts\"><b>提 示</b><p class=\"hand\">准备开始练习<br/>点击“确认”，将开始练习。<br/>点击“返回”，将关闭本窗口。</p><div class=\"tjan mz\"><a href=\"javascript:kaoshi()\">确认</a><a href=\"javascript:closeObj()\">返回</a></div></div>");  
							
                           
                        }
                   }
        </script>

<div id="mydiv">
    </div>
	  </div>
   	</div>
  </div>
  <!-- InstanceEndEditable -->
	<div style="width:728px; margin:auto;"><script language=javascript >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script></div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>

</form>
</body>
<!-- InstanceEnd --></html>
