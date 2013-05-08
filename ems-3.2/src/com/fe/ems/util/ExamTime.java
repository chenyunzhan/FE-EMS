package com.fe.ems.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ems.fe.basedata.dao.impl.MessDao4SQLServerImpl;
import com.ems.fe.basedata.model.Mess;
import com.ems.fe.basedata.service.MessService;
import com.ems.fe.util.InitService;
import com.fe.*;
import com.fe.ems.model.PaperModel;

public class ExamTime {
	
	private String[] str = new String[100];//���������������ʱ�����û��Ĵ𰸡�
	private boolean preventfresh = true; 
	private String p_id = "";
	
	MessService messService = new InitService().getMessService();
	
	public void setElement(int i,String string){
		str[i] = string;
	}
	public String[] getStr() {
		return str;
	}
	public void setStr(String[] str) {
		this.str = str;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public boolean isPreventfresh() {
		return preventfresh;
	}
	public void setPreventfresh(boolean preventfresh) {
		this.preventfresh = preventfresh;
	}

	/**
	 * ����û�����ʣ��ʱ��
	 * @param id
	 * @return
	 */
	public String  getTimeLeft(String id,String p_id)
	{
		Mess mess = messService.findUserProtectMess(id, p_id);
		return mess.getTimeout() + "";
		/**
		 * 
		String time = "";
		String sql = "select timeout from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				time = rs.getString(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return time;
		 */
	}
	
	/**
	 * ��ñ�����Ϣ��monistates״̬
	 * @param id
	 * @return
	 */
	public int getMonistates(String id,String p_id)
	{
		Mess mess = messService.findUserProtectMess(id, p_id);
		return mess.getMonistates();
		/**
		 * 
		int monistates = 0;
		String sql = "select monistates from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				monistates = rs.getInt(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return monistates;
		 */
	}	
	
	/**
	 * �����û�����ʣ��ʱ��
	 * @param timeout
	 * @param id
	 */
	public void setTimeLeft(int timeout,String id,String p_id){
		
		
		Mess mess = messService.findUserProtectMess(id, p_id);
		messService.modifyUserProtectMess(mess.getS_id(), mess.getP_id(), timeout, mess.getAnswer(), mess.getAllowstates(), mess.getMonistates(), mess.getTimuId());
		/**
		 * 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set timeout=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setInt(1, timeout);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		 */
	}
	
	/**
	 * ��ȡ�û��𰸡�
	 * @param id
	 * @return
	 */
	public String getAnswer(String id,String p_id)
	{
		Mess mess = messService.findUserProtectMess(id, p_id);
		return mess.getAnswer();
		/**
		 * 
		String answer = "";
		String sql = "select answer from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				answer = rs.getString(1);
				if(answer.length() >= 2){
					answer = answer.substring(0, answer.length()-2);
				}
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return answer;
		 */
	}
	
	/**
	 * �����û��𰸡�
	 * @param answer
	 * @param id
	 */
	public void setAnswer(String[] answer,String id,String p_id){
		StringBuffer answerbuffer = new StringBuffer();
		for(int i=0; i<answer.length; i++){
			if(answer[i] != null && i<answer.length-1){
				answerbuffer.append(answer[i] + "##");
			}
		}
		String answers = answerbuffer.toString();
		System.out.println("�ύ�����ݿ��еĴ�Ϊ��" + answers);
		Mess mess = messService.findUserProtectMess(id, p_id);
		messService.modifyUserProtectMess(mess.getS_id(), mess.getP_id(), mess.getTimeout(), answers, mess.getAllowstates(), mess.getMonistates(), mess.getTimuId());
		/**
		 * 
		StringBuffer answerbuffer = new StringBuffer();
		for(int i=0; i<answer.length; i++){
			if(answer[i] != null && i<answer.length-1){
				answerbuffer.append(answer[i] + "##");
			}
		}
		String answers = answerbuffer.toString();
		System.out.println("�ύ�����ݿ��еĴ�Ϊ��" + answers);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set answer=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setString(1, answers);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		 */
	}
	
	/**
	 * ����û�����Ȩ��
	 * @param id
	 * @return
	 */
	public static int  getAllowstates(String id,String p_id,int monistates)
	{
		Mess mess = new MessDao4SQLServerImpl().findUserProtectMess(id, p_id);
		return mess == null ? 0 : mess.getAllowstates();
		/**
		 * 
		int allowstates = 0;
		String sql = "select allowstates from messageprotect where s_id=? and p_id=? and monistates=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			pstmt.setInt(3, monistates);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				allowstates = rs.getInt(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return allowstates;
		 */
	}
	
	/**
	 * �����û�����Ȩ��
	 * @param allowstates
	 * @param id
	 */
	public void setAllowstates(int allowstates,String id,String pid){
		Mess mess = messService.findUserProtectMess(id, p_id);
		messService.modifyUserProtectMess(mess.getS_id(), mess.getP_id(), mess.getTimeout(), mess.getAnswer(), allowstates, mess.getMonistates(), mess.getTimuId());
		/**
		 * 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set allowstates=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setInt(1, allowstates);
			pstmt.setString(2, id);
			pstmt.setString(3, pid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		 */
	}
	
	/**
	 * ��ѯ���ݿ����Ƿ�����û��ı�����Ϣ�������ڣ�����false�����ڷ���true��
	 * @param s_id
	 * @param p_id
	 * @return
	 */
	public static boolean getUserProtectMess(String s_id, String p_id,int monistates){
		
		boolean exist = true;
		String pid = "";
		if(p_id.length() == 6){
			pid = p_id.substring(0,p_id.length()-1) + "%";
		}
		if(p_id.length() == 7){
			pid = p_id.substring(0,p_id.length()-2) + "%";
		}
		
		Mess mess = new MessDao4SQLServerImpl().findUserProtectMess(s_id, p_id);
		if(mess == null) {
			exist = false;
		}else{
			exist = true;
		}
		return exist;
		/**
		 * 
		boolean exist = true;
		String pid = "";
		if(p_id.length() == 6){
			pid = p_id.substring(0,p_id.length()-1) + "%";
		}
		if(p_id.length() == 7){
			pid = p_id.substring(0,p_id.length()-2) + "%";
		}
		
		String sql = "select * from messageprotect where s_id=? and p_id like ? and monistates=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.setString(2, pid);
			pstmt.setInt(3, monistates);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				exist = true;
			}
			else
			{
				exist = false;
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
			exist = false;
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return exist;
		 */
	}
	
	
	/**
	 * ��ѯ���ݿ����Ƿ�����û��ı�����Ϣ�������ڣ�����false�����ڷ���true��
	 * @param s_id
	 * @param p_id
	 * @return
	 */
	public boolean getUserProtectMess(String s_id){
		
		boolean exist = true;
		String sql = "select * from messageprotect where s_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				exist = true;
			}
			else
			{
				exist = false;
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
			exist = false;
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return exist;
	}
	
	
	/**
	 * �����ݿ�������û�������Ϣ��
	 * @param s_id
	 * @param p_id
	 * @param timeout
	 * @param answer
	 * @param allowstates
	 */
	public void addUserProtectMess(String s_id,String p_id,int timeout,String answer,int allowstates,int monistates){
		messService.addUserProtectMess(s_id, p_id, timeout, answer, allowstates, monistates, "");
		/**
		 * 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = DB.getConnection();
			String insertCondition = "INSERT INTO messageprotect (s_id,p_id,timeout,answer,allowstates,monistates) VALUES (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(insertCondition);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			pstmt.setInt(3,timeout);
			pstmt.setString(4, answer);
			pstmt.setInt(5, allowstates);
			pstmt.setInt(6, monistates);
			int m = pstmt.executeUpdate();
			if(m != 0)
			{
			}
			else
			{
				System.out.println("ѧ�����Ա�����Ϣ����ʧ�ܣ�");
			}
		}
		catch(SQLException exp)
		{
		}
		finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		 */
	}
	
	/**
	 * ��ȡ������ʾ˳������顣
	 * @param id
	 * @return
	 */
	public int[]  gettimuId(String id,String p_id)
	{
		Mess mess = messService.findUserProtectMess(id, p_id);
		String timuid = mess.getTimuId();
		int[] timu = new int[100];
		if(timuid.length() >= 2){
			String[] str = timuid.substring(0, timuid.length()-2).split("--");
			for(int i=0; i<str.length; i++){
				timu[i] = Integer.parseInt(str[i]);
			}
		}
		return timu;
		/**
		 * 
		int[] timu = new int[100];
		String timuid = "";
		String sql = "select timuId from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{	
				//���������ַ���ĩβ����-��ȥ��
				timuid = rs.getString(1);
				if(timuid.length() >= 2){
					String[] str = timuid.substring(0, timuid.length()-2).split("--");
					for(int i=0; i<str.length; i++){
						timu[i] = Integer.parseInt(str[i]);
					}
				}
				
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return timu;
		 */
	}
	
	/**
	 * ������Ŀ˳�����飬�������ַ�������ʽ�������ݿ��
	 * @param answer
	 * @param id
	 */
	public void settimuId(int[] timuid,String id,String p_id){
		StringBuffer timuidbuffer = new StringBuffer();
		for(int i=0; i<timuid.length; i++){
			if(timuid[i] != 0 && i<timuid.length-1){
				timuidbuffer.append(timuid[i] + "--");
			}
		}
		String array = timuidbuffer.toString();
		Mess mess = messService.findUserProtectMess(id, p_id);
		messService.modifyUserProtectMess(mess.getS_id(), mess.getP_id(), mess.getTimeout(), mess.getAnswer(), mess.getAllowstates(), mess.getMonistates(), array);
		//System.out.println("�ύ�����ݿ��еĴ�Ϊ��" + answers);
		/**
		 * 
		StringBuffer timuidbuffer = new StringBuffer();
		for(int i=0; i<timuid.length; i++){
			if(timuid[i] != 0 && i<timuid.length-1){
				timuidbuffer.append(timuid[i] + "--");
			}
		}
		String array = timuidbuffer.toString();
		//System.out.println("�ύ�����ݿ��еĴ�Ϊ��" + answers);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set timuId=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setString(1, array);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		 */
	}
	
	/**
	 * ����û������Ծ��p_id
	 * @param id
	 * @return
	 */
	public static String getP_id(String id,int monistates)
	{
		//Mess mess = new InitService().getMessService().findUserProtectMessByUserId(id, monistates);
		Mess mess = new MessDao4SQLServerImpl().findUserProtectMessByUserId(id, monistates);
		return mess == null ? "" : mess.getP_id();
		/**
		 * 
		String pid = "";
		String sql = "select p_id from messageprotect where s_id=? and monistates=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, monistates);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				pid = rs.getString(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return pid;
		 */
	}	
	
	/**
	 * ɾ���û��ı�����Ϣ
	 */
	public void deleteUserProtectMess(String s_id,String p_id){
		messService.deleteUserProtectMess(s_id, p_id);
		/**
		 * 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = DB.getConnection();
			String insertCondition = "DELETE FROM messageprotect WHERE s_id=? AND p_id=?";
			pstmt = conn.prepareStatement(insertCondition);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			int m = pstmt.executeUpdate();
			if(m != 0)
			{
			}
			else
			{
			}
		}
		catch(SQLException exp)
		{
		}
		finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
		 */
	}
}
