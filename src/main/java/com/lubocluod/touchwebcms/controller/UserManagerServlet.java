package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lubocluod.touchwebcms.dao.impl.UserDaoImpl;
import com.lubocluod.touchwebcms.entity.User;

/**
 * Servlet implementation class UserManagerServlet
 */
@WebServlet("/usermanager")
public class UserManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op");
		String idstr = request.getParameter("userid");
		int userid = Integer.parseInt(idstr);
		
		if("add".equals(op))
		{
			User user = new User();
			UserDaoImpl userservice = new UserDaoImpl();
			user.setUsername(request.getParameter("username"));
			user.setPasswd(request.getParameter("passwd"));
			user.setFullname(request.getParameter("fullname"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			userservice.add(user);
		}else if("del".equals(op))
		{
			UserDaoImpl userservice = new UserDaoImpl();
			userservice.delete(userid);
		}else if("edit".equals(op))
		{
			
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
