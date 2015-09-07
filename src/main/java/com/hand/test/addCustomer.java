package com.hand.test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hand.DbOperater;

/**
 * Servlet implementation class addCustomer
 */
public class addCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCustomer() {
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
		String first_name=request.getParameter("firstName");
		String last_name=request.getParameter("lastName");
		String email=request.getParameter("email");
		String addrid=request.getParameter("addr");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=df.format(new Date());
		String sql="INSERT INTO customer(first_name,last_name,email,address_id,store_id,create_date) VALUES('"+first_name+"','"+last_name+"','"+email+"',"+addrid+",1,'"+date+"')";//日期自动添加
		// TODO Auto-generated method stub
		int i=DbOperater.DML(sql);
		response.getWriter().print("<script>alert('success')</script>");
		response.sendRedirect("index.jsp");
	}

}
