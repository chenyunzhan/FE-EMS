package com.ems.fe.basedata.dao;

import java.util.List;

import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.fe.ems.util.Login;
/**
 * 
 * @author ����չ
 *
 */
public interface StudentDao {
	
	/**
	 * ��ѯ���е�ѧ��
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
	 * ��ѯ����ѧ�����ܼ�¼��
	 * @param gra
	 * @param dep
	 * @param cla
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String gra, String dep, String cla)throws DaoException;
	
	/**
	 * ����ѧ��ID����ѧ��
	 * @param sId
	 * @return
	 * @throws DaoException
	 */
	public Student findStudentById(String sId)throws DaoException;
	
	/**
	 * ���ѧ��
	 * @param student
	 * @throws DaoException
	 */
	public void addStudent(Student student)throws DaoException;
	
	/**
	 * �޸�ѧ��
	 * @param student
	 * @throws DaoException
	 */
	public void modifyStudent(Student student)throws DaoException;
	
	/**
	 * ����idɾ��ѧ��
	 * @param sId
	 * @throws DaoException
	 */
	public void deleteStudentById(String sId)throws DaoException;
	
	/**
	 * ����sid��spassword��¼
	 * @param sid
	 * @param spassword
	 * @return
	 * @throws DaoException
	 */
	public Login login(String sid, String spassword) throws DaoException;
}
