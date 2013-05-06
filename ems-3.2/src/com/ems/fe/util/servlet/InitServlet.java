package com.ems.fe.util.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.dao.AdminDaoFactory;
import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.dao.ExamDaoFactory;
import com.ems.fe.basedata.dao.StudentDao;
import com.ems.fe.basedata.dao.StudentDaoFactory;
import com.ems.fe.basedata.service.AdminService;
import com.ems.fe.basedata.service.ExamService;
import com.ems.fe.basedata.service.StudentService;
import com.ems.fe.basedata.service.impl.AdminServiceImpl;
import com.ems.fe.basedata.service.impl.ExamServiceImpl;
import com.ems.fe.basedata.service.impl.StudentServiceImpl;
import com.ems.fe.util.TransactionHandler;

/**
 * ��ʼ������
 * @author ����չ
 *
 */
public class InitServlet extends HttpServlet {

	public void init() throws ServletException {
		/**
		 * �����͹���Ա�����ʼ��
		 */
		//AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao();
		AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao4MongoDB();
		TransactionHandler transactionHandler = new TransactionHandler();
		AdminService adminService = (AdminService)transactionHandler.createProxyObject(new AdminServiceImpl(adminDao));
		this.getServletContext().setAttribute("adminService", adminService);
		
		/**
		 * �Ծ�����ʼ��
		 */
		//ExamDao examDao = ExamDaoFactory.getInstance().createExamDao();
		ExamDao examDao = ExamDaoFactory.getInstance().createExamDao4MongoDB();
		TransactionHandler transactionHandler1 = new TransactionHandler();
		ExamService examService = (ExamService)transactionHandler1.createProxyObject(new ExamServiceImpl(examDao));
		this.getServletContext().setAttribute("examService", examService);
		
		/**
		 * ѧ��������ʼ��
		 */
		//StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao();
		StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao4MongoDB();
		TransactionHandler transactionHandler2 = new TransactionHandler();
		StudentService studentService = (StudentService)transactionHandler2.createProxyObject(new StudentServiceImpl(studentDao));
		this.getServletContext().setAttribute("studentService", studentService);
	}

}
