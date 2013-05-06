
/*  Base JavaScript version 1.0.3
 *  (c) 2007-2009 xcShang
/*--------------------------------------------------------------------------*/


function $_id(id){return document.getElementById(id)};//$只定义为通过ID返回元素的功能


//-----------------------dom 自定义方法类---------------------------

function dom(obj){//实现自定义类的一个实例，obj为元素的ID或元素本身
	return new customDom(obj);
}

function customDom(obj){//实现元素自定义方法的类，obj为元素的ID或元素本身	
	
	if(typeof(obj) == "string"){
		this.obj = document.getElementById(obj);
	} 
	else if(typeof(obj) == "object"){this.obj = obj;}
	else this.obj = null;
}

//自定义类方法的实现
customDom.prototype={

	//得到元素
	getElem:function(){return this.obj;},
	
	//得到元素真实坐标,返回一个数组[x,y]
    getPosition:function(){
        var position = [0,0]; 
        var obj = this.obj;
        while(obj.offsetParent){         
           position[0] += obj.offsetLeft; 
           position[1] += obj.offsetTop;
           obj = obj.offsetParent; 
        } 
        position[0] + document.body.offsetLeft;
        position[1] + document.body.offsetTop;
        return position;		
    },
	
	//得到元素属性
	getStyle:function(name){
        var elem = this.obj;
		//如果该属性存在于style[]中
        if (elem.style[name]){return elem.style[name];} 
		//否则，尝试IE的方式      
        else if (elem.currentStyle){return elem.currentStyle[name];}
        //或者W3C的方法
        else if (document.defaultView && document.defaultView.getComputedStyle){
        //格式化mame名称
            name = name.replace(/([A-Z])/g,"-$1");
		    name = name.toLowerCase();
            //获取style对象并取得属性的值(如果存在的话)
            var s = document.defaultView.getComputedStyle(elem,"");
            return s && s.getPropertyValue(name);
            //否则，就是在使用其它的浏览器
        } else{return null;}   
      },
	  
	//得到子节点数组(解决FF等子节点包括空白节点和文本节点的问题)
    getChildren:function(){	
	var AchildNodes = [];
        for(var i = 0;i < this.obj.childNodes.length;i++){
			if(this.obj.childNodes[i].nodeType == 1){
                AchildNodes.push(this.obj.childNodes[i]);
            }
        }
        return AchildNodes;
	},
	
	//得到下一个兄弟节点
	getNextSibling:function(){
	  	var endBrother = this.obj.nextSibling;
  		while(endBrother.nodeType != 1 ){
   			endBrother = endBrother.nextSibling;
  		}
  		return endBrother;		  
	  },
	  
	//得到上一个兄弟节点
	getPreSibling:function(){
	  	endBrother = this.obj.previousSibling;
  		while(endBrother.nodeType != 1){
   			endBrother = endBrother.previousSibling;
  		}
  		return endBrother;		  
	  },
	  
	 //通过getElementsByTagName方式得到的元素并转换为数组
	 getByTagName:function(name){
		var tagNames = this.obj.getElementsByTagName(name);
		var arr = [];
	    for(var i = 0;i < tagNames.length;i++){
            arr.push(tagNames[i]);
		}
			return arr;		 
	 },
	 
	 //在节点后插入新的兄弟节点
	  insertAfter:function(newNode){
            if(this.obj.nextSibling){this.obj.parentNode.insertBefore(newNode, this.obj.nextSibling);}
            else{this.obj.parentNode.appendChild(newNode);}	 
	  },
	  
	  //非IE的innerText用textContent;
	  text:function(str){
		  this.obj.innerText ? this.obj.innerText = str:this.obj.textContent = str;
	  },
	  	  //把用getElementsByTagName等方式得到的元素转换为数组
	  toArray:function(){
		    var arr=[];
	        for(var i=0;i<this.obj.length;i++){
                arr.push(this.obj[i]);
			}
			return arr;		 
	  }
}


//------------------------------Array 扩展类------------------------------

//copy数组
Array.prototype.copy = function(){return this.slice();}

//返回数组中指定字符串的索引
Array.prototype.indexof = function(str){	
	for(var q = 0;q < this.length;q++){
		if(this[q] == str){return q;}
	}
	return -1;
}
/*
var a=[1,4,5,7,84,45,35]
alert(a.indexof(5)) //opt 5
*/


