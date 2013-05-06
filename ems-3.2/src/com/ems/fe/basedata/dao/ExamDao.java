package com.ems.fe.basedata.dao;

import java.util.List;

import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
/**
 * 
 * @author 陈云展
 *
 */
public interface ExamDao {
	
	/**
	 * 查询所有试卷
	 * @param pageNo
	 * @param pageSize
	 * @param year
	 * @param month
	 * @return
	 * @throws DaoException
	 */
	public List findAllExam(int pageNo, int pageSize, String year, String month, String course)throws DaoException;
	
	/**
	 * 得到总记录数
	 * @param year
	 * @param month
	 * @param course
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String year, String month, String course)throws DaoException;
	
	/**
	 * 添加试题
	 * @param exampaper
	 * @throws DaoException
	 */
	public void addExamPaper(ExamPaper exampaper)throws DaoException;
	
	/**
	 * 根据试题ID查找试卷
	 * @param pId
	 * @return
	 * @throws DaoException
	 */
	public ExamPaper findExamByPid(String pId)throws DaoException;
	
	/**
	 * 修改试题
	 * @param exampaper
	 * @throws DaoException
	 */
	public void modifyExamPaper(ExamPaper exampaper)throws DaoException;
	
	/**
	 * 删除试题
	 * @param eId
	 * @throws DaoException
	 */
	public void deleteExamPaperById(String eId)throws DaoException;
	
	/**
	 * 根据题目号和试题id查找题目
	 * @param pId
	 * @param timuId
	 * @return
	 */
	public ExamPaper findExamPaperByPaperIdAndTimuId(String pId, String timuId);

}
