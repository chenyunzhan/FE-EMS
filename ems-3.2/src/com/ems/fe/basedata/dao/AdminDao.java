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
 * ����Աdao��ӿ�
 * @author Administrator����չ
 *
 */
public interface AdminDao {
	
	/**
	 * ����Ա��¼
	 * @param aId
	 * @param aPassword
	 * @throws DaoException
	 */
	public Admin adminLogin(String aId, String aPassword)throws DaoException;
	
	/**
	 * ���ݹ���Աid��ѯ
	 * @param aId
	 * @return
	 * @throws DaoException
	 */
	public Admin findAdminById(String aId)throws DaoException;
	
	/**
	 * ��ѯ����
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
	 * ����ѧ�Ż����Ծ�Ų�ѯ�ɼ�
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public List findScoreByPidOrSid(int pageNo, int pageSize, String paperId, String studentId)throws DaoException;
	
	/**
	 * ����ѧ�ź����Ծ�Ų�ѯ�ɼ�
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public List findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)throws DaoException;
	
	/**
	 * ����ѧ�ź��Ծ�ŵõ���¼��
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String paperId, String studentId)throws DaoException;
	
	/**
	 * �õ��ܼ�¼��
	 * @param sGrade
	 * @param sDepartmentId
	 * @param sClasses
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord(String sGrade, String sDepartmentId, String sClasses )
	throws DaoException;
	
	/**
	 * ����ѧ��ID����ѧ��
	 * @param sId
	 * @return
	 * @throws DaoException
	 */
	public Student findStudentById(String sId)throws DaoException;
	
	/**
	 * �����Ծ�ID�����Ծ�
	 * @param pId
	 * @return
	 * @throws DaoException
	 */
	public ExamPaper findPaperByPid(String pId)throws DaoException;
	
	/**
	 * �ڷ������и����Ծ�ID��ѧ��ѧ�Ų�ѯ�ɼ�
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws DaoException
	 */
	public Score findScore(String paperId, String studentId)throws DaoException;
	
	/**
	 * �õ��Ծ��б�
	 * @return
	 * @throws DaoException
	 */
	public List getPaperList()throws DaoException;
	
	/**
	 * ��ӳɼ�
	 * @param conn
	 * @param score
	 */
	public void addScore(Score score)throws DaoException;
	
	/**
	 * ����id��ɼ�
	 * @return
	 * @throws DaoException
	 */
	public Score findScore(String id)throws DaoException;
	
	/**
	 * �޸ĳɼ�
	 * @param score
	 * @throws DaoException
	 */
	public void modifyScore(Score score)throws DaoException;
	
	/**
	 * ɾ���ɼ�
	 * @param scoreId
	 * @throws DaoException
	 */
	public void deleteScoreById(String scoreId)throws DaoException;
	
	/**
	 * �޸Ĺ���Ա����
	 * @param aId
	 * @param aPassword
	 * @throws DaoException
	 */
	public void modifyTeacherPassword(String aId, String aPassword)throws DaoException;
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @param admin
	 * @throws DaoException
	 */
	public void modifyAdmin(Admin admin)throws DaoException;
	
	/**
	 * ��ѯ���й�����Ϣ
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws DaoException
	 */
	public List findAllAdmin(int pageNo, int pageSize)throws DaoException;
	
	/**
	 * �õ�����Ա��¼��
	 * @return
	 * @throws DaoException
	 */
	public int getTotalRecord()	throws DaoException; 
	
}
