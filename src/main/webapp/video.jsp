<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%!String username;%>
<%!String fullname;%>
<%!String email;%>
<%!String phone;%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String query = request.getQueryString();
    if (query != null) 
    {
        url += "?" + query; 
    }
    User user = (User) session.getAttribute("user");
    if (null == user) {
        response.sendRedirect("login.jsp?from=" + url);
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

<style type="text/css">
.video_head{
    margin-top:10px;
    background:#fff;
    height:90px;
}
.video_nav{
    margin:8px 0px 8px 10px;
}
.video_title{
    margin-left:10px;
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

  <div class="container">
    <div class="col-sm-12 col-xs-12 video_head" style="padding:0px;">
        <div class="video_nav"><a>首页</a> > <a>兴趣爱好</a> > <a>摄影</a> > <a href="course.jsp">beautiful-china</a></div>
        <div class="video_title"><h2>beautiful-china</h2></div>
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
            <li>111111111111111111111111</li>
            <li>222222222222222222222222</li>
            <li>333333333333333333333333</li>
            <li>111111111111111111111111</li>
            <li>222222222222222222222222</li>
            <li>333333333333333333333333</li>
            <li>111111111111111111111111</li>
            <li>222222222222222222222222</li>
            <li>333333333333333333333333</li>
            <li>111111111111111111111111</li>
            <li>222222222222222222222222</li>
            <li>333333333333333333333333</li>
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
  
</body>
<script type="text/javascript">
    jwplayer.key = "5pcniCatLq4er9Y40pB9uiPEPVo3rxWLoqpQCw==";
    var playerInstance = jwplayer("player");
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
      var h = $("#player").parent().width()*9/16;
      $("#player_list").css("height", h);
      $("#taggle_list").css("height", h);
      
      $("#taggle_list").on("click", function() {
          $("#taggle_list").parent().toggleClass("col-sm-9");
          $("#taggle_list").parent().toggleClass("col-sm-12");
          $("#player_list").parent().toggleClass("col-sm-3");
          $("#player_list").parent().toggleClass("hidden-sm");
          h = $("#player").parent().width()*9/16;
          $("#taggle_list").css("height", h);
      });
      $(window).resize(function() {
          h = $("#player").parent().width()*9/16;
          $("#taggle_list").css("height", h);
          $("#player_list").css("height", h);
      });
      
      
    });
</script>
</html>