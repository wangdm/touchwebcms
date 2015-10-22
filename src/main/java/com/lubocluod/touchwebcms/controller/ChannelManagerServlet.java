package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lubocluod.touchwebcms.dao.impl.ChannelDaoImpl;
import com.lubocluod.touchwebcms.entity.Channel;
import com.lubocluod.touchwebcms.entity.User;

/**
 * Servlet implementation class ChannelManagerServlet
 */
@WebServlet("/chnmanager")
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
		User u = (User)request.getSession().getAttribute("user");
		if(u==null)
		{
		    response.sendRedirect("login.jsp");
		}
		String op = request.getParameter("op");
		String return_json = "{";
		if ("add".equals(op)) {
			Channel chn = new Channel();
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			chn.setUserid(u.getId());
			chn.setName(request.getParameter("titlename"));
			chn.setPushuri(request.getParameter("pushuri"));
			chn.setPulluri(request.getParameter("pulluri"));
			chn.setCreatetime(new Timestamp(System.currentTimeMillis()));
			int chn_id = chnservice.add(chn);
            if (chn_id>=0) {
                result = true;
                return_json += "\"chnid\":\"" + chn_id + "\",";
            }
		} else if ("del".equals(op)) {
	        String idstr = request.getParameter("chnid");
	        int chnid = Integer.parseInt(idstr);
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			result = chnservice.delete(chnid);
		} else if ("edit".equals(op)) {
	        String idstr = request.getParameter("chnid");
	        int chnid = Integer.parseInt(idstr);
			ChannelDaoImpl chnservice = new ChannelDaoImpl();
			Channel chn = chnservice.find(chnid);
			if (chn != null) {
				chn.setName(request.getParameter("titlename"));
				chn.setPushuri(request.getParameter("pushuri"));
				chn.setPulluri(request.getParameter("pulluri"));
				result = chnservice.update(chn);
			}
		} else if("control".equals(op)) {
            String idstr = request.getParameter("chnid");
            int chnid = Integer.parseInt(idstr);
            String cmdstr = request.getParameter("cmd");
            int cmdcode = -1;
            if("start".equals(cmdstr)){
                cmdcode = 1;
            }else if("stop".equals(cmdstr)){
                cmdcode = 0;
            }
            if(cmdcode>=0)
            {
                ChannelDaoImpl chnservice = new ChannelDaoImpl();
                result = chnservice.control(chnid,cmdcode);
            }
		}
        if (result) {
            return_json += "\"result\":\"success\"";
        } else {
            return_json += "\"result\":\"failed\"";
        }
        return_json += "}";
        out.println(return_json);
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
