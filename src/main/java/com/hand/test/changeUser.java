package com.hand.test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hand.DbOperater;

/**
 * Servlet implementation class changeUser
 */
public class changeUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeUser() {
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
		request.setCharacterEncoding("UTF-8");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String cid=request.getParameter("cid");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=df.format(new Date());
		String sql="UPDATE customer SET first_name='"+firstName+"' , last_name='"+lastName+"' ,email='"+address+"' ,last_update='"+date+"' WHERE customer_id="+cid+"";
		int i=DbOperater.DML(sql);
		
		String[] addr=email.split(",");

		if(addr.length==2){
			String sql1="select address_id from customer where customer_id="+cid+""; //get addrid 

			ResultSet rs=DbOperater.getRs(sql1);
			try {
				rs.next();
				String addrId= rs.getString(1);
				
				String sql2="update address set address='"+addr[0]+"',phone="+addr[1]+" where address_id ="+addrId+"";
				DbOperater.DML(sql2);
				response.sendRedirect("index.jsp");
				
			} catch (SQLException e) {
				response.sendRedirect("index.jsp");
			}
		
			
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}

}
