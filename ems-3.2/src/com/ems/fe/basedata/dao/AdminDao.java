package com.ems.fe.basedata.dao;

import java.sql.Connection;
import java.util.List;

import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;

/**
 * 管理员dao层接口
 * @author Administrator陈云展
 *
 */
public interface AdminDao {
	
	/**
	 * 管理员登录
	 * @param aId
	 * @param aPassword
	 * @throws DaoException
	 */
	public Admin adminLogin(String aId, String aPassword)throws DaoException;
	
	/**
	 * 根据管理员id查询
	 * @param aId
	 * @return
	 * @throws DaoException
	 */
	public Admin findAdminById(String aId)throws DaoException;
	
	/**
	 * 查询分数
	 * @param pageNo
	 * @param pageSize
	 * @param grade
	 * @param classes
	 * @param departmentId
	 * @return
	 * @throws DaoException
	 */
	public List findAllScore(int pageNo, int pageSize, String sGrade, String sDepartmentId, String sClasses)throws DaoException;
	
	/**
	 * 根据学号或者试卷号查询成绩
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public List findScoreByPidOrSid(int pageNo, int pageSize, String paperId, String studentId)throws DaoException;
	
	/**
	 * 根据学号和者试卷号查询成绩
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public List findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)throws DaoException;
	
	/**
	 * 根据学号和试卷号得到记录数
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String paperId, String studentId)throws DaoException;
	
	/**
	 * 得到总记录数
	 * @param sGrade
	 * @param sDepartmentId
	 * @param sClasses
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String sGrade, String sDepartmentId, String sClasses )
	throws DaoException;
	
	/**
	 * 根据学生ID查找学生
	 * @param sId
	 * @return
	 * @throws DaoException
	 */
	public Student findStudentById(String sId)throws DaoException;
	
	/**
	 * 根据试卷ID查找试卷
	 * @param pId
	 * @return
	 * @throws DaoException
	 */
	public ExamPaper findPaperByPid(String pId)throws DaoException;
	
	/**
	 * 在分数表中根据试卷ID和学生学号查询成绩
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public Score findScore(String paperId, String studentId)throws DaoException;
	
	/**
	 * 得到试卷列表
	 * @return
	 * @throws DaoException
	 */
	public List getPaperList()throws DaoException;
	
	/**
	 * 添加成绩
	 * @param conn
	 * @param score
	 */
	public void addScore(Score score)throws DaoException;
	
	/**
	 * 根据id查成绩
	 * @return
	 * @throws DaoException
	 */
	public Score findScore(String id)throws DaoException;
	
	/**
	 * 修改成绩
	 * @param score
	 * @throws DaoException
	 */
	public void modifyScore(Score score)throws DaoException;
	
	/**
	 * 删除成绩
	 * @param scoreId
	 * @throws DaoException
	 */
	public void deleteScoreById(String scoreId)throws DaoException;
	
	/**
	 * 修改管理员密码
	 * @param aId
	 * @param aPassword
	 * @throws DaoException
	 */
	public void modifyTeacherPassword(String aId, String aPassword)throws DaoException;
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @throws DaoException
	 */
	public void modifyAdmin(Admin admin)throws DaoException;
	
	/**
	 * 查询所有管理信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws DaoException
	 */
	public List findAllAdmin(int pageNo, int pageSize)throws DaoException;
	
	/**
	 * 得到管理员记录数
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord()	throws DaoException; 
	
}
