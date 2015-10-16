<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%!String username;%>
<%!String fullname;%>
<%!String email;%>
<%!String phone;%>
<%
	User user = (User) session.getAttribute("user");
	if (null == user) {
		response.sendRedirect("login.jsp");
	} else {
		username = user.getUsername();
		fullname = user.getFullname();
		email = user.getEmail();
		phone = user.getPhone();
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>TouchCMS Live</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<script type="text/javascript" src="asset/jwplayer/jwplayer.js"></script>
</head>
<body style="padding-top: 30px;">
  <nav role="navigation" class="navbar navbar-default navbar-fixed-top"
    style="min-height: 30px;">
    <div class="container" style="height: 30px;">
      <div style="line-height: 30px;">
        <a style="float: left;" href="setting.jsp">Setting</a>
      </div>
      <div style="line-height: 30px;">
        <a style="float: right;" href="logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="member.jsp"><%=username%></a>
      </div>
    </div>
  </nav>
  <div class="container">
    <div class="col-sm-10 col-sm-offset-1">
      <div id="myPlayer">Loading the player ...</div>
    </div>
  </div>
</body>
<script type="text/javascript">
	jwplayer.key = "5pcniCatLq4er9Y40pB9uiPEPVo3rxWLoqpQCw==";
	var playerInstance = jwplayer("myPlayer");
	playerInstance.setup({
		file : "asset/jwplayer/Beautiful_China.mp4",
		aspectratio : "16:9",
		width : "100%",
		height : 360,
		advertising : {
			client : "vast",
			tag : "http://adserver.com/vastTag.xml"
		}
	});
</script>
</html>