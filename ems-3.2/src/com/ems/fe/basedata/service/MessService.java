package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.Mess;
import com.ems.fe.exceptions.AppException;

public interface MessService {
	
	public void addUserProtectMess(String s_id,String p_id,int timeout,String answer,int allowstates,int monistates,String timuId) throws AppException;
	
	public void deleteUserProtectMess(String s_id,String p_id)throws AppException;
	
	public void modifyUserProtectMess(String s_id,String p_id,int timeout,String answer,int allowstates,int monistates,String timuId)throws AppException;
	
	public Mess findUserProtectMess(String s_id,String p_id)throws AppException;

	public Mess findUserProtectMessByUserId(String id, int monistates) throws AppException;
}
