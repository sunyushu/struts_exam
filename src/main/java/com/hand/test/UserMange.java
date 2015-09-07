package com.hand.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hand.DbOperater;

/**
 * Servlet implementation class UserMange
 */
public class UserMange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pid = request.getParameter("code");
		if(pid==null||pid=="")
			pid="1";
		int page=Integer.parseInt(pid);
		int start= (page-1)*10;
	

		String data="[";
		String sql="SELECT first_name,last_name,email,a.address,a.phone,customer_id,s.last_update FROM customer s,address a WHERE s.address_id=a.address_id limit "+start+",10";
		ResultSet rs=DbOperater.getRs(sql);
		try {
			while(rs.next()){
				data=data+"{\"first_name\":\""+rs.getString(1)+"\",\"last_name\":\""+rs.getString(2)+"\",\"address\":\""+rs.getString(3)+"\",\"email\":\""+rs.getString(4)+"(Tel"+rs.getString(5)+")\",\"cid\":\""+rs.getString(6)+"\",\"last_update\":\""+rs.getString(7)+"\"},";
			}
		} catch (SQLException e) {
			out.print("error");
		}
		
		data=data.substring(0,data.length()-1);
		data=data+"]";

		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		out.print(data);
	}

}