//数组随机排序	
Array.prototype.aSort = function(method){
    function Sort(a,b){
	    if(method == 0 || method == 1){
		    if(a > b){if(method == 0){return 1}else{ return -1}}
            if(a < b){if(method == 0){return -1}else{ return 1}}
            else{return 0}		
	    }
        else if(method == 2){return Math.random() > .5 ? -1 : 1;}//用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1       	
    }
    this.sort(Sort);
}

/*
var a=[1,4,5,7,84,45,35]
a.aSort(2)
alert(a.toString())
*/

//在数组任意索引处删除一项	
Array.prototype.delIndex = function(index){this.splice(index,1)}

//在数组任意索引处删除多项	
Array.prototype.del = function(){
       var opts = this.sort.call(arguments,Function('a,b','return a > b?-1:1;'));   
       for (var i = 0;i < opts.length;i++ ){this.splice(opts[i],1);}
       return this;
}
/*
var a=['甲','乙','丙','丁'];
alert(a.del(3,1));
*/

//在数组任意索引后增加一项或多项	
Array.prototype.addIndex = function(index,arr){this.splice(index + 1,0,arr)}

//返回数组中最大项
Array.prototype.max = function(){
return Math.max.apply({},this);
}

//返回数组中最小项
Array.prototype.min = function(){
return Math.min.apply({},this);
} 

//------------------------------String 扩展类------------------------------

//得到有汉字字符串的长度
String.prototype.chLength = function(){
	 var strLen = 0;
     for(i = 0;i < this.length;i++){
         if(this.charCodeAt(i) > 255){strLen += 2;}
         else{strLen++;}
     }
     return strLen;
}

//去除敏感字符
String.prototype.trimBadWords = function(str){		
	var reg = new RegExp(str,"gi");
	return this.replace(reg,function(str_bad){return str_bad.replace(/./g,"*")});
}


//去除字符串首尾空格
String.prototype.trimSpaces = function(){
	var reg = /^\s*(.*?)\s*$/gim;
	return this.replace(reg,"$1");
}

//转化<>标签为实体字符
String.prototype.trimTab = function(){
	var reg = /<|>/g;
    return this.replace(reg,function(s){if(s == "<"){return "&lt;";}else{return "&gt;";}})	
}

//去除任意HTML标签
String.prototype.trimHtml = function(tag){//不写标签名代表所有标签
	tag ? reg = new RegExp("<\/?"+tag+"(?:(.|\s)*?)>","gi"):reg = /<(?:.|\s)*?>/gi;
    return this.replace(reg,"");
}

//-----------------------event---------------------------
var ev={
          //添加事件监听
          addEvent:function(obj,evt,fun){
              if(obj.addEventListener){//for dom
                    obj.addEventListener(evt,fun,false)
              }
              else if(obj.attachEvent){//for ie
			         obj.attachEvent("on"+evt,fun)
                    //obj.attachEvent("on"+evt,function(){fun.call(obj)});//解决IE attachEvent this指向window的问题
			  }
              else{obj["on"+evt] = fun}//for other
          },
		  
          //删除事件监听
          removeEvent:function(obj,evt,fun){
              if(obj.removeEventListener){//for dom
                    obj.removeEventListener(evt,fun,false)
              }
              else if(obj.detachEvent){//for ie
                    obj.detachEvent("on"+evt,fun)
              }
              else{obj["on"+evt] = null;
			  } //for other
           },
	
          //捕获事件		
           getEvent:function(){
                    if(window.event){return window.event}
                    else{return ev.getEvent.caller.arguments[0];}	
           },
		   
		   formatEvent:function(evt){
                    evt.eTarget = evt.target ? evt.target:evt.srcElement;//事件目标对象
                    evt.eX = evt.pagex ? evt.pagex:evt.clientX + document.body.scrollLeft;//页面鼠标X坐标
                    evt.eY = evt.pagey ? evt.pagex:evt.clientY + document.body.scrollTop;//页面鼠标Y坐标
                    evt.eStopDefault = function(){this.preventDefault ? this.preventDefault():this.returnValue = false;}//取消默认动作
                    evt.eStopBubble = function(){this.stopPropagation ? this.stopPropagation():this.cancelBubble = true;}//取消冒泡
           }
}


