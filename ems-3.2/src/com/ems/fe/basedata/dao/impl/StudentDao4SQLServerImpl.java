package com.ems.fe.basedata.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.dao.StudentDao;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.ConnectionManager;
import com.fe.ems.util.Login;
/**
 * 学生Dao层实现
 * @author 陈云展
 *
 */
public class StudentDao4SQLServerImpl implements StudentDao {

	public List findAllStudent(int pageNo, int pageSize, String gra, String dep,
			String cla) throws DaoException {
		String sql = "select top " + pageSize  +" * from student where s_id not in (select top " + pageSize*(pageNo-1) + " s_id from student order by s_id) order by s_id";
		if(gra != null && !"".equals(gra)){
			sql = "select top " + pageSize  +" * from student where s_id like '"+ gra +"%' and (s_id not in (select top " + pageSize*(pageNo-1) + " s_id" + 
			" from student where s_id like '"+ gra +"%' order by s_id))";
		}
		if(gra != null && !"".equals(gra) && dep != null && !"".equals(dep)){
			sql = "select top " + pageSize  +" * from student where s_id like '"+ gra + dep +"%' and (s_id not in (select top " + pageSize*(pageNo-1) + " s_id" + 
			" from student where s_id like '"+ gra + dep +"%' order by s_id))";
		}
		if(gra != null && !"".equals(gra) && dep != null && !"".equals(dep) && cla != null && !"".equals(cla)){
			sql = "select top " + pageSize  +" * from student where s_id like '"+ gra + dep + cla +"%' and (s_id not in (select top " + pageSize*(pageNo-1) + " s_id" + 
			" from student where s_id like '"+ gra + dep + cla +"%' order by s_id))";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List studentList = new ArrayList();
		try {
			Connection conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setSId(rs.getString("s_id"));
				student.setSAge(rs.getString("s_age"));
				student.setSClasses(rs.getString("s_classes"));
				student.setSDepartment(rs.getString("s_department"));
				student.setSEmail(rs.getString("s_email"));
				student.setSGrade(rs.getString("s_grade"));
				student.setSName(rs.getString("s_name"));
				student.setSSex(rs.getString("s_sex"));
				student.setSDepartmentId(rs.getString("s_department_id"));
				student.setSPhone(rs.getString("s_phone"));
				student.setSPassword(rs.getString("s_password"));
				student.setSPic(rs.getString("s_pic"));
				studentList.add(student);
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("试题查询失败！");
		}finally{
			ConnectionManager.close(rs);
			ConnectionManager.close(pstmt);
		}
		return studentList;
	}

	public int getTotalRecord(String gra, String dep, String cla)
			throws DaoException {
		String sql = "select count(*) from student";
		if(gra != null && !"".equals(gra)){
			sql += " where s_id like '" + gra + "%'";
		}else if(gra != null && !"".equals(gra) && dep != null && !"".equals(dep)){
			sql += " where s_id like '" + gra + dep + "%'";
		}else if(gra != null && !"".equals(gra) && dep != null && !"".equals(dep) && cla != null && !"".equals(cla)){
			sql += " where s_id like '" + gra + dep + cla + "%'";
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
				student.setSAge(rs.getString("s_age"));
				student.setSClasses(rs.getString("s_classes"));
				student.setSDepartment(rs.getString("s_department"));
				student.setSEmail(rs.getString("s_email"));
				student.setSGrade(rs.getString("s_grade"));
				student.setSName(rs.getString("s_name"));
				student.setSSex(rs.getString("s_sex"));
				student.setSDepartmentId(rs.getString("s_department_id"));
				student.setSPhone(rs.getString("s_phone"));
				student.setSPassword(rs.getString("s_password"));
				student.setSPic(rs.getString("s_pic"));
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

	public void addStudent(Student student) throws DaoException {
		String sql = "insert into student(s_id, s_name, s_password, s_sex, s_age, s_classes, s_department_id, s_department, s_grade, s_phone, s_email) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getSId());
			pstmt.setString(2, student.getSName());
			pstmt.setString(3, student.getSPassword());
			pstmt.setString(4, student.getSSex());
			pstmt.setString(5, student.getSAge());
			pstmt.setString(6, student.getSClasses());
			pstmt.setString(7, student.getSDepartmentId());
			pstmt.setString(8, student.getSDepartment());
			pstmt.setString(9, student.getSGrade());
			pstmt.setString(10, student.getSPhone());
			pstmt.setString(11, student.getSEmail());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("添加学生失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	public void modifyStudent(Student student) throws DaoException {
		String sql = "update student set s_name = ?, s_password = ?, s_sex = ?, s_age = ?, s_classes = ?, s_department_id = ?, s_department = ?, s_grade = ?, s_phone = ?, s_email = ? where s_id = ?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(11, student.getSId());
			pstmt.setString(1, student.getSName());
			pstmt.setString(2, student.getSPassword());
			pstmt.setString(3, student.getSSex());
			pstmt.setString(4, student.getSAge());
			pstmt.setString(5, student.getSClasses());
			pstmt.setString(6, student.getSDepartmentId());
			pstmt.setString(7, student.getSDepartment());
			pstmt.setString(8, student.getSGrade());
			pstmt.setString(9, student.getSPhone());
			pstmt.setString(10, student.getSEmail());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("修改学生失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}		
	}

	public void deleteStudentById(String id) throws DaoException {
		String sql = "delete from student where s_id=?";
		Connection conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DaoException("删除成绩失败！");
		}finally{
			ConnectionManager.close(pstmt);
		}
	}

	@Override
	public Login login(String sid, String spassword) throws DaoException {
			
			//返回真登陆成功，返回假登陆失败
			//if(!success)
			Login login = new Login();
			if(true)
			{
				if(true){
					PreparedStatement sql = null;
					ResultSet rs = null;
					try {
						Connection conn = ConnectionManager.getConnection();
						boolean boo = (sid == "" ? false:true) && (spassword == "" ? false:true);// 判断密码是否为空
						String condition = "select * from student where s_id=?";
						sql = conn.prepareStatement(condition);
						if(boo)
						{
							sql.setString(1, sid);
							rs = sql.executeQuery();
							boolean m = false;
							rs.next();
							if(rs.getString("s_password").equals(spassword)){
								m = true;
							}
							if(m == true)
							{
								login.setId(sid);
								login.setS_password(spassword);
								login.setS_name(rs.getString("s_name"));
								login.setBackNews("登录成功");
								login.setSuccess(true);
								//login.id = sid;
								//this.s_password = spassword;
								//s_name = rs.getString("s_name");
								//backNews = "登陆成功";
								//success = true;
							}
							else
							{
								login.setBackNews("您输入的用户名不存在，或密码不匹配");
								login.setSuccess(false);
								//backNews = "您输入的用户名不存在，或密码不匹配";
								//success = false;
								
							}
						}
						else
						{
							login.setBackNews("您输入的用户名或密码为空。");
							login.setSuccess(false);
							//backNews = "您输入的用户名或密码为空。";
							//success = false;
						}
						
					} 
					catch (SQLException e) {
						//System.out.println(e);
						login.setBackNews("您输入的用户名或密码错误！");
						login.setSuccess(false);
						//success = false;
						//backNews = "您输入的用户名或密码错误！";
					}catch(Exception e){
						login.setBackNews("您输入的用户名或密码错误！");
						//backNews = "您输入的用户名或密码错误！";
					}
					finally {
						ConnectionManager.close(rs);
						ConnectionManager.close(sql);
						//DB.close(rs);
						//DB.close(sql);
						//DB.close(conn);
					} 
				}
				/*else if(!adminSuccess){
					if(type.equals("教师")){
						Connection conn = null;
						PreparedStatement sql = null;
						ResultSet rs = null;
						try {
							PaperModel paper = null;
							conn = DB.getConnection();
							boolean boo = (id.length() > 0) && (s_password.length() > 0);
							String condition = "select * from administrator where a_id=? and a_password=?";
							sql = conn.prepareStatement(condition);
							
							if(boo)
							{
								sql.setString(1, id);
								sql.setString(2, s_password);
								rs = sql.executeQuery();
								boolean m = rs.next();
								
								if(m == true)
								{
									s_name = rs.getString("a_name");
									adminBackNews = "登陆成功";
									adminSuccess = true;
								}
								else
								{
									adminBackNews = "您输入的用户名不存在，或密码不匹配";
									adminSuccess = false;
									
								}
							}
							else
							{
								adminBackNews = "您输入的用户名不存在，或密码不匹配";
								adminSuccess = false;
							}
							
						} 
						catch (SQLException e) {
							System.out.println(e);
							adminSuccess = false;
							adminBackNews = "您输入的用户名或密码不存在！！！！！！";
						}finally {
							DB.close(rs);
							DB.close(sql);
							DB.close(conn);
						} 
					}
				}*/ 
			}
			
			return login;
		}

}
