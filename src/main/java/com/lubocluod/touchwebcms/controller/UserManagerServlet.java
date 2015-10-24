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
        response.setContentType("application/json;charset=UTF-8");
		boolean result = false;
		String op = request.getParameter("op");
		User cur_user = (User)request.getSession().getAttribute("user");
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
			    String param = request.getParameter("usertype");
			    if(param!=null){
			        user.setRoletype(Integer.parseInt(param));
			    }
                param = request.getParameter("fullname");
                if(param!=null){
                    user.setFullname(param);
                }
                param = request.getParameter("email");
                if(param!=null){
                    user.setEmail(param);
                }
                param = request.getParameter("phone");
                if(param!=null){
                    user.setPhone(param);
                }
				result = userservice.update(user);
		        if (result) {
		            request.getSession().setAttribute("user", user);
		        } 
			}
		} else if ("changepwd".equals(op)) {
			String idstr = request.getParameter("userid");
			int userid = Integer.parseInt(idstr);
			UserDaoImpl userservice = new UserDaoImpl();
			User user = userservice.find(userid);
			if (user != null) {
				user.setPasswd(request.getParameter("passwd"));
				result = userservice.update(user);
			}
		} else if("check".equals(op))
		{
            UserDaoImpl userservice = new UserDaoImpl();
		    String type = request.getParameter("type");
		    String value = request.getParameter("value");
		    do{
    		    if(type==null || type.length()==0)
    		    {
                    result = false;
                    return_str += "\"errorinfo\":\"error!\",";
                    break;
    		        
    		    }else if("username".equals(type)){
    		        if(value==null || value.length()==0)
    		        {
    		            result = false;
    		            return_str += "\"errorinfo\":\"The "+type+" can't be empty!\",";
                        break;
    		        }
    		    }else if("email".equals(type)){
                    if(value==null || value.length()==0)
                    {
                        result = false;
                        return_str += "\"errorinfo\":\"The "+type+" can't be empty!\",";
                        break;
                    }
    		        
    		    }else if("phone".equals(type)){
                    if(value==null || value.length()==0)
                    {
                        result = false;
                        return_str += "\"errorinfo\":\"The "+type+" can't be empty!\",";
                        break;
                    }
                    
                }
                if(cur_user==null){
                    result = userservice.check(type, value, -1);
                }else{
                    result = userservice.check(type, value, cur_user.getId());
                }
                if(result==false)
                    return_str += "\"errorinfo\":\"The "+type+" is already existed!\",";
		    }while(false);

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
