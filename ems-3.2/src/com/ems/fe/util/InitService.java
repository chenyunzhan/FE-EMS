package com.ems.fe.util;

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

public class InitService {

	StudentService studentService = null;
	
	public InitService() {
		/**
		 * 分数和管理员服务初始化
		 */
		AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao();
		//AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao4MongoDB();
		TransactionHandler transactionHandler = new TransactionHandler();
		AdminService adminService = (AdminService)transactionHandler.createProxyObject(new AdminServiceImpl(adminDao));
		
		/**
		 * 试卷服务初始化
		 */
		ExamDao examDao = ExamDaoFactory.getInstance().createExamDao();
		//ExamDao examDao = ExamDaoFactory.getInstance().createExamDao4MongoDB();
		TransactionHandler transactionHandler1 = new TransactionHandler();
		ExamService examService = (ExamService)transactionHandler1.createProxyObject(new ExamServiceImpl(examDao));
		
		/**
		 * 学生类服务初始化
		 */
		StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao();
		//StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao4MongoDB();
		TransactionHandler transactionHandler2 = new TransactionHandler();
		studentService = (StudentService)transactionHandler2.createProxyObject(new StudentServiceImpl(studentDao));
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	

}
