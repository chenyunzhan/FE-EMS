package com.ems.fe.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionManager {

	private static ThreadLocal connectionHolder = new ThreadLocal();
	
	
	private static Properties p = new Properties();
	
	static {
		InputStream is = null;
		is = ConnectionManager.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			p.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(null != is) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * ȡ��Connection
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = (Connection)connectionHolder.get();
		if (conn == null) {
			try {
				
				Class.forName(p.getProperty("driver"));
				conn = DriverManager.getConnection(p.getProperty("url"), p.getProperty("username"), p.getProperty("password"));
				//�ŵ�ThreadLocal��
				connectionHolder.set(conn);
			} catch (ClassNotFoundException e) {
				//��¼��־
				e.printStackTrace();
				//throw new DBException();
			} catch (SQLException e) {
				//��¼��־
				e.printStackTrace();
				//throw new DBException();
			}
		}
		return conn;
	}
	
	/**
	 * �ر�Connection
	 */
	public static void closeConnection() {
		Connection conn = (Connection)connectionHolder.get();
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connectionHolder.remove();
		}
	}
	/**
	 * �ر�PreparedStatement
	 * @param pstmt
	 */
	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * �ر�ResultSet
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
