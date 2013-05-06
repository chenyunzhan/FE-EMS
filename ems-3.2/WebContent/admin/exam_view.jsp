<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<htm>
<body>
	<%
	    out.print("<h3>");
		for(int i=1; i<=100; i++)
		{
			out.print("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href='exam.jsp?p_id=1206b"+ i + "'>1206b" + i + "</a>");
			if(i%7 == 0){
				out.print("<br/><br/>");
			}
		}
		out.print("</h3>");
	%>
</body>
</html>