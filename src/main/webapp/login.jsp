<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.domain.User" %>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl" %>
    <% 
    User user = (User)session.getAttribute("user");
    if(null!=user)
    {
        response.sendRedirect("index.jsp");
    }
    
    String username = request.getParameter("username");
    String passwd = request.getParameter("passwd");
    if(null!=username && !username.equals(""))
    {
        UserDaoImpl userservice = new UserDaoImpl();
        user = userservice.find(username);
        if(null!=user && user.getPasswd().equals(passwd)){
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        }
    }
    %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
    <form name="login" action="login.jsp" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" /></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="passwd" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录"/></td>
            <td><input type="button" value="注册" onclick="onregister()"/></td>
        </tr>
    </table>
    </form>
</div>
</body>
<script type="text/javascript">
function onregister(){
	window.location.href = "register.jsp";
}
</script>
</html>