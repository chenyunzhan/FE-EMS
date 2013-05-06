package com.ems.fe.basedata.service.impl;
import java.sql.Connection;
import java.util.List;

import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.basedata.service.AdminService;
import com.ems.fe.exceptions.AppException;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.PageModel;
/**
 * ����Ա������ʵ��
 * @author ����չ
 *
 */
public class AdminServiceImpl implements AdminService{

	private AdminDao adminDao;
	
	public AdminServiceImpl(AdminDao adminDao){
		this.adminDao = adminDao;
	}
	
	/**
	 * ����Ա��¼ʵ��
	 */
	public Admin adminLogin(String aId, String aPassword) throws AppException {
		try{
			return adminDao.adminLogin(aId, aPassword);
		}catch(DaoException e){
		//	e.printStackTrace();
			throw new AppException("�û���¼ʧ�ܣ�");
		}
	}
	/**
	 * ��ѯ���гɼ�
	 */
	public PageModel findAllScore(int pageNo, int pageSize, String sGrade, String sDepartmentId, String sClasses) throws AppException {
		try{
			List scoreList = adminDao.findAllScore(pageNo, pageSize, sGrade, sDepartmentId, sClasses);
			int totalRecords = adminDao.getTotalRecord(sGrade, sDepartmentId, sClasses);
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(scoreList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("������ѯʧ�ܣ�");
		}
	}

	public PageModel findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)
			throws AppException {
		try{
			List scoreList = adminDao.findScoreByPidAndSid(pageNo, pageSize, paperId, studentId);
			int totalRecords = 1;
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(scoreList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("������ѯʧ�ܣ�");
		}
		
	}

	public PageModel findScoreByPidOrSid(int pageNo, int pageSize, String paperId,
			String studentId) throws AppException {
		try{
			List scoreList = adminDao.findScoreByPidOrSid(pageNo, pageSize, paperId, studentId);
			int totalRecords = adminDao.getTotalRecord(paperId, studentId);
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(scoreList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("������ѯʧ�ܣ�");
		}
	}

	public ExamPaper findPaperByPid(String pId) throws AppException {
		try{
			return adminDao.findPaperByPid(pId);
		}catch(DaoException e){
			throw new AppException("�����Ծ�ID�����Ծ�ʧ�ܣ�");
		}
	}

	public Student findStudentById(String id) throws AppException {
		try{
			return adminDao.findStudentById(id);
		}catch(DaoException e){
			throw new AppException("����ѧ�Ų���ѧ��ʧ�ܣ�");
		}
		
	}

	public Score findScore(String paperId, String studentId)
			throws DaoException {
		try{
			return adminDao.findScore(paperId, studentId);
		}catch(DaoException e){
			throw new AppException("���ҷ���ʧ�ܣ�");
		}
	}

	public List getPaperList() throws AppException {
		try{
			return adminDao.getPaperList();
		}catch(DaoException e){
			throw new AppException("����Ծ��б�ʧ��!");
		}
	}

	public void addScore(Score score) throws AppException {
		try{
			adminDao.addScore(score);
		}catch(DaoException e){
			throw new AppException("��ӷ���ʧ�ܣ�");
		}
	}

	public Score findScore(String id)throws AppException {
		try{
			return adminDao.findScore(id);
		}catch(DaoException e){
			throw new AppException("���ҷ���ʧ�ܣ�");
		}
	}

	public void modifyScore(Score score) throws AppException {
		try{
			adminDao.modifyScore(score);
		}catch(DaoException e){
			throw new AppException("�޸ķ���ʧ�ܣ�");
		}		
	}

	public void deleteScoreById(String scoreId) throws AppException {
		try{
			adminDao.deleteScoreById(scoreId);
		}catch(DaoException e){
			throw new AppException("ɾ������ʧ�ܣ�");
		}			
	}

	public void modifyTeacherPassword(String aId, String aPassword)
			throws AppException {
		try{
			adminDao.modifyTeacherPassword(aId, aPassword);
		}catch(DaoException e){
			throw new AppException("�޸�����ʧ�ܣ�");
		}
	}

	public void modifyAdmin(Admin admin) throws AppException {
		try{
			adminDao.modifyAdmin(admin);
		}catch(DaoException e){
			throw new AppException("�޸���Ϣʧ�ܣ�");
		}	
	}

	public PageModel findAllAdmin(int pageNo, int pageSize) throws AppException {
		try{
			List adminList = adminDao.findAllAdmin(pageNo, pageSize);
			int totalRecords = adminDao.getTotalRecord();
			PageModel pageModel = new PageModel();
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setList(adminList);
			pageModel.setTotalRecords(totalRecords);
			return pageModel;
		}catch(DaoException e){
			throw new AppException("����Ա��ѯʧ�ܣ�");
		}
	}

	public Admin findAdminById(String id) throws AppException {
		try{
			return adminDao.findAdminById(id);
		}catch(DaoException e){
			throw new AppException("����id��ѯ����Աʧ�ܣ�");
		}
		
	}
}
