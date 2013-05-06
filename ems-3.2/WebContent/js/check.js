// JavaScript Document
/*
/^[\u4E00-\u9FA5\w\d]+$/u
���ͣ� 
\u4E00-\u9FA5  ��ʾ����
\w  ��ʾ��ĸ���»���
\d  ��ʾ����
ע�⣺Ҫ�����������Ч�������ҳ������UTF-8���룬�������Ĳ�����Ч

ƥ������
val.match(/\w+@\w+\.\w/)

*/

//<!-- ���<input>�����һ��span��ǩ��Ϊcobj���������span��ǩ,ͨ��span��״̬-->
function gspan(cobj){
	while(true){
		//cobj.nextSibling  ���������һ��Ԫ��
		if(cobj.nextSibling.nodeName != "SPAN"){
			cobj = cobj.nextSibling;
		}
		else{
			return cobj.nextSibling;	
		}
	}
}

/*
	ͨ�ü�鷽��
	��һ������obj,���������Ķ���
	�ڶ�������,������������ʾ��Ϣ
	����������,��һ���ص����������������Ϣ�Ƿ��������
	
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

//<!-- �÷�������ִ��ע����Ϣ�ļ��-->
onload = function(){
	var id = document.getElementsByName("id")[0];
	var s_name = document.getElementsByName("s_name")[0];
	var s_password = document.getElementsByName("s_password")[0];
	var s_password1 = document.getElementsByName("s_password1")[0];
	
	
	check(id,"ѧ��ֻ����8λ������ɣ���09010101",function(val){
										  if(val.match(/[0-9]{8}/) && val.length == 8){
											  return true;
										  }
										  else{
											  s = false;
											  return false;  
										  }
										  });
	
	check(s_name,"��������ʵ�����������Ҳ���Ϊ��",function(val){
										  if(val.match(/^\S+$/) && val.length>0 ){
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
					
	//alert(gspan(id).nodeName);
	//alert(id.nextSibling.nextSibling.nodeName);
	
}
//ҳ���ύʱ���øú������жϷ���ֵ��true��false��ѡ���Ƿ��ύ
function reg(){
	
	return s;	
}