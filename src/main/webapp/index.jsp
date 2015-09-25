<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.domain.User" %>
<%! String username; %>
<%! String fullname; %>
<%! String email; %>
<%! String phone; %>
    <%
    User user = (User)session.getAttribute("user");
    if(null==user)
    {
        response.sendRedirect("login.jsp");
    }else{
        username = user.getUsername();
        fullname = user.getFullname();
        email = user.getEmail();
        phone = user.getPhone();
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
    <table>
        <tr>
            <td>用户名：</td>
            <td><%= username %></td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><%= fullname %></td>
        </tr>
        <tr>
            <td>E-mail：</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td> 电话：</td>
            <td><%= phone %></td>
        </tr>
    </table>
    
    <a href="logout.jsp">退出</a>
</div>
</body>
</html>