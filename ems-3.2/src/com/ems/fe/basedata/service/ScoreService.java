package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.Score;
import com.ems.fe.exceptions.AppException;

public interface ScoreService {
	
	public void addScore(Score score) throws AppException;

}
