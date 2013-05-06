package com.ems.fe.util;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;

import org.apache.log4j.*;

import com.ems.fe.exceptions.AppException;


/**
 * 统一管理事务
 * @author 陈云展
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
			//开启事务
			if(method.getName().startsWith("add")||
			   method.getName().startsWith("delete")||
			   method.getName().startsWith("modify")){
				conn.setAutoCommit(false);
			}
			log.info(method.getName() + "--beginTransaction");
			//调用目标对象上的业务逻辑方法
			retVal = method.invoke(this.targetObject, args);
			
			//提交事务
			if(!conn.getAutoCommit()){
				conn.commit();
			}
			log.info(method.getName() + "--commitTransaction");
		}catch(AppException e){
			//回滚事务
			if(!conn.getAutoCommit()){
				conn.rollback();
			}
			throw e;
			
		}catch(Exception e){
			e.printStackTrace();
			//回滚事务
			log.info(e);
			if(!conn.getAutoCommit()){
				conn.rollback();
			}
			log.info(method.getName() + "--rollbackTransaction");
			throw new AppException("操作失败！");
		}finally{
			if(!conn.getAutoCommit()){
				conn.setAutoCommit(true);
			}
			ConnectionManager.closeConnection();
		}
		return retVal;
	}
}
