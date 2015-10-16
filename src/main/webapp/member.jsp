<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%!User user=null;%>
<%
    user = (User) session.getAttribute("user");
    if (null == user) {
        response.sendRedirect("login.jsp");
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
<title></title>
</head>
<body>
  <nav role="navigation" class="navbar navbar-default navbar-fixed-top" style="min-height: 30px;">
    <div class="container" style="height: 30px;">
    <div style="line-height: 30px;">
    <a style="float: left;" href="<%=application.getContextPath() %>">lubocloud.com</a>
    <div style="float: left;" >&nbsp;|&nbsp;</div>
    <a style="float: left;" href="setting.jsp">Setting</a>
    </div>
    <div style="line-height: 30px;">
    <a style="float: right;"  href="logout.jsp">Logout</a>
    <div style="float: right;" >&nbsp;|&nbsp;</div>
    <a style="float: right;"  href="member.jsp"><%=user.getUsername() %></a>
    </div>
    </div>
  </nav>
</body>
</html>