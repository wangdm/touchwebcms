<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.domain.User" %>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl" %>
<%! boolean register = true; %>
    <%
    String username = request.getParameter("username");
    if(null!=username && !username.equals(""))
    {
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%
if(register)
{
%>
    <form name="regiter" action="register.jsp" method="post">
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
            <td>确认密码：</td>
            <td><input type="password" name="_passwd" /></td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><input type="text" name="fullname" /></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" name="email" /></td>
        </tr>
        <tr>
            <td>电话：</td>
            <td><input type="text" name="phone" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="注册"/></td>
        </tr>
    </table>
    </form>
    <%
}else{
	boolean register = true; 
    %>
    register successfully.
    <%
}
    %>
</div>
</body>
</html>