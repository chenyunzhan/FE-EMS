package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.dao.impl.ExamDao4MongoDBImpl;
import com.ems.fe.basedata.dao.impl.ExamDao4SQLServerImpl;
/**
 * 
 * @author ³ÂÔÆÕ¹
 *
 */
public class ExamDaoFactory {
	private static ExamDaoFactory instance = new ExamDaoFactory();
	
	public static ExamDaoFactory getInstance(){
		return instance;
	}
	
	public ExamDao createExamDao4MongoDB(){
		return new ExamDao4MongoDBImpl();
	}
	
	public ExamDao createExamDao(){
		return new ExamDao4SQLServerImpl();
	}
}
