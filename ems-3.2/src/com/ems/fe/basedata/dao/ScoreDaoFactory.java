package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.dao.impl.ScoreDao4SQLServerImpl;


public class ScoreDaoFactory {
	
	private static ScoreDaoFactory instance = new ScoreDaoFactory();
	
	public static ScoreDaoFactory getInstance(){
		return instance;
	}

	public ScoreDao createScoreDao4SQLServer() {
		return new ScoreDao4SQLServerImpl();
	}
}
