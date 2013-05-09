package com.ems.fe.basedata.service.impl;

import com.ems.fe.basedata.dao.ScoreDao;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.service.ScoreService;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;

public class ScoreServiceImpl implements ScoreService {
	
	private ScoreDao scoreDao;
	
	public ScoreServiceImpl(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}

	@Override
	public void addScore(Score score) throws AppException {
		try{
			scoreDao.addScore(score);
		}catch(DaoException e){
			throw new AppException("Ìí¼Ó³É¼¨Ê§°Ü£¡");
		}
	}

}
