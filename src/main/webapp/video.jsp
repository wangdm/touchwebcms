<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Video"%>
<%@ page import="com.lubocluod.touchwebcms.dao.VideoDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.VideoDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Course"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseDaoImpl"%>
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
    String tmpParam = request.getParameter("videoId");
    if(tmpParam==null || "".equals(tmpParam)){
        tmpParam = "2";
    }
    int videoId = Integer.parseInt(tmpParam);
    VideoDao videoDao = new VideoDaoImpl();
    Video video =  videoDao.find(videoId);
    if(video == null)
    {
    }
    CourseDaoImpl courseservice = new CourseDaoImpl();
    Course course = courseservice.find(video.getCourseId());
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

<style type="text/css">
.video_head{
    margin-top:10px;
    background:#fff;
    height:90px;
}
.video_nav{
    font-size:15px;
    margin:8px 0px 8px 10px;
    line-height: 30px;
}
.video_nav a{
    cursor:pointer;
    padding: 2px 5px;
    color:#000000;
}
.video_nav a:hover{
    color:#337ab7;
}
.video_title{
    margin-left:10px;
}
.video_title h2{
    margin-top:10px;
}

.player_wrap{
  width:99%;
}
@media (max-width: 767px){
  .player_wrap{
    width:100%;
  }
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
        <a style="float: left;" href="admin/setting.jsp">Setting</a>
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
         tmpParam = request.getParameter("parentId");
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
                if(cururl==menu.getNavUrl()){
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
    <div class="col-sm-12 col-xs-12 video_head" style="padding:0px;">
        <div class="video_nav"><a>首页</a> > <a>兴趣爱好</a> > <a>摄影</a> > <a href="course.jsp?courseId=<%=course.getId()%>"><%=course.getName() %></a></div>
        <div class="video_title"><h2><%=video.getTitle() %></h2></div>
    </div>
  </div>
  
  <div class="container">
    <div class="col-sm-9 col-xs-12" style="padding:0px;margin:0px">
      <div class="player_wrap">
      <div id="player">Loading the player ...</div>
      </div>
      <div id="taggle_list" class="hidden-xs"><i style="height:auto"></i></div>
    </div>
    <div class="col-sm-3 hidden-xs" style="padding:0px;overflow:hidden;">
      <div id="player_list">
          <div class="player_list_title">播放列表</div>
          <ul class="player_list_item">
         <%
         ArrayList<Video> videolist = (ArrayList<Video>)videoDao.findCourseVideo(video.getCourseId());
         if(videolist!=null && videolist.size()>0)
         {
             for(int i=0; i<videolist.size(); i++)
             {
                 Video tmpVideo = videolist.get(i);
                 out.println("<li><a href=\""+application.getContextPath()+"/video.jsp?videoId="+tmpVideo.getId()+"\">"+tmpVideo.getTitle()+"</a></li>");
             }
         }
         %>
          </ul>
      </div>
    </div>
  </div>
  
  <div class="container">
  <div class="col-sm-9 col-xs-12" style="padding:0px;">
    <div class="course_info_wrap">
    <ul class="nav nav-tabs">
      <li role="presentation"><a href="">课程介绍</a></li>
      <li role="presentation" class="visible-xs"><a href="">课程目录</a></li>
      <li role="presentation" class="active"><a href="">课程评价</a></li>
    </ul>
    </div>
  </div>
  <div class="col-sm-3 hidden-xs" style="padding:0px;">
    <div class="boutique-box"></div>
  </div>
  </div>
  
  <div class="bottom hidden-xs"></div>
  
  <div id="goTop"><a></a>
  </div>
</body>
<script type="text/javascript">
    jwplayer.key = "5pcniCatLq4er9Y40pB9uiPEPVo3rxWLoqpQCw==";
    var playerInstance = jwplayer("player");
    playerInstance.setup({
        file : "<%=video.getVideoUri()%>",
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
      var h = $("#player").parent().width()*9/16;
      $("#player_list").css("height", h);
      $("#taggle_list").css("height", h);
      
      $("#goTop").on("click", function() {
          $("html,body").animate({scrollTop:0}, 300);
      });
      
      $("#taggle_list").on("click", function() {
          $("#taggle_list").parent().toggleClass("col-sm-9");
          $("#taggle_list").parent().toggleClass("col-sm-12");
          $("#player_list").parent().toggleClass("col-sm-3");
          $("#player_list").parent().toggleClass("hidden-sm");
          h = $("#player").parent().width()*9/16;
          $("#taggle_list").css("height", h);
          $("html,body").animate({scrollTop: $("#player").offset().top-35}, 300);
      });
      $(window).resize(function() {
          h = $("#player").parent().width()*9/16;
          $("#taggle_list").css("height", h);
          $("#player_list").css("height", h);
      });
      
      
    });
</script>
</html>