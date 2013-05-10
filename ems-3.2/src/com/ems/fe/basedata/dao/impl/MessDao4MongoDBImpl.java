package com.ems.fe.basedata.dao.impl;

import com.ems.fe.basedata.dao.MessDao;
import com.ems.fe.basedata.model.Mess;
import com.ems.fe.exceptions.DaoException;

public class MessDao4MongoDBImpl implements MessDao{

	@Override
	public void addUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId)
			throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserProtectMess(String s_id, String p_id)
			throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId)
			throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Mess findUserProtectMess(String s_id, String p_id)
			throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Mess findUserProtectMessByUserId(String id, int monistates)
			throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Mess getUserProtectMess(String s_id, String p_id)
			throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

}
