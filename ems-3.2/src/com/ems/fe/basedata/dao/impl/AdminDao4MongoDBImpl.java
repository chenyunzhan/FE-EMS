package com.ems.fe.basedata.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.dao.AdminDao;
import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.basedata.model.ScoreView;
import com.ems.fe.basedata.model.Student;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.MongoDBConnectionManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class AdminDao4MongoDBImpl implements AdminDao{

	@Override
	public Admin adminLogin(String aId, String aPassword) throws DaoException {
		Admin admin = this.findAdminById(aId);
		if(admin == null){
			throw new DaoException("用户找不到！");
		}
		if(!admin.getAPassword().equals(aPassword)){
			throw new DaoException("密码不正确！");
		}
		return admin;
	}

	@Override
	public Admin findAdminById(String aId) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		BasicDBObject query = new BasicDBObject("a_id", aId);
		DBCollection coll = db.getCollection("administrator");
		DBCursor cursor = coll.find(query);
		Admin admin = new Admin();
		try {
		   while(cursor.hasNext()) {
			   DBObject o = cursor.next();
			   admin.setAId(o.get("a_id").toString());
			   admin.setAEmail(o.get("a_email").toString());
			   admin.setAAge(Integer.parseInt(o.get("a_age").toString()));
			   admin.setAName(o.get("a_name").toString());
			   admin.setAPassword(o.get("a_password").toString());
			   admin.setAPhone(o.get("a_phone").toString());
			   admin.setASex(o.get("a_sex").toString());
		       //System.out.println(cursor.next());
		   }
		} finally {
		   cursor.close();
		}
		return admin;
	}

	@Override
	public List findAllScore(int pageNo, int pageSize, String sGrade,
			String sDepartmentId, String sClasses) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("score");
		DBCursor cursor = coll.find();
		List list = new ArrayList();
		try {
		   while(cursor.hasNext()) {
			   ScoreView s = new ScoreView();
			   DBObject o = cursor.next();
			   BasicDBObject query1 = new BasicDBObject("s_id", o.get("student_id").toString()); 
			   BasicDBObject query2 = new BasicDBObject("p_id", o.get("paper_id").toString()); 
			   DBCollection students = db.getCollection("student");
			   DBCollection exampapers = db.getCollection("exampaper");
			   DBObject student = students.findOne(query1);
			   DBObject exampaper = exampapers.findOne(query2);
			   s.setV_paperId(exampaper.get("p_id").toString());
			   s.setV_pName(exampaper.get("p_name").toString());
			   s.setV_sClasses(student.get("s_classes").toString());
			   s.setV_score(Integer.parseInt(o.get("score").toString()));
			   s.setV_scoreId(o.get("score_id").toString());
			   s.setV_sDepartment(student.get("s_department").toString());
			   s.setV_sDepartmentId(student.get("s_department_id").toString());
			   s.setV_sGrade(student.get("s_grade").toString());
			   s.setV_sName(student.get("s_name").toString());
			   s.setV_studentId(student.get("s_id").toString());
			   list.add(s);
		       //System.out.println(cursor.next());
		   }
		} finally {
		   cursor.close();
		}
		return list;
	}

	@Override
	public List findScoreByPidOrSid(int pageNo, int pageSize, String paperId,
			String studentId) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findScoreByPidAndSid(int pageNo, int pageSize, String paperId,
			String studentId) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRecord(String paperId, String studentId)
			throws DaoException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalRecord(String sGrade, String sDepartmentId,
			String sClasses) throws DaoException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Student findStudentById(String sId) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExamPaper findPaperByPid(String pId) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Score findScore(String paperId, String studentId)
			throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getPaperList() throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addScore(Score score) throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Score findScore(String id) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyScore(Score score) throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteScoreById(String scoreId) throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyTeacherPassword(String aId, String aPassword)
			throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyAdmin(Admin admin) throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List findAllAdmin(int pageNo, int pageSize) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("administrator");
		DBCursor cursor = coll.find();
		List<Admin> list = new ArrayList<Admin>();
		try {
		   while(cursor.hasNext()) {
			   Admin admin = new Admin();
			   DBObject o = cursor.next();
			   admin.setAId(o.get("a_id").toString());
			   admin.setAEmail(o.get("a_email").toString());
			   admin.setAAge(Integer.parseInt(o.get("a_age").toString()));
			   admin.setAName(o.get("a_name").toString());
			   admin.setAPassword(o.get("a_password").toString());
			   admin.setAPhone(o.get("a_phone").toString());
			   admin.setASex(o.get("a_sex").toString());
			   list.add(admin);
		   }
		} finally {
		   cursor.close();
		}
		return list;	
	}

	@Override
	public int getTotalRecord() throws DaoException {
		// TODO Auto-generated method stub
		return 0;
	}

}
