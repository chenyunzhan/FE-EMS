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
 * ����Ա�����ӿ�
 * @author ����չ
 *
 */
public interface AdminService {
	
	/**
	 * ����Ա��¼
	 * @throws AppException
	 */
	public Admin adminLogin(String aId, String aPassword)
	throws AppException;
	
	/**
	 * ��ѯ���гɼ�
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllScore(int pageNo, int pageSize, String sGrade, String sDepartmentId, String sClasses)
	throws AppException;
	
	/**
	 * ����ѧ�Ż��Ծ�Ų�ɼ�
	 * @param pageNo
	 * @param pageSize
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public PageModel findScoreByPidOrSid(int pageNo, int pageSize, String paperId, String studentId)throws AppException;
	
	/**
	 * ����ѧ�ź��Ծ�Ų�ɼ�
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public PageModel findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)throws AppException;
	
	/**
	 * ����ѧ�Ų�ѯѧ��
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Student findStudentById(String id) throws AppException;
	
	/**
	 * �����Ծ�ID��ѯ�Ծ�
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public ExamPaper findPaperByPid(String id) throws AppException;
	
	/**
	 * �ڷ������и����Ծ�ID��ѧ��ѧ�Ų�ѯ�ɼ�
	 * @param paperId
	 * @param studentId
	 * @return
	 * @throws AppException
	 */
	public Score findScore(String paperId, String studentId)throws AppException;
	
	/**
	 * �õ��Ծ��б�
	 * @return
	 * @throws AppException
	 */
	public List getPaperList()throws AppException;
	
	/**
	 * ��ӳɼ�
	 * @param conn
	 * @param score
	 * @throws AppException
	 */
	public void addScore(Score score)throws AppException;
	
	/**
	 * ����id���ҳɼ�
	 * @param id
	 * @return
	 * @throws AppException
	 */
	public Score findScore(String id)throws AppException;
	
	/**
	 * �޸ĳɼ�
	 * @param score
	 * @throws AppException
	 */
	public void modifyScore(Score score)throws AppException;
	
	/**
	 * ����idɾ���ɼ�
	 * @param scoreId
	 * @throws AppException
	 */
	public void deleteScoreById(String scoreId)throws AppException;
	
	/**
	 * �޸Ĺ���Ա����
	 * @param aId
	 * @param aPassword
	 * @throws AppException
	 */
	public void modifyTeacherPassword(String aId, String aPassword)throws AppException;
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @param admin
	 * @throws AppException
	 */
	public void modifyAdmin(Admin admin)throws AppException;
	
	/**
	 * ��ѯ���й�����Ϣ
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws AppException
	 */
	public PageModel findAllAdmin(int pageNo, int pageSize)throws AppException;
	
	/**
	 * ����id��ѯ����Ա
	 * @param aId
	 * @return
	 * @throws AppException
	 */
	public Admin findAdminById(String aId)throws AppException;
	
}
