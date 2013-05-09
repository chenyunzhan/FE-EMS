package com.fe.ems.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.service.ExamService;
import com.ems.fe.basedata.service.ScoreService;
import com.ems.fe.basedata.service.StudentService;
import com.ems.fe.util.InitService;
import com.fe.*;
import com.fe.ems.model.UserModel;
import com.fe.ems.util.DB;

public class UserManager {
	private List list;
	private int totalRecords;
	private int pageSize;
	private int pageNo;
	
	ScoreService scoreService = new InitService().getScoreService();
	
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("ISO-8859-1");
			s = new String(bb);
		}
		catch(Exception e){}
		return s;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int addUser(UserModel userModel){
		String sql = "update student set s_id=?, s_password=?, s_name=?, s_sex=? ,s_classes=? where s_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int adduserresult = 0;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, handleString(userModel.getId()));
			pstmt.setString(2, handleString(userModel.getS_password()));
			pstmt.setString(3, handleString(userModel.getS_name()));
			pstmt.setString(4, handleString(userModel.getS_sex()));
			pstmt.setString(5, handleString(userModel.getS_classes()));
			pstmt.setString(6, handleString(userModel.getId()));
			adduserresult = pstmt.executeUpdate();
		}catch(SQLException e) {
			//log4j
			System.err.println("用户信息修改失败");
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		return adduserresult;
	}
	
	public void modifyScore(UserModel user,String p_id) {
		
		Score score = new Score();
		score.setPaperId(p_id);
		score.setStudentId(user.getId());
		score.setScore(user.getScore());
		scoreService.addScore(score);
		
		
		/**
		 * 
		String sql = "INSERT INTO score VALUES (?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, user.getId());
			pstmt.setInt(3, user.getScore());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		 */
	}
	
	public void findAllUser(int pageNo, int pageSize,int checkstates) {
		
		String sbSql1 = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DB.getConnection();
			if(checkstates == 1){
				sbSql1 = "select * from student order by s_grade,s_department,s_classes";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else if(checkstates == 4){
				sbSql1 = "select * from student order by s_id";
				pstmt = conn.prepareStatement(sbSql1);
			}
			
			/*pstmt.setInt(1,pSe);
			pstmt.setInt(2,(pNo -1)*pSe);*/
			rs = pstmt.executeQuery();
			List userList = new ArrayList();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getString("s_id"));
				user.setS_password(rs.getString("s_password"));
				user.setS_name(rs.getString("s_name"));
				user.setS_sex(rs.getString("s_sex"));
				user.setS_age(rs.getString("s_age"));
				user.setS_classes(rs.getString("s_classes"));
				user.setS_department(rs.getString("s_department"));
				user.setS_grade(rs.getString("s_grade"));
				user.setS_phone(rs.getString("s_phone"));
				user.setS_email(rs.getString("s_email"));
				user.setS_pic(rs.getString("s_pic"));
				userList.add(user);
			}
			this.setPageSize(pageSize);
			this.setPageNo(pageNo);
			this.setList(userList);
			this.setTotalRecords(getTotalRecords(conn));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
	}
	
	
	public void findAllUserScore(int pageNo, int pageSize,int checkstates) {

		String sbSql1 = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DB.getConnection();
			
			if(checkstates == 1){
				sbSql1 = "select * from score_view order by s_grade,s_department,s_classes";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else if(checkstates == 2){
				sbSql1 = "select * from score_view where score=60";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else if(checkstates == 3){
				sbSql1 = "select * from score_view where score<60";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else if(checkstates == 4){
				sbSql1 = "select * from score_view order by score asc";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else  if(checkstates == 0){
				sbSql1 = "select * from score_view";
				pstmt = conn.prepareStatement(sbSql1);
			}
			else if(checkstates == 70 || checkstates == 80 || checkstates == 90){
				sbSql1 = "select * from score_view where score>=?";
				pstmt = conn.prepareStatement(sbSql1);
				pstmt.setInt(1, checkstates);
			}
			/*pstmt.setInt(1,pSe);
			pstmt.setInt(2,(pNo -1)*pSe);*/
			rs = pstmt.executeQuery();
			List userList = new ArrayList();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setS_name(rs.getString("s_name"));
				user.setScore(rs.getInt("score"));
				user.setS_classes(rs.getString("s_classes"));
				user.setS_department(rs.getString("s_department"));
				user.setS_grade(rs.getString("s_grade"));
				userList.add(user);
			}
			this.setPageSize(pageSize);
			this.setPageNo(pageNo);
			this.setList(userList);
			this.setTotalRecords(getTotalRecords(conn));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
	}
	
	public void deleteUser(String id){
		String sql = "delete from student where s_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			//log4j
			System.err.println("删除用户失败" + e);
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
	}	
	
	/**
	 * 取得总记录数
	 * @param conn
	 * @return
	 */
	private int getTotalRecords(Connection conn) throws SQLException {
		String sql = "select count(*) from student";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalRecords = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalRecords = rs.getInt(1);
		}finally {
			DB.close(rs);
			DB.close(pstmt);
		}
		return totalRecords;
	}
	
	public int passRecords(int checkstates){
		String sql = "select count(*) from score_view where score>=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalRecords = 0;
		Connection conn = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, checkstates);
			rs = pstmt.executeQuery();
			rs.next();
			totalRecords = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		return totalRecords;
	}
	
	public int notpassRecords(){
		String sql = "select count(*) from score_view where score<60";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalRecords = 0;
		Connection conn = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalRecords = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		return totalRecords;
	}
	
}
