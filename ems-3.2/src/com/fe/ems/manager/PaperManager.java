package com.fe.ems.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fe.*;
import com.fe.ems.model.PaperModel;
import com.fe.ems.util.DB;


public class PaperManager {
		
		private int totalTypeRecords;
		private List list;
		private int totalRecords;
		private int pageSize;
		private int pageNo;
		private boolean addQuestionState=false;
		
		
		public String handleString(String s){
			try{
				byte bb[] = s.getBytes("ISO-8859-1");
				s = new String(bb);
			}
			catch(Exception e){}
			return s;
		} 
		
		public int getTotalTypeRecords() {
			return totalTypeRecords;
		}
		public void setTotalTypeRecords(int totalTypeRecords) {
			this.totalTypeRecords = totalTypeRecords;
		}
		public int getPageNo() {
			return pageNo;
		}
		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}
		public int getTotalPages(){
			return (this.totalRecords + this.pageSize - 1)/this.pageSize;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getTotalRecords() {
			return totalRecords;
		}
		public void setTotalRecords(int totalRecords) {
			this.totalRecords = totalRecords;
		}
		public List getList() {
			return list;
		}
		public void setList(List list) {
			this.list = list;
		}
		
		public void addPaper(PaperModel paper){
			String sql = "insert into exampaper(e_id,e_name, p_id, p_name, e_course, e_content, e_answer, e_type, e_pic) " +
			"values(?, ?, ?, ?, ?, ?, ?, ?,?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paper.getId());
				pstmt.setString(2, paper.getName());
				pstmt.setString(3, paper.getP_id());
				pstmt.setString(4, paper.getP_name());
				pstmt.setString(5, paper.getCourse());
				pstmt.setString(6, paper.getContent());
				pstmt.setString(7, paper.getAnswer());
				pstmt.setString(8, paper.getType());
				pstmt.setString(9, paper.getE_pic());
				pstmt.executeUpdate();
			}catch(SQLException e) {
				/*System.err.println("添加试题失败" + e);
				e.printStackTrace();*/
			}finally {
				DB.close(pstmt);
				DB.close(conn);
			} 
		}
		
		public void editPaper(PaperModel paper){
			String sql = "update exampaper set e_id=?,e_name=?,p_id=?,p_name=?,e_course=?,e_content=?,e_answer=?,e_type=?,e_pic=? where e_id=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paper.getId());
				pstmt.setString(2, paper.getName());
				pstmt.setString(3, paper.getP_id());
				pstmt.setString(4, paper.getP_name());
				pstmt.setString(5, paper.getCourse());
				pstmt.setString(6, paper.getContent());
				pstmt.setString(7, paper.getAnswer());
				pstmt.setString(8, paper.getType());
				pstmt.setString(9, paper.getE_pic());
				pstmt.setString(10, paper.getId());
				pstmt.executeUpdate();
			}catch(SQLException e) {
				//log4j
				System.err.println("添加试题失败" + e);
				e.printStackTrace();
			}finally {
				DB.close(pstmt);
				DB.close(conn);
			} 
		}
		
		public void deletePaper(String id){
			String sql = "delete from exampaper where e_id=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, handleString(id));
				pstmt.executeUpdate();
			}catch(SQLException e) {
				//log4j
				System.err.println("删除试题失败" + e);
				e.printStackTrace();
			}finally {
				DB.close(pstmt);
				DB.close(conn);
			} 
		}
		
		public PaperModel findPaperById(String p_id,String e_name) {
			String sql = "select * from exampaper where p_id=? and e_name=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			PaperModel paper = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				pstmt.setString(2, e_name);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					paper = new PaperModel();
					//paper.setId(rs.getString("e_id"));
					//paper.setName(rs.getString("e_name"));
					//paper.setP_id(rs.getString("p_id"));
					//paper.setP_name("p_name");
					//paper.setCourse(rs.getString("e_course"));
					paper.setContent(rs.getString("e_content"));
					//System.out.println(rs.getString("e_content"));
					paper.setAnswer(rs.getString("e_answer"));
					paper.setType(rs.getString("e_type"));
					//paper.setE_pic(rs.getString("e_pic"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			} 
			return paper;
		}
		
		public boolean addQuestionResult(String paperId){
			String sql = "select * from exampaper where e_id=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			PaperModel paper = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paperId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					this.addQuestionState=false;
				}
				else{
					this.addQuestionState=true;
				}
			}catch(SQLException e) {
				e.printStackTrace();
				this.addQuestionState=false;
			}finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			} 
			
			return addQuestionState;
		}
		
	/*	
		public Paper findPaperByIdAndType(String paperId, String paperType) {
			String sql = "select * from exampaper where id = ? and type = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Paper paper = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paperId);
				pstmt.setString(2, paperType);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					paper = new Paper();
					paper = new Paper();
					paper.setId(rs.getString("id"));
					paper.setName(rs.getString("name"));
					paper.setCourse(rs.getString("course"));
					paper.setContent(rs.getString("content"));
					paper.setAnswer(rs.getString("answer"));
					paper.setType(rs.getString("type"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			} 
			return paper;
		}
		
	*/
		public PaperModel findPaperByType(String paperType) {
			String sql = "select * from exampaper where e_type=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			PaperModel paperModel = null;
			ResultSet rs = null;
			PaperModel paper = null;
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paperType);
				List paperList = new ArrayList();
				rs = pstmt.executeQuery();
				while (rs.next()) {
					paper = new PaperModel();
					paper.setId(rs.getString("e_id"));
					paper.setName(rs.getString("e_name"));
					paper.setP_id(rs.getString("p_id"));
					paper.setP_name("p_name");
					paper.setCourse(rs.getString("e_course"));
					paper.setContent(rs.getString("e_content"));
					paper.setAnswer(rs.getString("e_answer"));
					paper.setType(rs.getString("e_type"));
					paper.setE_pic(rs.getString("e_pic"));
					paperList.add(paper);
				}
				this.setList(paperList);
				this.setTotalTypeRecords(getTotalTypeRecords(conn, paperType));
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			} 
			return paperModel;
		}
		
		
		/**
		 * 分页查询
		 * @param pageNo
		 * @param pageSize
		 * @return
		 */
		public void findAllPaper(int pageNo, int pageSize, String p_id) throws ClassNotFoundException {
			StringBuffer sbSql = new StringBuffer();
			sbSql.append("select * from exampaper where p_id=?");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			PaperModel paperModel = null;
			
			try {
				conn = DB.getConnection();
				pstmt = conn.prepareStatement(sbSql.toString());
				pstmt.setString(1, p_id);
				//pstmt.setInt(1, pageNo * pageSize);
				//pstmt.setInt(2, (pageNo -1)*pageSize);
				rs = pstmt.executeQuery();
				List paperList = new ArrayList();
				while (rs.next()) {
					PaperModel paper = new PaperModel();
					paper.setId(rs.getString("e_id"));
					paper.setName(rs.getString("e_name"));
					/*paper.setP_id(rs.getString("p_id"));
					paper.setP_name("p_name");
					paper.setCourse(rs.getString("e_course"));
					paper.setContent(rs.getString("e_content"));
					paper.setAnswer(rs.getString("e_answer"));
					paper.setType(rs.getString("e_type"));
					paper.setE_pic(rs.getString("e_pic"));*/
					paperList.add(paper);
				}
				paperModel = new PaperModel();
				this.setPageSize(pageSize);
				this.setPageNo(pageNo);
				this.setList(paperList);
				this.setTotalRecords(getTotalRecords(conn,p_id));
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			} 
		}
		
		/**
		 * 取得总记录数
		 * @param conn
		 * @return
		 */
		private int getTotalRecords(Connection conn,String p_id) 
		throws SQLException {
			String sql = "select count(*) from exampaper where p_id=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int totalRecords = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				rs = pstmt.executeQuery();
				rs.next();
				totalRecords = rs.getInt(1);
			}finally {
				DB.close(rs);
				DB.close(pstmt);
			}
			return totalRecords;
		}
		
		private int getTotalTypeRecords(Connection conn, String paperType) 
		throws SQLException {
			String sql = "select count(*) from exampaper where e_type = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int totalRecords = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paperType);
				rs = pstmt.executeQuery();
				rs.next();
				totalRecords = rs.getInt(1);
			}finally {
				DB.close(rs);
				DB.close(pstmt);
			}
			return totalRecords;
		}
	}