// JavaScript Document
/*
/^[\u4E00-\u9FA5\w\d]+$/u
解释： 
\u4E00-\u9FA5  表示中文
\w  表示字母及下划线
\d  表示数字
注意：要让这个正则生效，你的网页必须是UTF-8编码，否则中文部分无效

匹配邮箱
val.match(/\w+@\w+\.\w/)

*/

//<!-- 获得<input>后的下一个span标签，为cobj的相邻最近span标签,通过span给状态-->
function gspan(cobj){
	while(true){
		//cobj.nextSibling  获得它的下一个元素
		if(cobj.nextSibling.nodeName != "SPAN"){
			cobj = cobj.nextSibling;
		}
		else{
			return cobj.nextSibling;	
		}
	}
}

/*
	通用检查方法
	第一个参数obj,是用来检查的对象
	第二个参数,是用来检查的提示信息
	第三个参数,是一个回调函数，检查输入信息是否符合条件
	
*/
function check(obj,info,fun){
	var sp = gspan(obj);
	
	obj.onfocus = function(){
		sp.className = "states2";
		sp.innerHTML = info;
	}
	
	obj.onblur = function(){
		if(fun(this.value)){
			sp.className = "states4";
			sp.innerHTML = "<img src='../images/yes.png' />正确";
		}
		else{
			sp.className = "states3";	
			sp.innerHTML = "<img src='../images/no.png' />" + info;
		}
	}
}

 //提交时 s为true提交成功 为false提交失败
var s = false;

//<!-- 该方法用来执行注册信息的检查-->
onload = function(){
	var id = document.getElementsByName("id")[0];
	var s_name = document.getElementsByName("s_name")[0];
	var s_password = document.getElementsByName("s_password")[0];
	var s_password1 = document.getElementsByName("s_password1")[0];
	
	
	check(id,"学号只能由8位数字组成，如09010101",function(val){
										  if(val.match(/[0-9]{8}/) && val.length == 8){
											  return true;
										  }
										  else{
											  s = false;
											  return false;  
										  }
										  });
	
	check(s_name,"请输入真实中文姓名，且不能为空",function(val){
										  if(val.match(/^\S+$/) && val.length>0 ){
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
	
	check(s_password,"密码应该在6--20位之间,不能含有空格",function(val){
										  if(val.match(/^\S+$/) && val.length >= 6 && val.length <= 20){
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
	
	check(s_password1,"确认密码要和上面一致，规则也要相同",function(val){
										  if(val.match(/^\S+$/) && val.length >= 6 && val.length <= 20 && val == s_password.value){
											  s = true;
											  return true;
										  }
										  else{
											  s = false;
												return false;  
										  }
										  });	
					
	//alert(gspan(id).nodeName);
	//alert(id.nextSibling.nextSibling.nodeName);
	
}
//页面提交时调用该函数，判断返回值是true和false来选择是否提交
function reg(){
	
	return s;	
}