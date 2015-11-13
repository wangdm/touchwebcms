<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
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
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>讲师列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<link rel="stylesheet" href="asset/css/index.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<script type="text/javascript" src="asset/jwplayer/jwplayer.js"></script>

<style type="text/css">
.course_desc_wrap{
    margin-top:10px;
    background:#fff;
    overflow:hidden;
}
.video_nav{
    margin:10px 0px 10px 10px;
}
.video_title{
    margin-left:10px;
}

#player{
    float:left;
}
#taggle_list {
margin: auto;
    font-size: 12px;
    color: #fff;
    display: table-cell;
    vertical-align: middle;
    text-align: center;
}
#taggle_list {
    width:1%;
    height:auto;
    float:right;
    background-color:rgb(25,25,25);
}
#player_list{
    height:100%;
    color: rgb(143,143,143);
    background-color:rgb(43,43,43);
}
#player_list .player_list_title
{
    font-family: 'Microsoft YaHei';
    font-size: 18px;
    font-weight: normal;
    display: block;
    padding:15px 0px 10px 20px;
    border-bottom:2px solid rgb(25,25,25);
    
}
#player_list ul.player_list_item
{
    display: block;
    list-style-type:square;
    overflow-x:hidden;
    overflow-y:auto;
    height:auto;
}
#player_list ul li
{
    cursor:pointer;
    font-family: 'Microsoft YaHei';
    font-size: 16px;
    font-weight: normal;
    margin-top:5px;
    margin-bottom:5px;
}
.course_info_wrap{
    margin:10px 0px;
    padding:5px;
    background:#fff;
    min-height:300px;
    max-height:500px;
}
</style>

</head>

<body style="padding-top: 30px;">
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
  
  <div class="bottom"></div>
    
  <div id="goTop" style="position:fixed;right:20px;bottom:20px;z-index:100;width:36px;height:36px;background:#881;opacity:0.6;">
  </div>
  
</body>
<script type="text/javascript">
    $(function(){    
    
        $("#goTop").on("click", function() {
            $("html,body").animate({scrollTop:0}, 300);
        });
    });
</script>
</html>