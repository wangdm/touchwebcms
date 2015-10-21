package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lubocluod.touchwebcms.dao.impl.UserDaoImpl;

/**
 * Servlet implementation class UserRegisterCheckServlet
 */
@WebServlet("/UserRegisterCheckServlet")
public class UserRegisterCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String op = request.getParameter("op");
		String value = request.getParameter("ckvalue");
		boolean check = false;
		if(op!=null && value!=null)
		{
			UserDaoImpl userservice = new UserDaoImpl();
			if("ckusername".equals(op)){
				check = userservice.check("username", value);
			}else if("ckemail".equals(op)){
				check = userservice.check("email", value);
			}else if("ckphone".equals(op)){
				check = userservice.check("phone", value);
			}
		}
		if (check) {
			out.print("\"result\":\"success\"");
		} else {
			out.print("\"result\":\"failed\"");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