//----------------------------------cookie-----------------------------------
var cookie = {
    //设置cookie
    setCookie:function(sName,sValue,oExpires,sPath,sDomain,bSecure)	{
	    var sCookie=sName + "=" + encodeURIComponent(sValue);
	    if(oExpires){sCookie += "; expires=" + oExpires.toUTCString();}
	    if(sPath){sCookie += "; path="+sPath;}
	    if(sDomain){sCookie += "; domain="+sDomain;}	
	    if(bSecure){sCookie += "; scure";}
	    document.cookie=sCookie;
    },
	
    //读取cookie
    getCookie:function(sName){
	    var sRE="(?:; )?" + sName + "=([^;]*);?";
	    var oRE=new RegExp(sRE);
	    if(oRE.test(document.cookie)){
		    return decodeURIComponent(RegExp["$1"]);
		}
		else{return null;}	
    },
	
    //删除cookie
    delCookie:function(sName,sPath,sDomain){
	    setCookie(sName,"",new Date(0),sPath,sDomain);	
    }
}


//--------------------ajax类---------------------
var XMLHttp = {
    _objPool: [],
    _getInstance: function (){
        for (var i = 0; i < this._objPool.length; i ++){
            if (this._objPool[i].readyState == 0 || this._objPool[i].readyState == 4){
                return this._objPool[i];
            }
        }
        // IE5中不支持push方法
        this._objPool[this._objPool.length] = this._createObj();
        return this._objPool[this._objPool.length - 1];
     },
     _createObj: function (){
        if (window.XMLHttpRequest){ var objXMLHttp = new XMLHttpRequest();}
        else{
			 var MSXML = ['MSXML2.XMLHTTP.5.0', 'MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP', 'Microsoft.XMLHTTP'];
             for(var n = 0; n < MSXML.length; n ++){
                 try {
                     var objXMLHttp = new ActiveXObject(MSXML[n]);
                     break;
                 }
                 catch(e){}
             }
         } 
        // mozilla某些版本没有readyState属性
        if (objXMLHttp.readyState == null){
            objXMLHttp.readyState = 0;
            objXMLHttp.addEventListener("load", function (){
               objXMLHttp.readyState = 4;
               if (typeof objXMLHttp.onreadystatechange == "function"){
                   objXMLHttp.onreadystatechange();}
               }, false);
        }
            return objXMLHttp;
    },
    // 发送请求(方法[post,get], 地址, 数据, 回调函数, 回调函数参数-多个用数组形式)
    sendReq: function (method, url, data, callback,arg){
        var objXMLHttp = this._getInstance();
        with(objXMLHttp){
            try{
                // 加随机数防止缓存
                if (url.indexOf("?") > 0){
                    url += "&randnum=" + Math.random();
                }
                else{url += "?randnum=" + Math.random();}				
                open(method, url, true);
                // 设定请求编码方式
                setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
                send(data);
                onreadystatechange = function (){
                    if (objXMLHttp.readyState == 4 && (objXMLHttp.status == 200 || objXMLHttp.status == 304)){
                         callback(objXMLHttp,arg);
                    }
               }
           }
           catch(e){alert(e);}
       }
   }
}; 


//js浮点数精确计算函数(加，减，乘，除)//浮点数加法运算  
 function FloatAdd(arg1,arg2){  
   var r1,r2,m;  
   try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}  
   try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}  
   m=Math.pow(10,Math.max(r1,r2));
   return (arg1*m+arg2*m)/m;
  }  ;
  
 //浮点数减法运算  
 function FloatSub(arg1,arg2){  
	 var r1,r2,m,n;  
	 try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}  
	 try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}  
	 m=Math.pow(10,Math.max(r1,r2));  
	 //动态控制精度长度  
	 n=(r1>=r2)?r1:r2;  
	 return ((arg1*m-arg2*m)/m).toFixed(n);  
 } ; 
   
 //浮点数乘法运算  
 function FloatMul(arg1,arg2) {   
	  var m=0,s1=arg1.toString(),s2=arg2.toString();   
	  try{m+=s1.split(".")[1].length}catch(e){}   
	  try{m+=s2.split(".")[1].length}catch(e){}   
	  return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)   
  }  ; 
  
  
//浮点数除法运算  
function FloatDiv(arg1,arg2){   
	var t1=0,t2=0,r1,r2;   
	try{t1=arg1.toString().split(".")[1].length}catch(e){}   
	try{t2=arg2.toString().split(".")[1].length}catch(e){}   
	with(Math){   
		r1=Number(arg1.toString().replace(".","")) ;  
		r2=Number(arg2.toString().replace(".",""));   
		return (r1/r2)*pow(10,t2-t1);   
	}   
} ;  