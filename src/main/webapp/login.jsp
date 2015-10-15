<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%
	User user = (User) session.getAttribute("user");
	if (null != user) {
		response.sendRedirect("index.jsp");
	}

	String username = request.getParameter("username");
	String passwd = request.getParameter("passwd");
	if (null != username && !username.equals("")) {
		UserDaoImpl userservice = new UserDaoImpl();
		user = userservice.find(username);
		if (null != user && user.getPasswd().equals(passwd)) {
			session.setAttribute("user", user);
			response.sendRedirect("index.jsp");
		}
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>User Login</title>
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
    <form class="form-horizontal" role="form" name="login"
      action="login.jsp" method="post">
      <fieldset class="col-sm-4">
        <legend>Sign in</legend>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="username" class="form-control"
              id="username" placeholder="Username" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="passwd" class="form-control"
              id="passwd" placeholder="Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-6">
            <label><input type="checkbox" name="rememberme"
              class="" id="rememberme"> Remember Me</label>
          </div>
          <div class="col-sm-6 forget-password">
            <a>Forget Password</a>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-6">
            <button type="submit" class="btn btn-primary col-sm-10">Login</button>
          </div>
          <div class="col-sm-6 register">
            <a href="register.jsp">Register Now</a>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
</body>
</html>