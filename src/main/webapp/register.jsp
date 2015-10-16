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
      <fieldset class="col-sm-4">
        <legend>Register</legend>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="username" class="form-control"
              id="username" placeholder="User Name" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="passwd" class="form-control"
              id="passwd" placeholder="Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="_passwd" class="form-control"
              id="_passwd" placeholder="Conform Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="email" name="email" class="form-control"
              id="email" placeholder="E-mail" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="fullname" class="form-control"
              id="fullname" placeholder="Full Name" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="phone" class="form-control"
              id="phone" placeholder="Phone" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-4">
            <button type="submit" class="btn btn-success col-sm-12">Register</button>
          </div>
          <div class="col-sm-8 register">
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