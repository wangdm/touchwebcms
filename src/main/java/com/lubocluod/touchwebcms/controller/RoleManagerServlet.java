package com.lubocluod.touchwebcms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lubocluod.touchwebcms.dao.impl.RoleDaoImpl;
import com.lubocluod.touchwebcms.entity.Role;

/**
 * Servlet implementation class RoleManagerServlet
 */
@WebServlet("/rolemanager")
public class RoleManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoleManagerServlet() {
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
        String return_str = "{";
        if ("add".equals(op)) {
            Role role = new Role();
            RoleDaoImpl roleservice = new RoleDaoImpl();
            role.setType(0);
            role.setTitle(request.getParameter("rolename"));
            result = roleservice.add(role);
            if (result) {
                role = roleservice.find(request.getParameter("rolename"));
                if (role != null) {
                    return_str += "\"roleid\":\"" + role.getId() + "\",";
                }
            }
        } else if ("del".equals(op)) {
            RoleDaoImpl roleservice = new RoleDaoImpl();
            String idstr = request.getParameter("roleid");
            int roleid = Integer.parseInt(idstr);
            result = roleservice.delete(roleid);
        } else if ("edit".equals(op)) {
            RoleDaoImpl roleservice = new RoleDaoImpl();
            String idstr = request.getParameter("roleid");
            int roleid = Integer.parseInt(idstr);
            Role role = roleservice.find(roleid);
            if (role != null) {
                role.setTitle(request.getParameter("rolename"));
                result = roleservice.update(role);
            }
        } else if ("list".equals(op)) {
            RoleDaoImpl roleservice = new RoleDaoImpl();
            ArrayList<Role> rolelist = (ArrayList<Role>) roleservice.findAll();
            if (null != rolelist) {
                return_str += "\"list\":[";
                for (int i = 0; i < rolelist.size(); i++) {
                    Role r = rolelist.get(i);
                    if(i!=0)
                    {
                        return_str += ",";
                    }
                    return_str += "{\"type\": " + r.getId() + ",\"title\": \"" + r.getTitle() + "\"}";
                }
                return_str += "],";
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
