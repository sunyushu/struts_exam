package com.hand;

import java.sql.ResultSet;
import java.sql.SQLException;

public class getPages {
			public static String getPages(){
				String sql="select count(*) from customer";
				ResultSet rs=DbOperater.getRs(sql);
				System.out.println("fasdfdsf");
				String str="";
				try {
					rs.next();
					int i= rs.getInt(1)/10 ;
					
					for(int j=0;j<i;j++){
						str=str+"<li><a href='#'>"+(j+1)+"</a></li>";
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

				
				return str;
			}
}
