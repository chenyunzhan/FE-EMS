package com.ems.fe.util;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;

import org.apache.log4j.*;

import com.ems.fe.exceptions.AppException;


/**
 * ͳһ��������
 * @author ����չ
 *
 */
public class TransactionHandler implements InvocationHandler {
	
	 Logger log = Logger.getLogger(TransactionHandler.class);
	
	private Object targetObject;
	
	public Object createProxyObject(Object targetObject){
		this.targetObject = targetObject;
		return Proxy.newProxyInstance(targetObject.getClass().getClassLoader(), targetObject.getClass().getInterfaces(), this);
	}

	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		Connection conn = ConnectionManager.getConnection();
		Object retVal = null;
		try{
			//��������
			if(method.getName().startsWith("add")||
			   method.getName().startsWith("delete")||
			   method.getName().startsWith("modify")){
				conn.setAutoCommit(false);
			}
			log.info(method.getName() + "--beginTransaction");
			//����Ŀ������ϵ�ҵ���߼�����
			retVal = method.invoke(this.targetObject, args);
			
			//�ύ����
			if(!conn.getAutoCommit()){
				conn.commit();
			}
			log.info(method.getName() + "--commitTransaction");
		}catch(AppException e){
			//�ع�����
			if(!conn.getAutoCommit()){
				conn.rollback();
			}
			throw e;
			
		}catch(Exception e){
			e.printStackTrace();
			//�ع�����
			log.info(e);
			if(!conn.getAutoCommit()){
				conn.rollback();
			}
			log.info(method.getName() + "--rollbackTransaction");
			throw new AppException("����ʧ�ܣ�");
		}finally{
			if(!conn.getAutoCommit()){
				conn.setAutoCommit(true);
			}
			ConnectionManager.closeConnection();
		}
		return retVal;
	}
}
