package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
import com.fe.ems.util.Login;
/**
 * ѧ�������
 * @author ����չ
 *
 */
public interface StudentService {
	/**
	 * ��ѯ����ѧ����Ϣ
	 * @param pageNo
	 * @param pageSize
	 * @param gra
	 * @param dep
	 * @param cla
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllStudent(int pageNo, int pageSize, String gra, String dep, String cla)throws AppException;
	
	/**
	 * ����ѧ�Ų�ѯѧ��
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Student findStudentById(String id) throws AppException;
	
	/**
	 * ���ѧ��
	 * @param student
	 * @throws AppException
	 */
	public void addStudent(Student student)throws AppException;
	
	/**
	 * �޸�ѧ��
	 * @param student
	 * @throws AppException
	 */
	public void modifyStudent(Student student)throws AppException;
	
	/**
	 * ����idɾ��ѧ��
	 * @param sId
	 * @throws AppException
	 */
	public void deleteStudentById(String sId)throws AppException;
	
	/**
	 * ����ѧ��������������е�¼
	 * @param sid
	 * @param spassword
	 * @throws AppException
	 */
	public Login login(String sid,String spassword) throws AppException;
}
