package com.ems.fe.basedata.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ems.fe.basedata.dao.ScoreDao;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.ConnectionManager;

public class ScoreDao4SQLServerImpl implements ScoreDao{

	@Override
	public void addScore(Score score) {
		String sql = "INSERT INTO score VALUES (?,?,?)";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score.getPaperId());
			pstmt.setString(2, score.getStudentId());
			pstmt.setInt(3, score.getScore());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("Ìí¼Ó³É¼¨Ê§°Ü£¡");
		}finally{
			ConnectionManager.close(pstmt);
		}
		
	}

}
