package com.fe.ems.util;

import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.ems.fe.basedata.service.StudentService;
import com.ems.fe.util.InitService;

public class Login extends HttpServlet{
	
		public Logger log = Logger.getLogger(Login.class);

		public String formatIndex = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		public String s_password;
		//String type;
		public String id;
		public String s_name;
		public boolean examstates = true;//答题状态，为true时允许进入答题页面，否则不准进入。
		public boolean b = true; //在updatePhoto.jsp页面用来控制框架reload。为true时reload，为false时禁止reload。
		public boolean success = false; //用户登陆状态变量
		public boolean adminSuccess = false;//管理员登陆状态变量
		public String backNews = " ";//反馈用户登陆信息
		public StringBuffer sb = new StringBuffer();
		//String adminBackNews = "";//反馈管理员登录信息
		
		public boolean isB() {
			return b;
		}

		public void setB(boolean b) {
			this.b = b;
		}

		public String getS_name() {
			return s_name;
		}

		public void setS_name(String s_name) {
			this.s_name = (s_name);
		}
		public boolean isExamstates() {
			return examstates;
		}
		public void setExamstates(boolean examstates) {
			this.examstates = examstates;
		}
		
		public String getBackNews() {
			return backNews;
		}
		public void setBackNews(String backNews) {
			this.backNews = backNews;
		}
		public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public Login(){
			
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = (id);
		}
		public String getS_password() {
			return s_password;
		}

		public void setS_password(String s_password) {
			this.s_password = s_password;
		}

		public boolean isAdminSuccess() {
			return adminSuccess;
		}
		public void setAdminSuccess(boolean adminSuccess) {
			this.adminSuccess = adminSuccess;
		}
		public void login(String sid,String spassword, StudentService studentService){
			studentService.login(sid, spassword, this);
			
		}
}
