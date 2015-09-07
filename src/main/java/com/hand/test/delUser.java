package com.hand.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hand.DbOperater;

/**
 * Servlet implementation class delUser
 */
public class delUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delUser() {
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
		String cid=request.getParameter("cid");

				String sql1="DELETE FROM payment WHERE customer_id="+cid+"";
				String sql2="DELETE FROM rental WHERE customer_id="+cid+"";
				String sql3="DELETE FROM customer WHERE customer_id = "+cid+"";
				
				DbOperater.DML(sql1);
				DbOperater.DML(sql2);
				int i=DbOperater.DML(sql3);
				if(i>=0){
					response.getWriter().print("success");
				}
				else{
					response.getWriter().print("error");
				}
				
		// TODO Auto-generated method stub
	}

}
