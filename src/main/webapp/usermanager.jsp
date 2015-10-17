<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%!User user = null;%>
<%!String username = "sssss";%>
<%
    String url = request.getScheme()+"://"+ request.getServerName()+":"+request.getServerPort()+request.getRequestURI();
    String query = request.getQueryString();
    if(query != null)
    {
    	   url += "?" + query; 
    }
	user = (User) session.getAttribute("user");
	if (null == user) {
		response.sendRedirect("login.jsp?from="+url);
	}else{
        username = user.getFullname();
    }
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<title>User Manager</title>
</head>
<body style="padding-top: 31px;">
  <nav role="navigation" class="navbar navbar-default navbar-fixed-top"
    style="min-height: 30px;">
    <div class="container" style="height: 30px;">
      <div style="line-height: 30px;">
        <a style="float: left;" href="<%=application.getContextPath()%>">lubocloud.com</a>
      </div>
      <div style="line-height: 30px;">
        <a style="float: right;" href="logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="member.jsp"><%=username%></a>
      </div>
    </div>
  </nav>
  <div class="container">
    <ul class="nav nav-tabs">
      <li role="presentation" class="active"><a
        href="usermanager.jsp">User</a></li>
      <li role="presentation"><a href="rolemanager.jsp">Role</a></li>
      <li role="presentation"><a href="setting.jsp">Setting</a></li>
    </ul>
    <%
    	UserDaoImpl userservice = new UserDaoImpl();
    	ArrayList<User> userlist = (ArrayList<User>) userservice.findAll();
    	if (null != userlist) {
    %>
    <br>
    <div class="table-responsive">
    <table
      class="table table-bordered table-striped table-hover table-condensed">
      <thead>
        <tr>
          <th>#</th>
          <th>Username</th>
          <th>Role</th>
          <th>Fullname</th>
          <th>Email</th>
          <th>Phone</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <%
        	for (int i = 0; i < userlist.size(); i++) {
        			User u = userlist.get(i);
        			out.println("<tr>");
        			out.println("<td>"+i+"</td>");
        			out.println("<td>"+u.getUsername()+"</td>");
        			out.println("<td>"+u.getRoletype()+"</td>");
        			out.println("<td>"+u.getFullname()+"</td>");
        			out.println("<td>"+u.getEmail()+"</td>");
        			out.println("<td>"+u.getPhone()+"</td>");
        			out.println("<td><button type=\"button\" value=\""+u.getId()+"\"class=\"deleteuser btn btn-danger btn-xs\">Delete</button></td>");
        			out.println("<td><button type=\"button\" value=\""+u.getId()+"\"class=\"userprofile btn btn-info btn-xs\">Profile</button></td>");
        			out.println("</tr>");
        		}
        %>
      </tbody>
    </table></div>
    <%
    	}
    %>
  </div>
  <script>
  $(".deleteuser").on("click",function(){
	  $.ajax({
		  "url": "<%=application.getContextPath()%>/usermanager?op=del&userid="+this.value,
		  "type": "get",
	  }).fail(function(){
		  alert("111111111");
	  });
  });
  </script>
</body>
</html>