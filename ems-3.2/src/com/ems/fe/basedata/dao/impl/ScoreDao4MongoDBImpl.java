package com.ems.fe.basedata.dao.impl;

import com.ems.fe.basedata.dao.ScoreDao;
import com.ems.fe.basedata.model.Score;
import com.ems.fe.util.MongoDBConnectionManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;

public class ScoreDao4MongoDBImpl implements ScoreDao{

	@Override
	public void addScore(Score score) {
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("score");
		BasicDBObject doc = new BasicDBObject("paper_id", score.getPaperId()).
                append("score", score.getScore()).
                append("score_id", Integer.parseInt((System.currentTimeMillis() + "").substring(4))).
                append("student_id", score.getStudentId());
		coll.insert(doc);
		MongoDBConnectionManager.closeDB();
		
	}

}
