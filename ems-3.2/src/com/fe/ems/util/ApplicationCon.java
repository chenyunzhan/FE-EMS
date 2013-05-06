package com.fe.ems.util;

import java.sql.*;
import java.util.LinkedList;

public class ApplicationCon {

	LinkedList<Connection> list;
	public ApplicationCon(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		
			list = new LinkedList<Connection>();
			for(int k=0; k<=10; k++)
			{
				String uri = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=EMS_new";
				String id="sa";
				String password="sywsyw";
				Connection con = DriverManager.getConnection(uri,id,password);
				list.add(con);
			}
		}
		catch(Exception e)
		{	
			e.printStackTrace();
		}
	}
	public synchronized Connection getOneConnection()
	{
		if(list.size() > 0){
			return list.removeFirst();}
		else{
			return null;}
	}
	public synchronized void putBackOneConnection(Connection con)
	{
		list.addFirst(con);
	}
}
