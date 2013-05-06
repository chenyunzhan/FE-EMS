package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.dao.impl.StudentDao4MongoDBImpl;
import com.ems.fe.basedata.dao.impl.StudentDao4SQLServerImpl;
/**
 * 
 * @author ³ÂÔÆÕ¹
 *
 */
public class StudentDaoFactory {
	
	private static StudentDaoFactory instance = new StudentDaoFactory();
	
	public static StudentDaoFactory getInstance(){
		return instance;
	}
	
	public StudentDao createStudentDao(){
		return new StudentDao4SQLServerImpl();
	}
	
	public StudentDao createStudentDao4MongoDB(){
		return new StudentDao4MongoDBImpl();
	}
}
