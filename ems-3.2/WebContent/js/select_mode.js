//模拟select类   by xcshang  2010-1-20

function Mselect(selects){//selects:下拉列表

	var __Mselect = this;
	var index = 1000; //当前的列表的层级
	var current_select = null;//当前的列表
	
	for(var i = 0; i < arguments.length; i++ ){
		if (arguments[i] == null) {continue;}
		var selects_list = arguments[i].getElementsByTagName("ul")[0]; //列表;
		var select_item = selects_list.getElementsByTagName("a");	//列表项目
		
		//如果有选项
		if(select_item.length > 0 ){
			
			var text = arguments[i].getElementsByTagName("span")[0];
			var input = arguments[i].getElementsByTagName("input")[0];
			
			//默认第一选项选中
			text.innerHTML = select_item[0].innerHTML;
			input.value = select_item[0].innerHTML;
			
			//点击下拉列表
			
			arguments[i].onclick = function(){
				
				var evn = ev.getEvent();
				ev.formatEvent(evn);
				evn.eStopBubble();		
				
				var s = this.getElementsByTagName("ul")[0];
				this.style.zIndex = index ++;
				if(current_select){current_select.style.display = "none";}
				s.style.display = "block";
				current_select = s;
				
				var items = s.getElementsByTagName("a");
				
				for(var i = 0; i < items.length; i++ ){
					
					//列表项事事件
					items[i].sel = this.id;
					items[i].onclick = function(){
						var evn = ev.getEvent();
						ev.formatEvent(evn);
						evn.eStopBubble();					
						
						s.parentNode.getElementsByTagName("span")[0].innerHTML = this.innerHTML;
						s.parentNode.getElementsByTagName("input")[0].value = this.innerHTML;
						
						current_select.style.display = "none";	
						current_select = null;		
						if(this.sel == "s_select"){
							if(this.innerHTML != "请选择..."){
								$_id("qas").style.color = "#000";					
							}
							else{$_id("qas").style.color = "#888"}						
							checkURS.setQA();}
							if(this.sel == "s_select1"){checkURS.recommendEmail(checkURS.ajaxData);}
						}					
				}
								
			}
			
		}		
		
	}
	
	ev.addEvent(document,"click",function(){
	  if(current_select){
		  current_select.style.display = "none";
		  current_select = null;
	  }
	});
}






