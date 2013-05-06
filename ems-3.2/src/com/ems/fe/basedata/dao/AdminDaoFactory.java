package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.dao.impl.AdminDao4MongoDBImpl;
import com.ems.fe.basedata.dao.impl.AdminDao4SQLServerImpl;
/**
 * 、
 * @author Administrator陈云展
 *
 */
public class AdminDaoFactory {
	private static AdminDaoFactory instance = new AdminDaoFactory();
	
	public static AdminDaoFactory getInstance(){
		return instance;
	}
	
	public AdminDao createAdminDao(){
		return new AdminDao4SQLServerImpl();
	}
	
	public AdminDao createAdminDao4MongoDB() {
		return new AdminDao4MongoDBImpl();
	}
	
	private AdminDaoFactory(){
		//读取文件
	}
	
	
}
