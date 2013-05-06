package com.fe.ems.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.fe.ems.util.DB;

public class RegisterManager {
	
	//学生属性的声明
	private String id="",s_name="",s_sex="",s_password="",s_classes="",s_department="",s_grade="",s_pic="",s_phone="",s_email="",s_age="";
	//用来判别注册成功与否的标志 false为失败，true为成功。
	private boolean registerstates = false;

	//乱码转换方法
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("gbk");
			s = new String(bb);
		}
		catch(Exception e){}
		return s;
	}
	
	// 属性的get() 和set()方法
	public boolean isRegisterstates() {
		return registerstates;
	}
	public void setRegisterstates(boolean registerstates) {
		this.registerstates = registerstates;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = handleString(handleString(id));
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
	 * 用来处理学生注册的信息，填写无误，写入数据库，否则提示错误
	 * @backNews
	 * @boo
	 * @author 刘晔
	 */
	String backNews;//注册反馈信息（成功与否）
	public void registerManager()
	{
		if(id == null)
		{
			id="";
		}
		if(s_password == null)
		{
			s_password ="";
		}
		/*boolean isLD = true;
		for(int i=0; i<id.length(); i++)
		{
			char c = id.charAt(i);
			if(!((c <= 'z' && c >= 'a') || (c <='Z' && c >= 'A') || (c <='9' && c >= '0')))
			{
				isLD = false;
			}
		}*/
		
		boolean boo = false;//判断账号和密码是否为空
		if(id.length()>0 && s_password.length()>0)
		{
			boo = true;
		}
		else{
			boo = false;
			backNews = "账号或密码为空，请认真填写！";
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = DB.getConnection();
			String insertCondition = "INSERT INTO student (s_id,s_password,s_name,s_sex,s_age,s_classes,s_department,s_grade,s_phone,s_email,s_pic) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(insertCondition);
			if(boo)
			{
				pstmt.setString(1, id);
				pstmt.setString(2, s_password);
				pstmt.setString(3,s_name);
				pstmt.setString(4, s_sex);
				pstmt.setString(5, s_age);
				pstmt.setString(6, s_classes);
				pstmt.setString(7, s_department);
				pstmt.setString(8, s_grade);
				pstmt.setString(9, s_phone);
				pstmt.setString(10, s_email);
				pstmt.setString(11, s_pic);
				int m = pstmt.executeUpdate();
				if(m != 0)
				{
					backNews = "注册成功,请返回到登陆页面进行登陆！";
					this.registerstates = true;
					this.id = "";
					this.s_name = "";
					this.s_password = "";
				}
			}
			else
			{
				backNews = "信息填写不完整或名字中有非法字符,请重新填写！";
				this.registerstates = false;
			}
		}
		catch(SQLException exp)
		{
			backNews = "该学号已被人使用！如果确认自己学号被他人使用，请与教师联系。";
			this.registerstates = false;
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
	}
}
