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
 * 初始化服务
 * @author 陈云展
 *
 */
public class InitServlet extends HttpServlet {

	public void init() throws ServletException {
		/**
		 * 分数和管理员服务初始化
		 */
		//AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao();
		AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao4MongoDB();
		TransactionHandler transactionHandler = new TransactionHandler();
		AdminService adminService = (AdminService)transactionHandler.createProxyObject(new AdminServiceImpl(adminDao));
		this.getServletContext().setAttribute("adminService", adminService);
		
		/**
		 * 试卷服务初始化
		 */
		//ExamDao examDao = ExamDaoFactory.getInstance().createExamDao();
		ExamDao examDao = ExamDaoFactory.getInstance().createExamDao4MongoDB();
		TransactionHandler transactionHandler1 = new TransactionHandler();
		ExamService examService = (ExamService)transactionHandler1.createProxyObject(new ExamServiceImpl(examDao));
		this.getServletContext().setAttribute("examService", examService);
		
		/**
		 * 学生类服务初始化
		 */
		//StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao();
		StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao4MongoDB();
		TransactionHandler transactionHandler2 = new TransactionHandler();
		StudentService studentService = (StudentService)transactionHandler2.createProxyObject(new StudentServiceImpl(studentDao));
		this.getServletContext().setAttribute("studentService", studentService);
	}

}
