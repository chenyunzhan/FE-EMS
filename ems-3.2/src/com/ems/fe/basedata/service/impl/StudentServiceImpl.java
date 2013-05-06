package com.ems.fe.basedata.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.dao.StudentDao;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.basedata.service.StudentService;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
import com.fe.ems.util.DB;
import com.fe.ems.util.Login;
/**
 * ѧ�������ʵ��
 * @author ����չ
 *
 */
public class StudentServiceImpl implements StudentService {
	
	private StudentDao studentDao;
	
	public StudentServiceImpl(StudentDao studentDao){
		this.studentDao = studentDao;
	}

	public PageModel findAllStudent(int pageNo, int pageSize, String gra,
			String dep, String cla) throws AppException {
		try{
			List studentList = studentDao.findAllStudent(pageNo, pageSize, gra, dep, cla);
			int totalRecords = studentDao.getTotalRecord(gra, dep, cla);
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(studentList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("ѧ����ѯʧ�ܣ�");
		}
	}

	public Student findStudentById(String id) throws AppException {
		try{
			return studentDao.findStudentById(id);
		}catch(DaoException e){
			throw new AppException("����ѧ�Ų���ѧ��ʧ�ܣ�");
		}
		
	}

	public void addStudent(Student student) throws AppException {
		try{
			studentDao.addStudent(student);
		}catch(DaoException e){
			throw new AppException("���ѧ��ʧ�ܣ�");
		}
	}

	public void modifyStudent(Student student) throws AppException {
		try{
			studentDao.modifyStudent(student);
		}catch(DaoException e){
			throw new AppException("�޸�ѧ��ʧ�ܣ�");
		}
	}

	public void deleteStudentById(String id) throws AppException {
		try{
			studentDao.deleteStudentById(id);
		}catch(DaoException e){
			throw new AppException("ɾ��ѧ��ʧ�ܣ�");
		}
	}

	@Override
	public Login login(String sid, String spassword) throws AppException {
		try{
			return studentDao.login(sid, spassword);
		}catch(DaoException e){
			throw new AppException("ɾ��ѧ��ʧ�ܣ�");
		}	
		
	}

}
