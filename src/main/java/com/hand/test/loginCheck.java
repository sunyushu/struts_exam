package com.hand.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hand.DbOperater;

/**
 * Servlet implementation class CheckLogin
 */
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String sql="select * from customer where first_name='"+username+"'";
		
		if(username!=null && !username.equals("")){
			try {
				if(DbOperater.getRs(sql).next()){
					
					HttpSession session=request.getSession();
					session.setAttribute("username", username);
					out.print("success");
				}
				else {
					out.print("user not exist");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.print("server error");
			}
		}
		else{
			out.print("username can't empty");
		}


	}

}
