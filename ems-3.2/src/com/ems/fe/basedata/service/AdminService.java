package com.ems.fe.basedata.service;

import java.sql.Connection;
import java.util.List;

import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
/**
 * 管理员服务层接口
 * @author 陈云展
 *
 */
public interface AdminService {
	
	/**
	 * 管理员登录
	 * @throws AppException
	 */
	public Admin adminLogin(String aId, String aPassword)
	throws AppException;
	
	/**
	 * 查询所有成绩
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllScore(int pageNo, int pageSize, String sGrade, String sDepartmentId, String sClasses)
	throws AppException;
	
	/**
	 * 根据学号或试卷号查成绩
	 * @param pageNo
	 * @param pageSize
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public PageModel findScoreByPidOrSid(int pageNo, int pageSize, String paperId, String studentId)throws AppException;
	
	/**
	 * 根据学号和试卷号查成绩
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public PageModel findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)throws AppException;
	
	/**
	 * 根据学号查询学生
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Student findStudentById(String id) throws AppException;
	
	/**
	 * 根据试卷ID查询试卷
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public ExamPaper findPaperByPid(String id) throws AppException;
	
	/**
	 * 在分数表中根据试卷ID和学生学号查询成绩
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public Score findScore(String paperId, String studentId)throws AppException;
	
	/**
	 * 得到试卷列表
	 * @return
	 * @throws AppException
	 */
	public List getPaperList()throws AppException;
	
	/**
	 * 添加成绩
	 * @param conn
	 * @param score
	 * @throws AppException
	 */
	public void addScore(Score score)throws AppException;
	
	/**
	 * 根据id查找成绩
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Score findScore(String id)throws AppException;
	
	/**
	 * 修改成绩
	 * @param score
	 * @throws AppException
	 */
	public void modifyScore(Score score)throws AppException;
	
	/**
	 * 根据id删除成绩
	 * @param scoreId
	 * @throws AppException
	 */
	public void deleteScoreById(String scoreId)throws AppException;
	
	/**
	 * 修改管理员密码
	 * @param aId
	 * @param aPassword
	 * @throws AppException
	 */
	public void modifyTeacherPassword(String aId, String aPassword)throws AppException;
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @throws AppException
	 */
	public void modifyAdmin(Admin admin)throws AppException;
	
	/**
	 * 查询所有管理信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllAdmin(int pageNo, int pageSize)throws AppException;
	
	/**
	 * 根据id查询管理员
	 * @param aId
	 * @return
	 * @throws AppException
	 */
	public Admin findAdminById(String aId)throws AppException;
	
}
