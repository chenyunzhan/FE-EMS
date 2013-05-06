<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>

<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<%!
	//Clock clock = new Clock();
	
	int questioncount = 0; //用来控制保存答案的频率
	 //答题过程中用来临时保存用户的答案。
%>

<%

response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);
String tiMuid = request.getParameter("id");
int timuId = Integer.parseInt(tiMuid);
String useranswer = request.getParameter("answer");
//解决乱码
byte bb[] = useranswer.getBytes("ISO-8859-1");
useranswer = new String(bb);

System.out.println("用户答案：" + useranswer);

int seconds = Integer.parseInt(request.getParameter("miaozhong"));

/*
@需要继续改写！！
*/


/*
if(timuId == 1){
	clock.start();
}
*/
//System.out.println("题目ID：" + timuId);
//System.out.println("用户答案：" + str[timuId-1]);
//System.out.println("剩余时间：" + seconds);
//System.out.println("用户答案：" + useranswer);
PaperModel paper = paperManager.findPaperById(examtime.getP_id(),tiMuid);
String answer = paper.getAnswer();

int flag = 0; //用户答题正确时，flag为1，错误时为0.
//如果答案长度为1 ，则为选择题或是判断题
if(answer.trim().length() == 1){
	if(useranswer.equals(answer)){
		flag = 1;
	}
	else{
		flag = 0;
	}
}
else{
	String[] an = answer.trim().replaceAll(" ","").toLowerCase().split("#");
	String[] uan = useranswer.trim().replaceAll(" ","").toLowerCase().split("#");
	for(int i=0; i<an.length; i++){
		for(int j=0; j<uan.length; j++){
			if(an[i].contentEquals(uan[j])){
				flag += 1;
			}
		}
	}
	System.out.println("daan.jsp" + flag);
}


String str = tiMuid + "@@" + useranswer + "@@" + flag;
examtime.setElement(timuId,str);
//每答完3个题保存一次
if(questioncount >= 2){
	examtime.setTimeLeft(seconds,Login.getId(),examtime.getP_id());
	examtime.setAnswer(examtime.getStr(),Login.getId(),examtime.getP_id());
	questioncount = 0;
}
else{
	questioncount ++;
}

//System.out.println("题目deID: " +timuId + "; 题目答案: " + answer + "; danan.jsp被调用");
response.getWriter().write("<msg><msg>" + flag + "</msg></msg>");
%>