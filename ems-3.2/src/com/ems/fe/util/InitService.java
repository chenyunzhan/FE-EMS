package com.ems.fe.util;

import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.dao.AdminDaoFactory;
import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.dao.ExamDaoFactory;
import com.ems.fe.basedata.dao.MessDao;
import com.ems.fe.basedata.dao.MessDaoFactory;
import com.ems.fe.basedata.dao.ScoreDao;
import com.ems.fe.basedata.dao.ScoreDaoFactory;
import com.ems.fe.basedata.dao.StudentDao;
import com.ems.fe.basedata.dao.StudentDaoFactory;
import com.ems.fe.basedata.service.AdminService;
import com.ems.fe.basedata.service.ExamService;
import com.ems.fe.basedata.service.MessService;
import com.ems.fe.basedata.service.ScoreService;
import com.ems.fe.basedata.service.StudentService;
import com.ems.fe.basedata.service.impl.AdminServiceImpl;
import com.ems.fe.basedata.service.impl.ExamServiceImpl;
import com.ems.fe.basedata.service.impl.MessServiceImpl;
import com.ems.fe.basedata.service.impl.ScoreServiceImpl;
import com.ems.fe.basedata.service.impl.StudentServiceImpl;

public class InitService {

	private StudentService studentService = null;
	private AdminService adminService = null;
	private ExamService examService = null;
	private MessService messService = null;
	private ScoreService scoreService = null;
	
	
	public InitService() {
		/**
		 * 分数和管理员服务初始化
		 */
		//AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao();
		AdminDao adminDao = AdminDaoFactory.getInstance().createAdminDao4MongoDB();
		TransactionHandler transactionHandler = new TransactionHandler();
		adminService = (AdminService)transactionHandler.createProxyObject(new AdminServiceImpl(adminDao));
		
		/**
		 * 试卷服务初始化
		 */
		//ExamDao examDao = ExamDaoFactory.getInstance().createExamDao();
		ExamDao examDao = ExamDaoFactory.getInstance().createExamDao4MongoDB();
		TransactionHandler transactionHandler1 = new TransactionHandler();
		examService = (ExamService)transactionHandler1.createProxyObject(new ExamServiceImpl(examDao));
		
		/**
		 * 学生类服务初始化
		 */
		//StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao();
		StudentDao studentDao = StudentDaoFactory.getInstance().createStudentDao4MongoDB();
		TransactionHandler transactionHandler2 = new TransactionHandler();
		studentService = (StudentService)transactionHandler2.createProxyObject(new StudentServiceImpl(studentDao));
		
		/**
		 * 答题保护服务初始化
		 */
		//MessDao messDao = MessDaoFactory.getInstance().createMessDao4SQLServer();
		MessDao messDao = MessDaoFactory.getInstance().createMessDao4MongoDB();
		TransactionHandler transactionHandler3 = new TransactionHandler();
		messService = (MessService) transactionHandler3.createProxyObject(new MessServiceImpl(messDao));
		
		//ScoreDao scoreDao = ScoreDaoFactory.getInstance().createScoreDao4SQLServer();
		ScoreDao scoreDao = ScoreDaoFactory.getInstance().createScoreDao4MongoDB();
		TransactionHandler transactionHandler4 = new TransactionHandler();
		scoreService = (ScoreService) transactionHandler4.createProxyObject(new ScoreServiceImpl(scoreDao));
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	public MessService getMessService() {
		return messService;
	}

	public void setMessService(MessService messService) {
		this.messService = messService;
	}

	public ScoreService getScoreService() {
		return scoreService;
	}

	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}
	
	
	
	
	

}
