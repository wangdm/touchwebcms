<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.setAttribute("user", null);
    session.invalidate();
    String url = request.getHeader("Referer");
    if(url==null || "".equals(url))
    {
        response.sendRedirect("login.jsp");
    }else{
        response.sendRedirect(url);
    }
    %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Insert title here</title>
</head>
<body>

</body>
</html>