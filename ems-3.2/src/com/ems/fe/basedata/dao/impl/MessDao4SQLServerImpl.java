package com.ems.fe.basedata.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ems.fe.basedata.dao.MessDao;
import com.ems.fe.basedata.model.Mess;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.ConnectionManager;

public class MessDao4SQLServerImpl implements MessDao{

	@Override
	public void addUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId) throws DaoException {
		String sql = "insert into messageprotect(s_id, p_id, timeout, answer, allowstates, monistates, timuId) values(?, ?, ?, ?, ?, ?, ?)";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			pstmt.setInt(3, timeout);
			pstmt.setString(4, answer);
			pstmt.setInt(5, allowstates);
			pstmt.setInt(6, monistates);
			pstmt.setString(7, timuId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("Ìí¼Ó³É¼¨Ê§°Ü£¡");
		}finally{
			ConnectionManager.close(pstmt);
		}
		
	}

	@Override
	public void deleteUserProtectMess(String s_id, String p_id)
			throws DaoException {
		String sql = "delete from messageprotect where s_id=? and p_id=?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("É¾³ý³É¼¨Ê§°Ü£¡");
		}finally{
			ConnectionManager.close(pstmt);
		}
		
	}

	@Override
	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId) throws DaoException {
		String sql = "update messageprotect set timeout = ?, answer = ?, allowstates = ?, monistates = ?, timuId = ? where s_id = ? and p_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, s_id);
			pstmt.setString(7, p_id);
			pstmt.setInt(1, timeout);
			pstmt.setString(2, answer);
			pstmt.setInt(3, allowstates);
			pstmt.setInt(4, monistates);
			pstmt.setString(5, timuId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("ÐÞ¸Ä³É¼¨Ê§°Ü£¡");
		}finally{
			ConnectionManager.close(pstmt);
		}		
		
	}

	@Override
	public Mess findUserProtectMess(String s_id, String p_id)
			throws DaoException {
		String sql = "select * from messageprotect where s_id = ? and p_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Mess mess = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				mess = new Mess();
				mess.setAllowstates(rs.getInt("allowstates"));
				mess.setAnswer(rs.getString("answer"));
				mess.setMonistates(rs.getInt("monistates"));
				mess.setP_id(rs.getString("p_id"));
				mess.setS_id(rs.getString("s_id"));
				mess.setTimeout(rs.getInt("timeout"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException(e);
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return mess;
	}

	@Override
	public Mess findUserProtectMessByUserId(String id, int monistates)
			throws DaoException {
		String sql = "select * from messageprotect where s_id = ? and monistates = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Mess mess = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, monistates);
			rs = pstmt.executeQuery();
			if(rs.next()){
				mess = new Mess();
				mess.setAllowstates(rs.getInt("allowstates"));
				mess.setAnswer(rs.getString("answer"));
				mess.setMonistates(rs.getInt("monistates"));
				mess.setP_id(rs.getString("p_id"));
				mess.setS_id(rs.getString("s_id"));
				mess.setTimeout(rs.getInt("timeout"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException(e);
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return mess;
	}

}
