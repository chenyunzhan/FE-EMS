package com.ems.fe.basedata.dao;

import java.util.List;

import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.fe.ems.util.Login;
/**
 * 
 * @author 陈云展
 *
 */
public interface StudentDao {
	
	/**
	 * 查询所有的学生
	 * @param pageNo
	 * @param pageSize
	 * @param gra
	 * @param dep
	 * @param cla
	 * @return
	 * @throws DaoException
	 */
	public List findAllStudent(int pageNo, int pageSize, String gra, String dep, String cla)throws DaoException;
	
	/**
	 * 查询所有学生的总记录数
	 * @param gra
	 * @param dep
	 * @param cla
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String gra, String dep, String cla)throws DaoException;
	
	/**
	 * 根据学生ID查找学生
	 * @param sId
	 * @return
	 * @throws DaoException
	 */
	public Student findStudentById(String sId)throws DaoException;
	
	/**
	 * 添加学生
	 * @param student
	 * @throws DaoException
	 */
	public void addStudent(Student student)throws DaoException;
	
	/**
	 * 修改学生
	 * @param student
	 * @throws DaoException
	 */
	public void modifyStudent(Student student)throws DaoException;
	
	/**
	 * 根据id删除学生
	 * @param sId
	 * @throws DaoException
	 */
	public void deleteStudentById(String sId)throws DaoException;
	
	/**
	 * 根据sid和spassword登录
	 * @param sid
	 * @param spassword
	 * @return
	 * @throws DaoException
	 */
	public Login login(String sid, String spassword) throws DaoException;
}
