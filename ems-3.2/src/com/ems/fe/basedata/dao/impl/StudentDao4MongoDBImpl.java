package com.ems.fe.basedata.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.dao.StudentDao;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.MongoDBConnectionManager;
import com.fe.ems.util.Login;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class StudentDao4MongoDBImpl implements StudentDao{

	@Override
	public List<Student> findAllStudent(int pageNo, int pageSize, String gra,
			String dep, String cla) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		DBCursor cursor = coll.find();
		List<Student> list = new ArrayList<Student>();
		try	{
			   while(cursor.hasNext()) {
				   Student student = new Student();
				   DBObject o = cursor.next();
				   student.setSAge(o.get("s_age").toString());
				   student.setSClasses(o.get("s_classes").toString());
				   student.setSDepartment(o.get("s_department").toString());
				   student.setSDepartmentId(o.get("s_department_id").toString());
				   student.setSEmail(o.get("s_email").toString());
				   student.setSGrade(o.get("s_grade").toString());
				   student.setSId(o.get("s_id").toString());
				   student.setSName(o.get("s_name").toString());
				   student.setSPassword(o.get("s_password").toString());
				   student.setSPhone(o.get("s_phone").toString());
				   student.setSPic(o.get("s_pic").toString());
				   student.setSSex(o.get("s_sex").toString());
				   list.add(student);
			   }
			} finally {
			   cursor.close();
			}
			MongoDBConnectionManager.closeDB();
			return list;
	}

	@Override
	public int getTotalRecord(String gra, String dep, String cla)
			throws DaoException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Student findStudentById(String sId) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		BasicDBObject query = new BasicDBObject("s_id", sId);
		DBCursor cursor = coll.find(query);
		Student student = null;
		try	{
		   while(cursor.hasNext()) {
			   student = new Student();
			   DBObject o = cursor.next();
			   student.setSAge(o.get("s_age").toString());
			   student.setSClasses(o.get("s_classes").toString());
			   student.setSDepartment(o.get("s_department").toString());
			   student.setSDepartmentId(o.get("s_department_id").toString());
			   student.setSEmail(o.get("s_email").toString());
			   student.setSGrade(o.get("s_grade").toString());
			   student.setSId(o.get("s_id").toString());
			   student.setSName(o.get("s_name").toString());
			   student.setSPassword(o.get("s_password").toString());
			   student.setSPhone(o.get("s_phone").toString());
			   student.setSPic(o.get("s_pic").toString());
			   student.setSSex(o.get("s_sex").toString());
		   }
		} finally {
		   cursor.close();
		}
		MongoDBConnectionManager.closeDB();
		return student;
	}

	@Override
	public void addStudent(Student student) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		BasicDBObject doc = new BasicDBObject("s_age", student.getSAge()).
                append("s_classes", student.getSClasses()).
                append("s_department", student.getSDepartment()).
                append("s_department_id", student.getSDepartmentId()).
                append("s_email", student.getSEmail()).
                append("s_grade", student.getSGrade()).
                append("s_id", student.getSId()).
                append("s_name", student.getSName()).
                append("s_password", student.getSPassword()).
                append("s_phone", student.getSPhone()).
                append("s_pic", "").
                append("s_sex", student.getSSex());
		coll.insert(doc);
		MongoDBConnectionManager.closeDB();
		
	}

	@Override
	public void modifyStudent(Student student) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		BasicDBObject query = new BasicDBObject("s_id", student.getSId());
		DBObject q = coll.findOne(query);
		BasicDBObject o = new BasicDBObject("s_age", student.getSAge()).
                append("s_classes", student.getSClasses()).
                append("s_department", student.getSDepartment()).
                append("s_department_id", student.getSDepartmentId()).
                append("s_email", student.getSEmail()).
                append("s_grade", student.getSGrade()).
                append("s_id", student.getSId()).
                append("s_name", student.getSName()).
                append("s_password", student.getSPassword()).
                append("s_phone", student.getSPhone()).
                append("s_pic", q.get("s_pic").toString()).
                append("s_sex", student.getSSex());
		coll.update(q, o);
		MongoDBConnectionManager.closeDB();
		
	}

	@Override
	public void deleteStudentById(String sId) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		BasicDBObject o = new BasicDBObject("s_id", sId);
		coll.remove(o);
		MongoDBConnectionManager.closeDB();
		
	}

	@Override
	public Login login(String sid, String spassword) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("student");
		BasicDBObject query = new BasicDBObject("s_id", sid);
		DBCursor cursor = coll.find(query);
		Login login = null;
		try	{
		   login = new Login();
		   login.setBackNews("您输入的用户名不存在，或密码不匹配");
		   login.setSuccess(false);
		   while(cursor.hasNext()) {
			   DBObject o = cursor.next();
			   login.setId(o.get("s_id").toString());
			   login.setS_name(o.get("s_name").toString());
			   login.setSuccess(true);
			   login.setS_password(o.get("s_password").toString());
			   login.setBackNews("登录成功");
		   } 
		} finally {
		   cursor.close();
		}
		MongoDBConnectionManager.closeDB();
		return login;	
	}

}
