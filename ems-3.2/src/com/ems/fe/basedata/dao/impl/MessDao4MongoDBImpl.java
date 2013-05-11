package com.ems.fe.basedata.dao.impl;

import java.util.regex.Pattern;

import com.ems.fe.basedata.dao.MessDao;
import com.ems.fe.basedata.model.Mess;
import com.ems.fe.exceptions.DaoException;
import com.ems.fe.util.MongoDBConnectionManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class MessDao4MongoDBImpl implements MessDao{

	@Override
	public void addUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("messageprotect");
		BasicDBObject doc = new BasicDBObject("s_id", s_id).
                append("p_id", p_id).
                append("timeout", timeout).
                append("answer", answer).
                append("allowstates", allowstates).
                append("monistates", monistates).
                append("timuId", timuId);
		coll.insert(doc);
	}

	@Override
	public void deleteUserProtectMess(String s_id, String p_id)
			throws DaoException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyUserProtectMess(String s_id, String p_id, int timeout,
			String answer, int allowstates, int monistates, String timuId)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("messageprotect");
		BasicDBObject query = new BasicDBObject("s_id", s_id).append("p_id", p_id);
		DBObject q = coll.findOne(query);
		BasicDBObject o = new BasicDBObject("s_id", s_id).
                append("p_id", p_id).
                append("timeout", timeout).
                append("answer", answer).
                append("allowstates", allowstates).
                append("monistates", monistates).
                append("timuId", timuId);
		coll.update(q, o);
		MongoDBConnectionManager.closeDB();
		
	}

	@Override
	public Mess findUserProtectMess(String s_id, String p_id)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		BasicDBObject query = new BasicDBObject("s_id", s_id).append("p_id", p_id);
		DBCollection coll = db.getCollection("messageprotect");
		DBCursor cursor = coll.find(query);
		Mess mess = null;
		try {
		   while(cursor.hasNext()) {
			   mess = new Mess();
			   DBObject o = cursor.next();
			   mess.setS_id(o.get("s_id").toString());
			   mess.setP_id(o.get("p_id").toString());
			   mess.setAllowstates(Integer.parseInt(o.get("allowstates").toString()));
			   mess.setAnswer(o.get("answer").toString());
			   mess.setMonistates(Integer.parseInt(o.get("monistates").toString()));
			   mess.setTimeout(Integer.parseInt(o.get("timeout").toString()));
			   mess.setTimuId(o.get("timuId").toString());
		       //System.out.println(cursor.next());
		   }
		} finally {
		   cursor.close();
		}
		return mess;
	}

	@Override
	public Mess findUserProtectMessByUserId(String id, int monistates)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		BasicDBObject query = new BasicDBObject("s_id", id).append("monistates", monistates);
		DBCollection coll = db.getCollection("messageprotect");
		DBCursor cursor = coll.find(query);
		Mess mess = null;
		try {
		   while(cursor.hasNext()) {
			   mess = new Mess();
			   DBObject o = cursor.next();
			   mess.setS_id(o.get("s_id").toString());
			   mess.setP_id(o.get("p_id").toString());
			   mess.setAllowstates(Integer.parseInt(o.get("allowstates").toString()));
			   mess.setAnswer(o.get("answer").toString());
			   mess.setMonistates(Integer.parseInt(o.get("monistates").toString()));
			   mess.setTimeout(Integer.parseInt(o.get("timeout").toString()));
			   mess.setTimuId(o.get("timuId").toString());
		       //System.out.println(cursor.next());
		   }
		} finally {
		   cursor.close();
		}
		return mess;
	}

	@Override
	public Mess getUserProtectMess(String s_id, String p_id)
			throws DaoException {
		DB db = MongoDBConnectionManager.getDB();
		if(p_id.length() > 3) {
			p_id = p_id.substring(0, p_id.length()-1);
		}
		Pattern pattern=Pattern.compile(p_id+".*$");   
		BasicDBObject query = new BasicDBObject("s_id", s_id).append("p_id", pattern);
		DBCollection coll = db.getCollection("messageprotect");
		DBCursor cursor = coll.find(query);
		Mess mess = null;
		try {
		   while(cursor.hasNext()) {
			   mess = new Mess();
			   DBObject o = cursor.next();
			   mess.setS_id(o.get("s_id").toString());
			   mess.setP_id(o.get("p_id").toString());
			   mess.setAllowstates(Integer.parseInt(o.get("allowstates").toString()));
			   mess.setAnswer(o.get("answer").toString());
			   mess.setMonistates(Integer.parseInt(o.get("monistates").toString()));
			   mess.setTimeout(Integer.parseInt(o.get("timeout").toString()));
			   mess.setTimuId(o.get("timuId").toString());
		       //System.out.println(cursor.next());
		   }
		} finally {
		   cursor.close();
		}
		return mess;
	}

}
