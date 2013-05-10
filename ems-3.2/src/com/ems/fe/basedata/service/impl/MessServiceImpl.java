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
			throw new AppException("��ӱ�����Ϣʧ�ܣ�");
		} 
	}

	@Override
	public void deleteUserProtectMess(String s_id, String p_id)
			throws AppException {
		try{
			messDao.deleteUserProtectMess(s_id, p_id);
		} catch(DaoException e) {
			throw new AppException("ɾ��������Ϣʧ�ܣ�");
		} 
		
	}

	@Override
	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates,String timuId) throws AppException {
		try{
			messDao.modifyUserProtectMess(s_id, p_id, timeout,
					answer, allowstates, monistates,timuId);
		} catch(DaoException e) {
			throw new AppException("�޸ı�����Ϣʧ�ܣ�");
		} 
		
	}

	@Override
	public Mess findUserProtectMess(String s_id, String p_id)
			throws AppException {
		try{
			return messDao.findUserProtectMess(s_id, p_id);
		} catch(DaoException e) {
			throw new AppException("���ұ�����Ϣʧ�ܣ�");
		} 
		
	}

	@Override
	public Mess findUserProtectMessByUserId(String id, int monistates)
			throws AppException {
		try{
			return messDao.findUserProtectMessByUserId(id, monistates);
		} catch(DaoException e) {
			throw new AppException("�����û�ID���ұ�����Ϣʧ�ܣ�");
		} 
	}

	@Override
	public Mess getUserProtectMess(String s_id, String pid) throws AppException {
		try{
			return messDao.getUserProtectMess(s_id, pid);
		} catch(DaoException e) {
			throw new AppException("�ж��û��Ƿ���ʧ�ܣ�");
		} 
	}


}
