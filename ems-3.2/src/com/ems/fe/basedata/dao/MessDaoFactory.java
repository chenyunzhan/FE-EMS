package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.dao.impl.MessDao4MongoDBImpl;
import com.ems.fe.basedata.dao.impl.MessDao4SQLServerImpl;

public class MessDaoFactory {
	private static MessDaoFactory instance = new MessDaoFactory();
	
	public static MessDaoFactory getInstance() {
		return instance;
	}
	
	public MessDao createMessDao4SQLServer() {
		return new MessDao4SQLServerImpl();
	}
	
	public MessDao createMessDao4MongoDB() {
		return new MessDao4MongoDBImpl();
	}
}
