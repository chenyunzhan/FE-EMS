package com.ems.fe.basedata.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.ConnectionManager;
/**
 * 试题Dao层实现
 * @author 陈云展
 *
 */
public class ExamDao4SQLServerImpl implements ExamDao{

	public List findAllExam(int pageNo, int pageSize, String year, String month, String course)
			throws DaoException {
		String sql = "select top " + pageSize  +" * from exampaper where e_id not in (select top " + pageSize*(pageNo-1) + " e_id from exampaper order by e_id) order by e_id";
		if(year != null && !"".equals(year)){
			sql = "select top " + pageSize  +" * from exampaper where p_id like '"+ year +"%' and (e_id not in (select top " + pageSize*(pageNo-1) + " e_id" + 
			" from exampaper where p_id like '"+ year +"%' order by e_id))";
		}
		if(year != null && !"".equals(year) && month != null && !"".equals(month)){
			sql = "select top " + pageSize  +" * from exampaper where p_id like '"+ year + month +"%' and (e_id not in (select top " + pageSize*(pageNo-1) + " e_id" + 
			" from exampaper where p_id like '"+ year + month +"%' order by e_id))";
		}
		if(year != null && !"".equals(year) && month != null && !"".equals(month) && course != null && !"".equals(course)){
			sql = "select top " + pageSize  +" * from exampaper where p_id like '"+ year + month + course +"%' and (e_id not in (select top " + pageSize*(pageNo-1) + " e_id" + 
			" from exampaper where p_id like '"+ year + month + course +"%' order by e_id))";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List examPaperList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ExamPaper examPaper = new ExamPaper();
				examPaper.setEAnswer(rs.getString("e_answer"));
				examPaper.setEContent(rs.getString("e_content"));
				examPaper.setECourse(rs.getString("e_course"));
				examPaper.setEId(Integer.parseInt(rs.getString("e_id")));
				examPaper.setEName(rs.getString("e_name"));
				examPaper.setEPic(rs.getString("e_pic"));
				examPaper.setEType(rs.getString("e_type"));
				examPaper.setPId(rs.getString("p_id"));
				examPaper.setPName(rs.getString("p_name"));
				examPaperList.add(examPaper);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("试题查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return examPaperList;
	}

	public int getTotalRecord(String year, String month, String course)
			throws DaoException {
		String sql = "select count(*) from exampaper";
		if(year != null && !"".equals(year)){
			sql += " where p_id like '" + year + "%'";
		}else if(year != null && !"".equals(year) && month != null && !"".equals(month)){
			sql += " where p_id like '" + year + month + "%'";
		}else if(year != null && !"".equals(year) && month != null && !"".equals(month) && course != null && !"".equals(course)){
			sql += " where p_id like '" + year + month + course + "'";
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
			throw new DaoException("根据条件得到试题记录数失败");
		} finally {
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
	}

	public void addExamPaper(ExamPaper exampaper) throws DaoException {
		String sql = "insert exampaper(e_answer,e_content,e_course,e_name,e_type,p_id,p_name)values(?, ?, ?, ?, ?, ?, ?)";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exampaper.getEAnswer());
			pstmt.setString(2, exampaper.getEContent());
			pstmt.setString(3, exampaper.getECourse());
			pstmt.setString(4, exampaper.getEName());
			pstmt.setString(5, exampaper.getEType());
			pstmt.setString(6, exampaper.getPId());
			pstmt.setString(7, exampaper.getPName());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("添加试卷失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	public ExamPaper findExamByPid(String id) throws DaoException {
		String sql = "select e_id, e_name, e_type, e_pic, e_content, e_answer, p_id, p_name, e_course from exampaper where e_id = ?";
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
				examPaper.setEAnswer(rs.getString("e_answer"));
				examPaper.setEContent(rs.getString("e_content"));
				examPaper.setEId(Integer.parseInt(rs.getString("e_id")));
				examPaper.setEName(rs.getString("e_name"));
				examPaper.setEType(rs.getString("e_type"));
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

	public void modifyExamPaper(ExamPaper exampaper) throws DaoException {
		String sql = "update exampaper set e_answer = ?, e_content = ?,e_course = ?,e_name = ?,e_type = ?,p_id = ?,p_name = ? where e_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exampaper.getEAnswer());
			pstmt.setString(2, exampaper.getEContent());
			pstmt.setString(3, exampaper.getECourse());
			pstmt.setString(4, exampaper.getEName());
			pstmt.setString(5, exampaper.getEType());
			pstmt.setString(6, exampaper.getPId());
			pstmt.setString(7, exampaper.getPName());
			pstmt.setInt(8, exampaper.getEId());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("修改试题失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	public void deleteExamPaperById(String id) throws DaoException {
		String sql = "delete from exampaper where e_id=?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("删除试题失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	@Override
	public ExamPaper findExamPaperByPaperIdAndTimuId(String pId, String timuId) {
		// TODO Auto-generated method stub
		return null;
	}
}
