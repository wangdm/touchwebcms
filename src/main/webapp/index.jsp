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
<title>TouchCMS Live</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<link rel="stylesheet" href="asset/css/index.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<script type="text/javascript" src="asset/jwplayer/jwplayer.js"></script>
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

  <div id = "myCarousel" class = "carousel slide" style="max-height:400px">
   
   <!-- Carousel indicators -->
   <ol class = "carousel-indicators">
      <li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
      <li data-target = "#myCarousel" data-slide-to = "1"></li>
      <li data-target = "#myCarousel" data-slide-to = "2"></li>
   </ol>   
   
   <!-- Carousel items -->
   <div class = "carousel-inner">
      <div class = "item active">
         <img src = "http://www.tutorialspoint.com/bootstrap/images/slide1.png" alt = "First slide"  style="max-height:400px;text-align:center">
         <div class = "carousel-caption">This Caption 1</div>
      </div>
      
      <div class = "item">
         <img src = "http://www.tutorialspoint.com/bootstrap/images/slide2.png" alt = "Second slide"  style="max-height:400px;text-align:center">
         <div class = "carousel-caption">This Caption 2</div>
      </div>
      
      <div class = "item">
         <img src = "http://www.tutorialspoint.com/bootstrap/images/slide3.png" alt = "Third slide"  style="max-height:400px;text-align:center">
         <div class = "carousel-caption">This Caption 3</div>
      </div>
   </div>
   
   <!-- Carousel nav --> 
   <a class = "carousel-control left" href = "#myCarousel" data-slide = "prev">&lsaquo;</a>
   <a class = "carousel-control right" href = "#myCarousel" data-slide = "next">&rsaquo;</a>
</div> 
  
  <div class="area odd">
    <div class="container">
      <div class="area-title">
        <div class="area-title-name area-title-nameA"><a href="">推荐课程</a><em>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em><a href="">最新课程</a></div>
        <div class="area-title-more">更多</div>
      </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="area even">
    <div class="container">
        <div class="course-contain">
          <div class="cat" style="background:#900900"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="area odd">
    <div class="container">
        <div class="course-contain">
          <div class="cat" style="background:#20673F"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="area even">
    <div class="container">
        <div class="course-contain">
          <div class="cat" style="background:#0064B7"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="area odd">
    <div class="container">
        <div class="course-contain">
          <div class="cat" style="background:#257397"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="area even">
    <div class="container">
      <div class="area-title">
        <div class="area-title-name">推荐讲师</div>
        <div class="area-title-more">更多</div>
      </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
    </div>
  </div>
  <div class="area even">
    <div class="container">
      <div class="area-title">
        <div class="area-title-name">合作机构</div>
        <div class="area-title-more">更多</div>
      </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4">
          <div class="course"></div>
        </div>
        <div class="course-contain course-hidden-4 course-hidden-5">
          <div class="course"></div>
        </div>
        <div class="course-contain">
          <div class="course"></div>
        </div>
    </div>
  </div>
  
  <div class="bottom"></div>
  
  <div id="goTop" style="position:fixed;right:20px;bottom:20px;z-index:100;width:36px;height:36px;background:#881;opacity:0.6;">
  </div>
  
</body>
<script type="text/javascript">
	$(function(){
    	$('#myCarousel').carousel({
    	    interval: false
    	});      
	
        $("#goTop").on("click", function() {
            $("html,body").animate({scrollTop:0}, 300);
        });
	});
</script>
</html>