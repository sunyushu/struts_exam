package com.hand;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DbOperater {
	
			static Connection conn=null;
			static Statement stmt=null;
			static ResultSet rs = null;
			public static void getConn(){
				
				
				DbFactory db= new DbFactory();

				
				
				conn=DateBase.getConnection(db);
				
//				conn.setAutoCommit(false);   //设置不自动提交 、、程序应手动添加提交指令

				
				
				
//				return conn;
				
			}
			
			@SuppressWarnings("finally")
			public static ResultSet getRs(String sql){	
				
				
				getConn();
				
				try {
					 stmt = conn.createStatement();
					 rs=stmt.executeQuery(sql);

					 return rs;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return null;
				}


				
			}
			
			@SuppressWarnings("finally")
			public static int DML(String sql){
				getConn();
	
				int i=0;
			//	ResultSet rs = null;
				try {
					stmt = conn.createStatement();
					i= stmt.executeUpdate(sql);
					System.out.println("插入成功");

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("发生异常");
					i=0;
				}
				finally{
					return i;
				}
				
			}
			
			public void close(){
					try {
						if(rs!=null){
							rs.close();
						}
						if(stmt!=null){
						stmt.close();
						}
						if(conn!=null){
							conn.close();
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			
}
