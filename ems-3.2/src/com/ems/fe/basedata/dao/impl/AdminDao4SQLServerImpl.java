package com.ems.fe.basedata.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.exceptions.PasswordNotFoundException;
import com.ems.fe.exceptions.UserNotFoundException;
import com.ems.fe.util.ConnectionManager;
/**
 * 管理员dao层的实现
 * @author 陈云展
 *
 */
public class AdminDao4SQLServerImpl implements AdminDao {

	/**
	 * 管理员登录dao层
	 */
	public Admin adminLogin(String id, String password) throws DaoException {
		Admin admin = this.findAdminById(id);
		if(admin == null){
			throw new DaoException("用户找不到！");
		}
		if(!admin.getAPassword().equals(password)){
			throw new DaoException("密码不正确！");
		}
		return admin;
	}
	
	/**
	 * 根据id查询管理员
	 */
	public Admin findAdminById(String id) throws DaoException {
		String sql = "select * from administrator where a_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin admin = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				admin = new Admin();
				admin.setAAge(rs.getInt("a_age"));
				admin.setAEmail(rs.getString("a_email"));
				admin.setAId(rs.getString("a_id"));
				admin.setAPassword(rs.getString("a_password"));
				admin.setAPhone(rs.getString("a_phone"));
				admin.setAName(rs.getString("a_name"));
				admin.setASex(rs.getString("a_sex"));
			}
		}catch(SQLException e){
			System.out.println(e);
			throw new DaoException(e);
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return admin;
	}

	public List findAllScore(int pageNo, int pageSize, String sGrade, String sDepartmentId, String sClasses) throws DaoException {
		String sql = "select top " + pageSize  +" * from score_view where score_id not in (select top " + pageSize*(pageNo-1) + " score_id from score_view order by score_id) order by score_id";
		
		if (sGrade != null && !"".equals(sGrade)){
			sql = "select top " + pageSize  +" * from score_view where s_grade="+ sGrade +
			" and (score_id not in(select top " + pageSize*(pageNo-1) + " score_id from score_view where s_grade="+ sGrade +
			" order by score_id))";
		}
		
		if (sGrade != null && !"".equals(sGrade) && sDepartmentId != null && !"".equals(sDepartmentId)){
			sql = "select top " + pageSize  +" * from score_view where s_grade="+ sGrade +" and s_department_id="+ sDepartmentId +
			" and (score_id not in(select top " + pageSize*(pageNo-1) + " score_id from score_view where s_grade="+ sGrade +" and s_department_id="+ sDepartmentId +
			" order by score_id))";
		}
		
		if (sGrade != null && !"".equals(sGrade) && sDepartmentId != null && !"".equals(sDepartmentId) && 
				sClasses != null && !"".equals(sClasses)){
			sql = "select top " + pageSize  +" * from score_view where s_grade="+ sGrade +" and s_department_id="+ sDepartmentId +" and s_classes="+ sClasses +
			" and (score_id not in(select top " + pageSize*(pageNo-1) + " score_id from score_view where s_grade="+ sGrade +" and s_department_id="+ sDepartmentId +
			" and s_classes="+ sClasses + " order by score_id))";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List scoreList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreView scoreView = new ScoreView();
				scoreView.setV_pName(rs.getString("p_name"));
				scoreView.setV_sClasses(rs.getString("s_classes"));
				scoreView.setV_score(rs.getInt("score"));
				scoreView.setV_sDepartment(rs.getString("s_department"));
				scoreView.setV_sGrade(rs.getString("s_grade"));
				scoreView.setV_sName(rs.getString("s_name"));
				scoreView.setV_paperId(rs.getString("paper_id"));
				scoreView.setV_studentId(rs.getString("student_id"));
				scoreView.setV_sDepartmentId(rs.getString("s_department_id"));
				scoreView.setV_scoreId(rs.getString("score_id"));
				scoreList.add(scoreView);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("分数查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return scoreList;
	}

	public int getTotalRecord(String grade, String departmentId, String classes)
			throws DaoException {
		String sql = "select count(*) from score_view";
		if (grade != null && !"".equals(grade)){
			sql += " where s_grade = " + grade + "";
		}
		if (grade != null && !"".equals(grade) && departmentId != null && !"".equals(departmentId)){
			sql += " and s_department_id = " + departmentId + "";
		}
		if (grade != null && !"".equals(grade) && departmentId != null && !"".equals(departmentId) && 
			classes != null && !"".equals(classes)){
			sql += " and s_classes = " + classes + "";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//System.out.println(sql);
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("根据条件得到记录数失败");
		} finally {
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
	}

	public List findScoreByPidAndSid(int pageNo, int pageSize, String paperId, String studentId)
			throws DaoException {
		String sql = "select * from score_view where student_id=? and paper_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List scoreList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.setString(2, paperId);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreView scoreView = new ScoreView();
				scoreView.setV_pName(rs.getString("p_name"));
				scoreView.setV_sClasses(rs.getString("s_classes"));
				scoreView.setV_score(rs.getInt("score"));
				scoreView.setV_sDepartment(rs.getString("s_department"));
				scoreView.setV_sGrade(rs.getString("s_grade"));
				scoreView.setV_sName(rs.getString("s_name"));
				scoreView.setV_paperId(rs.getString("paper_id"));
				scoreView.setV_studentId(rs.getString("student_id"));
				scoreView.setV_sDepartmentId(rs.getString("s_department_id"));
				scoreView.setV_scoreId(rs.getString("score_id"));
				scoreList.add(scoreView);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("分数查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return scoreList;
	}

	public List findScoreByPidOrSid(int pageNo, int pageSize, String paperId, String studentId)
			throws DaoException {
		String sql = "select top " + pageSize  +" * from score_view where student_id=? or paper_id=? and (score_id not in(select top "
						+ pageSize*(pageNo-1) + " score_id from score_view where student_id=? or paper_id=? order by score_id)) ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List scoreList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.setString(2, paperId);
			pstmt.setString(3, studentId);
			pstmt.setString(4, paperId);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreView scoreView = new ScoreView();
				scoreView.setV_pName(rs.getString("p_name"));
				scoreView.setV_sClasses(rs.getString("s_classes"));
				scoreView.setV_score(rs.getInt("score"));
				scoreView.setV_sDepartment(rs.getString("s_department"));
				scoreView.setV_sGrade(rs.getString("s_grade"));
				scoreView.setV_sName(rs.getString("s_name"));
				scoreView.setV_paperId(rs.getString("paper_id"));
				scoreView.setV_studentId(rs.getString("student_id"));
				scoreView.setV_sDepartmentId(rs.getString("s_department_id"));
				scoreView.setV_scoreId(rs.getString("score_id"));
				scoreList.add(scoreView);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("分数查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return scoreList;
	}

	public int getTotalRecord(String paperId, String studentId)
			throws DaoException {
		String sql = "select count(*) from score_view where student_id=? or paper_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//System.out.println(sql);
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.setString(2, paperId);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("根据条件得到记录数失败");
		} finally {
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
	}

	public ExamPaper findPaperByPid(String id) throws DaoException {
		String sql = "select DISTINCT p_id, p_name, e_course from exampaper where p_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ExamPaper examPaper = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				examPaper = new ExamPaper();
				examPaper.setPId(rs.getString("p_id"));
				examPaper.setPName(rs.getString("p_name"));
				examPaper.setECourse(rs.getString("e_course"));
			}
		}catch(SQLException e){
			System.out.println(e);
			throw new DaoException(e);
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return examPaper;
	}

	public Student findStudentById(String id) throws DaoException {
		String sql = "select * from student where s_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student student = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				student = new Student();
				student.setSId(rs.getString("s_id"));
				student.setSName(rs.getString("s_name"));
			}
		}catch(SQLException e){
			System.out.println(e);
			throw new DaoException(e);
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return student;
	}

	public Score findScore(String paperId, String studentId)
			throws DaoException {
		String sql = "select * from score where student_id=? and paper_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Score score = null;
		try {
			score = new Score();
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.setString(2, paperId);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				score.setPaperId(rs.getString("paper_id"));
				score.setStudentId(rs.getString("student_id"));
				score.setScore(rs.getInt("score"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("分数查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return score;
	}

	public List getPaperList() throws DaoException {
		String sql = "select DISTINCT p_name, p_id from exampaper";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List paperList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ExamPaper examPaper = new ExamPaper();
				examPaper.setPName(rs.getString("p_name"));
				examPaper.setPId(rs.getString("p_id"));
				paperList.add(examPaper);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("返回试卷列表失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return paperList;
		
	}

	public void addScore(Score score) throws DaoException {
		String sql = "insert into score(student_id, paper_id, score) values(?, ?, ?)";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score.getStudentId());
			pstmt.setString(2, score.getPaperId());
			pstmt.setInt(3, score.getScore());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("添加成绩失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
		
	}

	public Score findScore(String id) throws DaoException {
		String sql = "select * from score where score_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Score score = null;
		try {
			score = new Score();
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				score.setPaperId(rs.getString("paper_id"));
				score.setStudentId(rs.getString("student_id"));
				score.setScore(rs.getInt("score"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("分数查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return score;
	}

	public void modifyScore(Score score) throws DaoException {
		String sql = "update score set score = ? where score_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, score.getScore());
			pstmt.setString(2, score.getScoreId());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("修改成绩失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}		
	}

	public void deleteScoreById(String scoreId) throws DaoException {
		String sql = "delete from score where score_id=?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scoreId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("删除成绩失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	public void modifyTeacherPassword(String aId, String aPassword)
			throws DaoException {
		String sql = "update administrator set a_password = ? where a_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aPassword);
			pstmt.setString(2, aId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("修改密码失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	public void modifyAdmin(Admin admin) throws DaoException {
		String sql = "update administrator set a_name=?, a_sex=?, a_age=?, a_phone=?, a_email=? where a_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getAName());
			pstmt.setString(2, admin.getASex());
			pstmt.setInt(3, admin.getAAge());
			pstmt.setString(4, admin.getAPhone());
			pstmt.setString(5, admin.getAEmail());
			pstmt.setString(6, admin.getAId());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("修改信息失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}	
	}

	public List findAllAdmin(int pageNo, int pageSize) throws DaoException {
		String sql = "select * from administrator";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List adminList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Admin admin = new Admin();
				admin.setAAge(Integer.parseInt(rs.getString("a_age")));
				admin.setAEmail(rs.getString("a_email"));
				admin.setAId(rs.getString("a_id"));
				admin.setAName(rs.getString("a_name"));
				admin.setAPassword(rs.getString("a_password"));
				admin.setAPhone(rs.getString("a_phone"));
				admin.setASex(rs.getString("a_sex"));
				adminList.add(admin);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("查找管理员信息失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return adminList;
	}
	
	public int getTotalRecord()throws DaoException {
		String sql = "select count(*) from administrator";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("得到管理员总记录数失败！");
		} finally {
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
}
	
}
