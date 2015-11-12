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
        <a style="float: left;" href="setting.jsp">Setting</a>
      </div>
      <div style="line-height: 30px;">
        <a style="float: right;" href="logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="member.jsp"><%=username%></a>
      </div>
    </div>
  </nav>

  <div class="navmenu-bg">
    <div class="navmenu container">
      <ul>
        <li><a class="selected" href="<%=application.getContextPath()%>">首页</a></li>
        <li><a href="<%=application.getContextPath()%>">普教课程</a></li>
        <li><a href="<%=application.getContextPath()%>">高校课程</a></li>
        <li><a href="<%=application.getContextPath()%>">职业教育</a></li>
        <li><a href="<%=application.getContextPath()%>">兴趣爱好</a></li>
        <li><a href="<%=application.getContextPath()%>">全部课程</a></li>
        <li><a href="<%=application.getContextPath()%>">讲师/机构</a></li>
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
	$(function(){
	$('#myCarousel').carousel({
	    interval: false
	});
	});
</script>
</html>