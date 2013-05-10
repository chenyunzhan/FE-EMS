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
		public boolean examstates = true;//����״̬��Ϊtrueʱ����������ҳ�棬����׼���롣
		public boolean b = true; //��updatePhoto.jspҳ���������ƿ��reload��Ϊtrueʱreload��Ϊfalseʱ��ֹreload��
		public boolean success = false; //�û���½״̬����
		public boolean adminSuccess = false;//����Ա��½״̬����
		public String backNews = " ";//�����û���½��Ϣ
		public StringBuffer sb = new StringBuffer();
		//String adminBackNews = "";//��������Ա��¼��Ϣ
		
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
