package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		boolean result = false;
		String op = request.getParameter("op");
		String return_str = "{";

		if ("add".equals(op)) {
			User user = new User();
			UserDaoImpl userservice = new UserDaoImpl();
			user.setUsername(request.getParameter("username"));
			user.setPasswd(request.getParameter("passwd"));
			user.setFullname(request.getParameter("fullname"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			result = userservice.add(user);
			if (result) {
				user = userservice.find(request.getParameter("username"));
				if (user != null) {
					return_str += "\"userid\":\"" + user.getId() + "\",";
				}
			}
		} else if ("del".equals(op)) {
			String idstr = request.getParameter("userid");
			int userid = Integer.parseInt(idstr);
			UserDaoImpl userservice = new UserDaoImpl();
			result = userservice.delete(userid);
		} else if ("edit".equals(op)) {
			String idstr = request.getParameter("userid");
			int userid = Integer.parseInt(idstr);
			UserDaoImpl userservice = new UserDaoImpl();
			User user = userservice.find(userid);
			if (user != null) {
                user.setRoletype(Integer.parseInt(request.getParameter("usertype")));
				user.setFullname(request.getParameter("fullname"));
				user.setEmail(request.getParameter("email"));
				user.setPhone(request.getParameter("phone"));
				result = userservice.update(user);
			}
		} else if ("changepasswd".equals(op)) {
			String idstr = request.getParameter("userid");
			int userid = Integer.parseInt(idstr);
			UserDaoImpl userservice = new UserDaoImpl();
			User user = userservice.find(userid);
			if (user != null) {
				user.setPasswd(request.getParameter("passwd"));
				result = userservice.update(user);
			}
		}
		if (result) {
			return_str += "\"result\":\"success\"";
		} else {
			return_str += "\"result\":\"failed\"";
		}
		return_str += "}";
		out.println(return_str);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
