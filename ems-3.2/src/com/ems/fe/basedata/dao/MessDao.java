package com.ems.fe.basedata.dao;

import com.ems.fe.basedata.model.Mess;
import com.ems.fe.exceptions.DaoException;

public interface MessDao {

	public void addUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId) throws DaoException;

	public void deleteUserProtectMess(String s_id, String p_id) throws DaoException;

	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId) throws DaoException;

	public Mess findUserProtectMess(String s_id, String p_id) throws DaoException;

	public Mess findUserProtectMessByUserId(String id, int monistates) throws DaoException;

}
