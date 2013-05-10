package com.ems.fe.basedata.service.impl;

import com.ems.fe.basedata.dao.MessDao;
import com.ems.fe.basedata.model.Mess;
import com.ems.fe.basedata.service.MessService;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;

public class MessServiceImpl implements MessService{
	
	private MessDao messDao;
	
	public MessServiceImpl(MessDao messDao) {
		this.messDao = messDao;
	}

	@Override
	public void addUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId) throws AppException {
		try{
			messDao.addUserProtectMess(s_id, p_id, timeout,
					answer, allowstates, monistates, timuId);
		} catch(DaoException e) {
			throw new AppException("添加保护信息失败！");
		} 
	}

	@Override
	public void deleteUserProtectMess(String s_id, String p_id)
			throws AppException {
		try{
			messDao.deleteUserProtectMess(s_id, p_id);
		} catch(DaoException e) {
			throw new AppException("删除保护信息失败！");
		} 
		
	}

	@Override
	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates,String timuId) throws AppException {
		try{
			messDao.modifyUserProtectMess(s_id, p_id, timeout,
					answer, allowstates, monistates,timuId);
		} catch(DaoException e) {
			throw new AppException("修改保护信息失败！");
		} 
		
	}

	@Override
	public Mess findUserProtectMess(String s_id, String p_id)
			throws AppException {
		try{
			return messDao.findUserProtectMess(s_id, p_id);
		} catch(DaoException e) {
			throw new AppException("查找保护信息失败！");
		} 
		
	}

	@Override
	public Mess findUserProtectMessByUserId(String id, int monistates)
			throws AppException {
		try{
			return messDao.findUserProtectMessByUserId(id, monistates);
		} catch(DaoException e) {
			throw new AppException("根据用户ID查找保护信息失败！");
		} 
	}

	@Override
	public Mess getUserProtectMess(String s_id, String pid) throws AppException {
		try{
			return messDao.getUserProtectMess(s_id, pid);
		} catch(DaoException e) {
			throw new AppException("判断用户是否考试失败！");
		} 
	}


}
