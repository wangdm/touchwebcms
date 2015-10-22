<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%!boolean register = true;%>
<%
	String username = request.getParameter("username");
	if (null != username && !username.equals("")) {
		User user = new User();
		UserDaoImpl userservice = new UserDaoImpl();
		user.setUsername(username);
		user.setPasswd(request.getParameter("passwd"));
		user.setFullname(request.getParameter("fullname"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		userservice.add(user);
		register = false;
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>User Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<style type="text/css">
.forget-password, .register {
	text-align: right;
}
</style>
</head>

<body>
  <div class="container">
    <%
    	if (register) {
    %>
    <form class="form-horizontal" name="regiter" action="register.jsp"
      method="post">
      <fieldset class="col-md-10 col-sm-12 col-xs-12">
        <legend>Register</legend>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="text" name="username" class="form-control"
              id="username" placeholder="User Name" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-danger">The username is already existed</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="password" name="passwd" class="form-control"
              id="passwd" placeholder="Password" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-danger">Password must be six char at least</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="password" name="_passwd" class="form-control"
              id="_passwd" placeholder="Conform Password" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-danger">Password don't match</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="email" name="email" class="form-control"
              id="email" placeholder="E-mail" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-danger">The E-mail is taken by other</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="text" name="fullname" class="form-control"
              id="fullname" placeholder="Full Name" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-default"></span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-6 col-sm-7 col-xs-12">
            <input type="text" name="phone" class="form-control"
              id="phone" placeholder="Phone" required="required">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
          	<span class="label label-danger">The phone is taken by other</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-1 col-md-2 col-sm-2 col-xs-2">
            <button type="submit" class="btn btn-success col-sm-12">Register</button>
          </div>
          <div class="col-md-4 col-sm-5 col-xs-10 register">
            Already have an account? <a href="login.jsp">Login</a>
          </div>
        </div>
      </fieldset>
    </form>
    <%
    	} else {
    		boolean register = true;
    %>
    register successfully.
    <%
    	}
    %>
  </div>
</body>
</html>