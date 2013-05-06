package com.fe.ems.manager;

import java.sql.*;

import com.fe.ems.util.DB;

public class UserInfoManager {
	
	//ѧ�����Ե�����
	private String s_name="",s_sex="",s_password="",s_classes="",s_department="",s_grade="",s_pic="",s_phone="",s_email="",s_age="";
	//
	private boolean infoUpdataStates = false;
	private boolean infoUpdataStatesPassword = false;
	//�����������
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("gbk");
			s = new String(bb);
		}
		catch(Exception e){}
		return s;
	}
	//���Ե�get()��set()����
	public boolean isInfoUpdataStates() {
		return infoUpdataStates;
	}
	public void setInfoUpdataStates(boolean infoUpdataStates) {
		this.infoUpdataStates = infoUpdataStates;
	}
	public boolean isInfoUpdataStatesPassword() {
		return infoUpdataStatesPassword;
	}
	public void setInfoUpdataStatesPassword(boolean infoUpdataStatesPassword) {
		this.infoUpdataStatesPassword = infoUpdataStatesPassword;
	}
	public String getS_department() {
		return s_department;
	}
	public void setS_department(String s_department) {
		this.s_department = handleString(s_department);
	}
	public String getS_grade() {
		return s_grade;
	}
	public void setS_grade(String s_grade) {
		this.s_grade = handleString(s_grade);
	}
	public String getS_pic() {
		return s_pic;
	}
	public void setS_pic(String s_pic) {
		this.s_pic = handleString(s_pic);
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = handleString(s_phone);
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = handleString(s_email);
	}
	public String getS_age() {
		return s_age;
	}
	public void setS_age(String s_age) {
		this.s_age = handleString(s_age);
	}
	public String getS_password() {
		return s_password;
	}
	public void setS_password(String s_password) {
		this.s_password = handleString(s_password);
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = handleString(s_name);
	}
	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = handleString(s_sex);
	}
	public String getS_classes() {
		return s_classes;
	}
	public void setS_classes(String s_classes) {
		this.s_classes = handleString(s_classes);
	}
	public String getBackNews() {
		return backNews;
	}
	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	
	
	/**
	 * ��������ѧ�����µ���Ϣ����д����д�����ݿ⣬������ʾ����
	 * @
	 */
	String backNews; //�û�������Ϣ���
	public void infoUpdata(String s_id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update student set s_name=?,s_sex=?,s_age=?,s_classes=?,s_department=?,s_grade=?,s_phone=?,s_email=?,s_pic=? where s_id=?";
			pstmt = conn.prepareStatement(condition);
			
			pstmt.setString(1, this.s_name);
			pstmt.setString(2, this.s_sex);
			pstmt.setString(3, this.s_age);
			pstmt.setString(4, this.s_classes);
			pstmt.setString(5, this.s_department);
			pstmt.setString(6, this.s_grade);
			pstmt.setString(7, this.s_phone);
			pstmt.setString(8, this.s_email);
			pstmt.setString(9, this.s_pic);
			pstmt.setString(10, s_id);
			int i = pstmt.executeUpdate();
			if(i != 0)
			{
				infoUpdataStates = true;
				backNews = "��Ϣ�޸ĳɹ���";
			}
			else
			{
				infoUpdataStates = false;
				backNews = "��Ϣ�޸�ʧ�ܣ���";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			infoUpdataStates = false;
			backNews = "�û���Ϣ����ʧ�ܣ�����������¸��£�";
			
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	//���ط���infoUpdata����
	
	public void infoUpdata(String s_id,String password)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update student set s_password=? where s_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setString(1, password);
			pstmt.setString(2, s_id);
			int i = pstmt.executeUpdate();
			if(i != 0)
			{
				infoUpdataStatesPassword = true;
				backNews = "�����޸ĳɹ���";
			}
			else
			{
				infoUpdataStatesPassword = false;
				backNews = "�����޸�ʧ�ܣ���";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			infoUpdataStatesPassword = false;
			backNews = "�û���Ϣ����ʧ�ܣ�����������¸��£�";
			
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public void showUserInfo(String s_id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String condition1 = "select * from student where s_id=?";
			pstmt = conn.prepareStatement(condition1);
			pstmt.setString(1, s_id);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				this.s_password   = rs.getString("s_password");
				this.s_name       = rs.getString("s_name");
				this.s_sex        = rs.getString("s_sex");
				this.s_age        = rs.getString("s_age"); 
				this.s_classes    = rs.getString("s_classes");
				this.s_department = rs.getString("s_department");
				this.s_grade      = rs.getString("s_grade");
				this.s_phone      = rs.getString("s_phone");
				this.s_email      = rs.getString("s_email");
				this.s_pic        = rs.getString("s_pic");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
	}
}
