<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>

<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<%!
	//Clock clock = new Clock();
	
	int questioncount = 0; //�������Ʊ���𰸵�Ƶ��
	 //���������������ʱ�����û��Ĵ𰸡�
%>

<%

response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);
String tiMuid = request.getParameter("id");
int timuId = Integer.parseInt(tiMuid);
String useranswer = request.getParameter("answer");
//�������
byte bb[] = useranswer.getBytes("ISO-8859-1");
useranswer = new String(bb);

System.out.println("�û��𰸣�" + useranswer);

int seconds = Integer.parseInt(request.getParameter("miaozhong"));

/*
@��Ҫ������д����
*/


/*
if(timuId == 1){
	clock.start();
}
*/
//System.out.println("��ĿID��" + timuId);
//System.out.println("�û��𰸣�" + str[timuId-1]);
//System.out.println("ʣ��ʱ�䣺" + seconds);
//System.out.println("�û��𰸣�" + useranswer);
PaperModel paper = paperManager.findPaperById(examtime.getP_id(),tiMuid);
String answer = paper.getAnswer();

int flag = 0; //�û�������ȷʱ��flagΪ1������ʱΪ0.
//����𰸳���Ϊ1 ����Ϊѡ��������ж���
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
//ÿ����3���Ᵽ��һ��
if(questioncount >= 2){
	examtime.setTimeLeft(seconds,Login.getId(),examtime.getP_id());
	examtime.setAnswer(examtime.getStr(),Login.getId(),examtime.getP_id());
	questioncount = 0;
}
else{
	questioncount ++;
}

//System.out.println("��ĿdeID: " +timuId + "; ��Ŀ��: " + answer + "; danan.jsp������");
response.getWriter().write("<msg><msg>" + flag + "</msg></msg>");
%>