<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.NavMenu"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.NavMenuDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%
    String cururl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String query = request.getQueryString();
    if (query != null) 
    {
        cururl += "?" + query; 
    }
    String fromurl = request.getParameter("from");
    if(fromurl==null)
    {
     fromurl = "index.jsp"; 
    }
	User user = (User) session.getAttribute("user");
	boolean login_error = false;
	if (null != user) {
        response.sendRedirect(fromurl);
	}

	String username = request.getParameter("username");
	String passwd = request.getParameter("passwd");
	if (null != username && !username.equals("")) {
		UserDaoImpl userservice = new UserDaoImpl();
		user = userservice.find(username);
		if (null != user && user.getPasswd().equals(passwd)) {
			session.setAttribute("user", user);
			response.sendRedirect(fromurl);
		}else{
			login_error = true;
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
<link rel="stylesheet" href="asset/css/index.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>

<style type="text/css">
.forget-password, .register {
	text-align: right;
}
</style>
</head>

<body>

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
        <a style="float: right;" href="logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="member.jsp">
        <% 
        if(null==user.getFullname()||"".equals(user.getFullname())){
            out.print(user.getUsername());
        }else{
            out.print(user.getFullname());
        }
        %>
        </a>
        <%
        }else{
        %>
        <a style="float: right;" href="register.jsp">Register</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="login.jsp">Login</a>
        <%
        }
        %>
      </div>
    </div>
  </nav>

  <div class="navmenu-bg">
    <div class="navmenu container">
      <ul>
      <%
         int parentId = -1; 
         String tmpParam = request.getParameter("parentId");
         if(tmpParam!=null && !"".equals(tmpParam))
         {
             parentId = Integer.parseInt(tmpParam);
         }
         if(parentId<0){
      %>
        <li><a class="selected" href="<%=application.getContextPath()%>">首页</a></li>
        <%
         }else{
        %>
        <li><a href="<%=application.getContextPath()%>">首页</a></li>
        <%
            }
            NavMenuDaoImpl menuservice = new NavMenuDaoImpl();
            ArrayList<NavMenu> menulist = (ArrayList<NavMenu>)menuservice.findAll();
            if(menulist!=null && !menulist.isEmpty()){
                for(int i=0; i<menulist.size(); i++){
                    NavMenu menu = menulist.get(i);
                    if(cururl.equals(menu.getNavUrl())){
                        out.println("<li><a class=\"selected\" href=\""+menu.getNavUrl()+"\">"+menu.getNavName()+"</a></li>");
                    }else{
                        out.println("<li><a href=\""+menu.getNavUrl()+"\">"+menu.getNavName()+"</a></li>");
                    }
                }
            }
        %>
        <li style="float:right;padding:3px">
        <form name="search" action="search.jsp">
            <input name="keyword" type="search"  class="form-control" placeholder="Search Course"/>
        </form>
        </li>
      </ul>
    </div>
  </div>

  <div class="container">
  
    <div class="col-sm-6 hidden-xs" style="margin:50px 0px;">
      <div class="login-ad">
      <a><img  src="asset/image/20151111153451.jpg" style="width:100%;"/></a>
      </div>
    </div>
    
    <div class="col-sm-5 col-xs-12" style="margin:50px 0px;">
      <div class="login-area" style="background-color:rgb(255,255,255);padding:20px 10px;overflow:hidden;">
        <form class="form-horizontal" role="form" name="login"
          action="login.jsp" method="post">
          <fieldset class="col-xs-12">
            <legend>Sign in</legend>
            <%
            	if(login_error == true)
            	{
            %>
            <div class="form-group">
              <div class="col-xs-12 alert alert-danger">
                <span class="">Login Failed: Username and/or password was incorrect!</span>
              </div>
            </div>
            <%
            	}
            %>
            <input type="hidden"  name="from" value="<%=fromurl%>">
            <div class="form-group">
              <div class="col-sm-12 col-xs-12">
                <input type="text" name="username" class="form-control"
                  id="username" placeholder="Username" required="required">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12 col-xs-12">
                <input type="password" name="passwd" class="form-control"
                  id="passwd" placeholder="Password" required="required">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-6 col-xs-6">
                <label><input type="checkbox" name="rememberme"
                  class="" id="rememberme"> Remember Me</label>
              </div>
              <div class="col-sm-6 col-xs-6 forget-password">
                <a>Forget Password</a>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-6 col-xs-6">
                <button type="submit" class="btn btn-primary col-sm-10">Login</button>
              </div>
              <div class="col-sm-6 col-xs-6 register">
                <a href="register.jsp">Register Now</a>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
    
  </div>
  
    <div class="bottom"></div>
  
</body>
</html>