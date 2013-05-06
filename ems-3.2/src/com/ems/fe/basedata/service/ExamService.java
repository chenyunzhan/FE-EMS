package com.ems.fe.basedata.service;

import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
/**
 * ��������
 * @author ����չ
 *
 */
public interface ExamService {
	/**
	 * ��ѯ��������
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
	 * �������
	 * @param exampaper
	 * @throws AppException
	 */
	public void addExamPaper(ExamPaper exampaper)throws AppException;
	
	/**
	 * ����id��ѯ���ⲻ���Ծ�
	 * @param pId
	 * @return
	 * @throws AppException
	 */
	public ExamPaper findExamByPid(String pId)throws AppException;
	
	/**
	 * �޸�����
	 * @param exampaper
	 * @throws AppException
	 */
	public void modifyExamPaper(ExamPaper exampaper)throws AppException;

	/**
	 * ɾ������
	 * @param eId
	 * @throws AppException
	 */
	public void deleteExamPaperById(String eId)throws AppException;
	
	public ExamPaper findExamPaperByPaperIdAndTimuId (String pId, String timuId) throws AppException;
}
