package com.ems.fe.util;

import java.net.URL;
import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

public class MongoDBConnectionManager {
	
	private static ThreadLocal<Mongo> connectionHolder = new ThreadLocal<Mongo>();
	public static DB getDB() {
		Mongo mongoClient = (Mongo)connectionHolder.get();
		URL path = MongoDBConnectionManager.class.getResource("/");
		DB db = null;
		if(mongoClient != null) {
			if(path.toString().contains("vcap")) {
				db = mongoClient.getDB("db");
			}else {
				db = mongoClient.getDB("test");
			}
		}
		if(db == null) {
			try {
				if(path.toString().contains("vcap")) {
					mongoClient = new Mongo("172.30.48.62", 25318);
					db = mongoClient.getDB("db");
					db.authenticate("05baeeaf-3119-4a4a-942c-5b8ad43bb5d7", "41678c78-5f09-4cbd-847f-c97d5495ea4e".toCharArray());
				} else {
					mongoClient = new Mongo();
					db = mongoClient.getDB("test");
					db.authenticate("snow", "snow".toCharArray());
				}
				connectionHolder.set(mongoClient);
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MongoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return db;
	}
	
	
	public static void closeDB() {
		Mongo mongoClient = (Mongo)connectionHolder.get();
		if (mongoClient != null) {
			mongoClient.close();
			connectionHolder.remove();
		}
	}
}

