package com.ems.fe.basedata.service.impl;

import java.util.List;

import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.service.ExamService;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
/**
 * 试题服务层实现
 * @author 陈云展
 *
 */
public class ExamServiceImpl implements ExamService {
	
	private ExamDao examDao;
	
	public ExamServiceImpl(ExamDao examDao){
		this.examDao = examDao;
	}

	public PageModel findAllExam(int pageNo, int pageSize, String year,
			String month, String course) throws AppException {
		try{
			List examPaperList = examDao.findAllExam(pageNo, pageSize, year, month, course);
			int totalRecords = examDao.getTotalRecord(year, month, course);
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(examPaperList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("试题查询失败！");
		}
	}

	public void addExamPaper(ExamPaper exampaper) throws AppException {
		try{
			examDao.addExamPaper(exampaper);
		}catch(DaoException e){
			throw new AppException("添加试题失败！");
		}
	}

	public ExamPaper findExamByPid(String id) throws AppException {
		try{
			return examDao.findExamByPid(id);
		}catch(DaoException e){
			throw new AppException("根据id查找试题失败！");
		}
	}

	public void modifyExamPaper(ExamPaper exampaper) throws AppException {
		try{
			examDao.modifyExamPaper(exampaper);
		}catch(DaoException e){
			throw new AppException("试题修改失败！");
		}
	}

	public void deleteExamPaperById(String id) throws AppException {
		try{
			examDao.deleteExamPaperById(id);
		}catch(DaoException e){
			throw new AppException("试题删除失败！");
		}
	}

	@Override
	public ExamPaper findExamPaperByPaperIdAndTimuId(String pId, String timuId) {
		try{
			return examDao.findExamPaperByPaperIdAndTimuId(pId, timuId);
		}catch(DaoException e){
			throw new AppException("根据试题id和题目id查找试题失败！");
		}
	}

}
