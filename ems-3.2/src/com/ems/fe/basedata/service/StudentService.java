package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
import com.fe.ems.util.Login;
/**
 * 学生服务层
 * @author 陈云展
 *
 */
public interface StudentService {
	/**
	 * 查询所有学生信息
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
	 * 根据学号查询学生
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Student findStudentById(String id) throws AppException;
	
	/**
	 * 添加学生
	 * @param student
	 * @throws AppException
	 */
	public void addStudent(Student student)throws AppException;
	
	/**
	 * 修改学生
	 * @param student
	 * @throws AppException
	 */
	public void modifyStudent(Student student)throws AppException;
	
	/**
	 * 根据id删除学生
	 * @param sId
	 * @throws AppException
	 */
	public void deleteStudentById(String sId)throws AppException;
	
	/**
	 * 根据学生姓名、密码进行登录
	 * @param sid
	 * @param spassword
	 * @throws AppException
	 */
	public Login login(String sid,String spassword) throws AppException;
}
