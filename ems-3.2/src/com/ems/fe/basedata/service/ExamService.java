package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
/**
 * 试题服务层
 * @author 陈云展
 *
 */
public interface ExamService {
	/**
	 * 查询所有试题
	 * @param pageNo
	 * @param pageSize
	 * @param year
	 * @param month
	 * @param Course
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllExam(int pageNo, int pageSize, String year, String month, String course)throws AppException;
	
	/**
	 * 添加试题
	 * @param exampaper
	 * @throws AppException
	 */
	public void addExamPaper(ExamPaper exampaper)throws AppException;
	
	/**
	 * 根据id查询试题不是试卷
	 * @param pId
	 * @return
	 * @throws AppException
	 */
	public ExamPaper findExamByPid(String pId)throws AppException;
	
	/**
	 * 修改试题
	 * @param exampaper
	 * @throws AppException
	 */
	public void modifyExamPaper(ExamPaper exampaper)throws AppException;

	/**
	 * 删除试题
	 * @param eId
	 * @throws AppException
	 */
	public void deleteExamPaperById(String eId)throws AppException;
	
	public ExamPaper findExamPaperByPaperIdAndTimuId (String pId, String timuId) throws AppException;
}
