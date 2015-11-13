<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%
    String cururl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String query = request.getQueryString();
    if (query != null) 
    {
        cururl += "?" + query; 
    }
    User user = (User) session.getAttribute("user");
	if (null == user) {
		response.sendRedirect("../login.jsp?from=" + cururl);
	    return;
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../asset/css/bootstrap.css">
<link rel="stylesheet" href="../asset/css/bootstrap-theme.css">
<script type="text/javascript" src="../asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../asset/js/bootstrap.js"></script>
<title>System Config</title>
</head>
<body style="padding-top: 31px;">

  <nav role="navigation" class="navbar navbar-default navbar-fixed-top"
    style="min-height: 30px;">
    <div class="container" style="height: 30px;">
      <div style="line-height: 30px;">
        <a style="float: left;" href="<%=application.getContextPath()%>">lubocloud.com</a>
        <% 
          if(user!=null && "wangdm".equals(user.getUsername())){
        %>
        <div style="float: left;">&nbsp;|&nbsp;</div>
        <a style="float: left;" href="setting.jsp">Setting</a>
        <%
        }
        %>
      </div>
      <div style="line-height: 30px;">
      <% 
        if(user!=null){
      %>
        <a style="float: right;" href="../logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="../member.jsp">
        <% 
        if(null==user.getFullname()||"".equals(user.getFullname())){
            out.print(user.getUsername());
        }else{
            out.print(user.getFullname());
        }
        %>
        </a>
        <%
        }
        %>
      </div>
    </div>
  </nav>
  
  <div class="container">
    <ul class="nav nav-tabs">
      <li role="presentation"><a href="usermanager.jsp">User</a></li>
      <li role="presentation"><a href="rolemanager.jsp">Role</a></li>
      <li role="presentation"><a href="chnmanager.jsp">Channel</a></li>
      <li role="presentation" class="active"><a href="setting.jsp">Setting</a></li>
    </ul>
  </div>
</body>
</html>