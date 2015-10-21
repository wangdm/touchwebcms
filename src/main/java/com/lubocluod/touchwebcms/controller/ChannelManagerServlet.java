package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lubocluod.touchwebcms.dao.impl.ChannelDaoImpl;
import com.lubocluod.touchwebcms.entity.Channel;

/**
 * Servlet implementation class ChannelManagerServlet
 */
@WebServlet("/channelmanager")
public class ChannelManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChannelManagerServlet() {
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
		String idstr = request.getParameter("chnid");
		int chnid = Integer.parseInt(idstr);
		if ("add".equals(op)) {
			Channel chn = new Channel();
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			chn.setName(request.getParameter("chnname"));
			chn.setPushuri(request.getParameter("pushuri"));
			chn.setPulluri(request.getParameter("pulluri"));
			result = chnservice.add(chn);
		} else if ("del".equals(op)) {
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			result = chnservice.delete(chnid);
		} else if ("edit".equals(op)) {
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			Channel chn = chnservice.find(chnid);
			if (chn != null) {
				chn.setName(request.getParameter("chnname"));
				chn.setPushuri(request.getParameter("pushuri"));
				chn.setPulluri(request.getParameter("pulluri"));
				result = chnservice.update(chn);
			}
		}
		if (result) {
			out.print("\"result\":\"success\"");
		} else {
			out.print("\"result\":\"failed\"");
		}
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
