package com.ems.fe.basedata.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ems.fe.basedata.dao.ExamDao;
import com.ems.fe.basedata.model.Admin;
import com.ems.fe.basedata.model.ExamPaper;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.MongoDBConnectionManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class ExamDao4MongoDBImpl implements ExamDao{

	@Override
	public List findAllExam(int pageNo, int pageSize, String year,
			String month, String course) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		DBCursor cursor = coll.find();
		List<ExamPaper> list = new ArrayList<ExamPaper>();
		try	{
			   while(cursor.hasNext()) {
				   ExamPaper examPaper = new ExamPaper();
				   DBObject o = cursor.next();
				   examPaper.setEAnswer(o.get("e_answer").toString());
				   examPaper.setEContent(o.get("e_content").toString());
				   examPaper.setECourse(o.get("e_course").toString());
				   examPaper.setEId(Integer.parseInt(o.get("e_id").toString()));
				   examPaper.setEName(o.get("e_name").toString());
				   examPaper.setEPic(o.get("e_pic").toString());
				   examPaper.setEType(o.get("e_type").toString());
				   examPaper.setPId(o.get("p_id").toString());
				   examPaper.setPName(o.get("p_name").toString());
				   list.add(examPaper);
			   }
			} finally {
			   cursor.close();
			}
			return list;
	}

	@Override
	public int getTotalRecord(String year, String month, String course)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		int count = new Long(coll.getCount()).intValue();
		MongoDBConnectionManager.closeDB();
		return count;
	}

	@Override
	public void addExamPaper(ExamPaper exampaper) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		BasicDBObject doc = new BasicDBObject("e_answer", exampaper.getEAnswer()).
                append("e_content", exampaper.getEContent()).
                append("e_course", exampaper.getECourse()).
                append("e_name", exampaper.getEName()).
                append("e_pic", "").
                append("e_id", Integer.parseInt((System.currentTimeMillis() + "").substring(4))).
                append("e_type", exampaper.getEType()).
                append("p_name", exampaper.getPName()).
                append("p_id", exampaper.getPId());
		coll.insert(doc);
	}

	@Override
	public ExamPaper findExamByPid(String eId) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		if(eId == null) {
			eId = "0";
		}
		BasicDBObject query = new BasicDBObject("e_id", Integer.parseInt(eId));
		DBCursor cursor = coll.find(query);
		ExamPaper examPaper = null;
		try	{
		   while(cursor.hasNext()) {
			   examPaper = new ExamPaper();
			   DBObject o = cursor.next();
			   examPaper.setEAnswer(o.get("e_answer").toString());
			   examPaper.setEContent(o.get("e_content").toString());
			   examPaper.setECourse(o.get("e_course").toString());
			   examPaper.setEId(Integer.parseInt(o.get("e_id").toString()));
			   examPaper.setEName(o.get("e_name").toString());
			   examPaper.setEPic(o.get("e_pic").toString());
			   examPaper.setEType(o.get("e_type").toString());
			   examPaper.setPId(o.get("p_id").toString());
			   examPaper.setPName(o.get("p_name").toString());
		   }
		} finally {
		   cursor.close();
		}
		return examPaper;
	}

	@Override
	public void modifyExamPaper(ExamPaper exampaper) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		BasicDBObject query = new BasicDBObject("e_id", exampaper.getEId());
		DBObject q = coll.findOne(query);
		BasicDBObject o = new BasicDBObject("e_answer", exampaper.getEAnswer()).
                append("e_content", exampaper.getEContent()).
                append("e_course", exampaper.getECourse()).
                append("e_name", exampaper.getEName()).
                append("e_id", Integer.parseInt(q.get("e_id").toString())).
                append("e_pic", q.get("e_pic").toString()).
                append("e_type", exampaper.getEType()).
                append("p_name", exampaper.getPName()).
                append("p_id", exampaper.getPId());
		coll.update(q, o);
		MongoDBConnectionManager.closeDB();
	}

	@Override
	public void deleteExamPaperById(String eId) throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		BasicDBObject o = new BasicDBObject("e_id", Integer.parseInt(eId));
		coll.remove(o);
		MongoDBConnectionManager.closeDB();
	}

	@Override
	public ExamPaper findExamPaperByPaperIdAndTimuId(String pId, String timuId) {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("exampaper");
		BasicDBObject query = new BasicDBObject("e_name", timuId).append("p_id", pId);
		DBCursor cursor = coll.find(query);
		ExamPaper examPaper = null;
		try	{
		   while(cursor.hasNext()) {
			   examPaper = new ExamPaper();
			   DBObject o = cursor.next();
			   examPaper.setEAnswer(o.get("e_answer").toString());
			   examPaper.setEContent(o.get("e_content").toString());
			   examPaper.setECourse(o.get("e_course").toString());
			   examPaper.setEId(Integer.parseInt(o.get("e_id").toString()));
			   examPaper.setEName(o.get("e_name").toString());
			   examPaper.setEPic(o.get("e_pic").toString());
			   examPaper.setEType(o.get("e_type").toString());
			   examPaper.setPId(o.get("p_id").toString());
			   examPaper.setPName(o.get("p_name").toString());
		   }
		} finally {
		   cursor.close();
		}
		return examPaper;
	}

}
