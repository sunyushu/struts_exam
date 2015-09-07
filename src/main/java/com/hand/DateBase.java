package com.hand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DateBase {

		@SuppressWarnings("finally")
		
		/**
		 * Catch a Database type
		 * if connect failed return null
		 * @param db
		 * @return  connection
		 */
		
		
		public  static Connection getConnection(DbFactory db) {

			Connection conn=null;
			try {
				
				Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			
		//		conn.setAutoCommit(false);   //设置不自动提交 、、程序应手动添加提交指令
				conn = DriverManager.getConnection("jdbc:mysql://"+db.getIp()+":"+db.getPort()+"/"+db.getDbname()+"", db.getUserName(),db.getUserPass());
			} 
			
			finally{
				return conn;
			}
			
			
			
		}
		
		@SuppressWarnings("finally")
		public static int getRsColunm(ResultSet resultSet){
			int rsCount = 0;
			try {
				rsCount = resultSet.getMetaData().getColumnCount();
			} 
			
			finally {
				
				return rsCount;
			}
			
		}
}
