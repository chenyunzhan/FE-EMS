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
 * 管理员服务层的实现
 * @author 陈云展
 *
 */
public class AdminServiceImpl implements AdminService{

	private AdminDao adminDao;
	
	public AdminServiceImpl(AdminDao adminDao){
		this.adminDao = adminDao;
	}
	
	/**
	 * 管理员登录实现
	 */
	public Admin adminLogin(String aId, String aPassword) throws AppException {
		try{
			return adminDao.adminLogin(aId, aPassword);
		}catch(DaoException e){
		//	e.printStackTrace();
			throw new AppException("用户登录失败！");
		}
	}
	/**
	 * 查询所有成绩
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
			throw new AppException("分数查询失败！");
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
			throw new AppException("分数查询失败！");
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
			throw new AppException("分数查询失败！");
		}
	}

	public ExamPaper findPaperByPid(String pId) throws AppException {
		try{
			return adminDao.findPaperByPid(pId);
		}catch(DaoException e){
			throw new AppException("根据试卷ID查找试卷失败！");
		}
	}

	public Student findStudentById(String id) throws AppException {
		try{
			return adminDao.findStudentById(id);
		}catch(DaoException e){
			throw new AppException("根据学号查找学生失败！");
		}
		
	}

	public Score findScore(String paperId, String studentId)
			throws DaoException {
		try{
			return adminDao.findScore(paperId, studentId);
		}catch(DaoException e){
			throw new AppException("查找分数失败！");
		}
	}

	public List getPaperList() throws AppException {
		try{
			return adminDao.getPaperList();
		}catch(DaoException e){
			throw new AppException("获得试卷列表失败!");
		}
	}

	public void addScore(Score score) throws AppException {
		try{
			adminDao.addScore(score);
		}catch(DaoException e){
			throw new AppException("添加分数失败！");
		}
	}

	public Score findScore(String id)throws AppException {
		try{
			return adminDao.findScore(id);
		}catch(DaoException e){
			throw new AppException("查找分数失败！");
		}
	}

	public void modifyScore(Score score) throws AppException {
		try{
			adminDao.modifyScore(score);
		}catch(DaoException e){
			throw new AppException("修改分数失败！");
		}		
	}

	public void deleteScoreById(String scoreId) throws AppException {
		try{
			adminDao.deleteScoreById(scoreId);
		}catch(DaoException e){
			throw new AppException("删除分数失败！");
		}			
	}

	public void modifyTeacherPassword(String aId, String aPassword)
			throws AppException {
		try{
			adminDao.modifyTeacherPassword(aId, aPassword);
		}catch(DaoException e){
			throw new AppException("修改密码失败！");
		}
	}

	public void modifyAdmin(Admin admin) throws AppException {
		try{
			adminDao.modifyAdmin(admin);
		}catch(DaoException e){
			throw new AppException("修改信息失败！");
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
			throw new AppException("管理员查询失败！");
		}
	}

	public Admin findAdminById(String id) throws AppException {
		try{
			return adminDao.findAdminById(id);
		}catch(DaoException e){
			throw new AppException("根据id查询管理员失败！");
		}
		
	}
}
