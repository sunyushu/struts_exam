package com.hand.test;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CatchUser
 */
public class struts2 implements Filter {

    /**
     * Default constructor. 
     */
    public struts2() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req= (HttpServletRequest) request;
		HttpServletResponse resp= (HttpServletResponse) response;
		
		HttpSession session=req.getSession();
		String sevletPath=req.getServletPath();
		
		if(!sevletPath.equals("/login.check")&&!sevletPath.equals("/bootstrap.min.css")&&!sevletPath.equals("/bootstrap.min.js")&&!sevletPath.equals("/Desert.jpg")&&!sevletPath.equals("/jquery-2.1.4.min.js")){
			if(session.getAttribute("username")==null||session.getAttribute("username").equals("")){
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
				
			}
			else{
				chain.doFilter(request, response);
			}
		
		}
		else{
			chain.doFilter(request, response);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
