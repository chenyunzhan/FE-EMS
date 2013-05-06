package com.ems.fe.basedata.dao;

import java.util.List;

import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
/**
 * 
 * @author ����չ
 *
 */
public interface ExamDao {
	
	/**
	 * ��ѯ�����Ծ�
	 * @param pageNo
	 * @param pageSize
	 * @param year
	 * @param month
	 * @return
	 * @throws DaoException
	 */
	public List findAllExam(int pageNo, int pageSize, String year, String month, String course)throws DaoException;
	
	/**
	 * �õ��ܼ�¼��
	 * @param year
	 * @param month
	 * @param course
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String year, String month, String course)throws DaoException;
	
	/**
	 * �������
	 * @param exampaper
	 * @throws DaoException
	 */
	public void addExamPaper(ExamPaper exampaper)throws DaoException;
	
	/**
	 * ��������ID�����Ծ�
	 * @param pId
	 * @return
	 * @throws DaoException
	 */
	public ExamPaper findExamByPid(String pId)throws DaoException;
	
	/**
	 * �޸�����
	 * @param exampaper
	 * @throws DaoException
	 */
	public void modifyExamPaper(ExamPaper exampaper)throws DaoException;
	
	/**
	 * ɾ������
	 * @param eId
	 * @throws DaoException
	 */
	public void deleteExamPaperById(String eId)throws DaoException;
	
	/**
	 * ������Ŀ�ź�����id������Ŀ
	 * @param pId
	 * @param timuId
	 * @return
	 */
	public ExamPaper findExamPaperByPaperIdAndTimuId(String pId, String timuId);

}
