package com.hand;

import java.sql.ResultSet;
import java.sql.SQLException;

public class getAddress {
			public static String getAddr(){
				String str="";
				String sql="select address_id,address from address";
				ResultSet rs=DbOperater.getRs(sql);
				try {
					while(rs.next()){
						str=str+" <option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
						
					}
					
					return str;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return "0";
				}
			}
}	
