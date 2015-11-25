<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Channel"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.ChannelDaoImpl"%>
<%
    String cururl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String query = request.getQueryString();
    if (query != null) 
    {
        cururl += "?" + query; 
    }
    User user = (User) session.getAttribute("user");
    if(user==null)
    {
        response.sendRedirect("login.jsp?from=" + cururl);
        return;
    }
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/jquery-ui.css">
<link rel="stylesheet" href="asset/css/jquery-ui.structure.css">
<link rel="stylesheet" href="asset/css/jquery-ui.theme.css">
<link rel="stylesheet" href="asset/css/bootstrap.css">
<link rel="stylesheet" href="asset/css/bootstrap-theme.css">
<link rel="stylesheet" href="asset/css/index.css">
<link rel="stylesheet" href="asset/css/member.css">
<link rel="stylesheet" href="asset/css/iconfont.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/jquery-ui.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<style type="text/css">
.form-error{
    visibility:hidden;
}
</style>
<title></title>
</head>
<body style="padding-top: 31px;">
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
        <a style="float: right;" href="member.jsp"><%=user.getFullname() %>
        </a>
      <%
        }
      %>
      </div>
    </div>
  </nav>
  
  <div class="container">
  
    <div class="col-sm-3" style="padding:6px;">
     <div class="user-nav-wrap">
        <div class="user-nav">
          <div class="user-nav-main"><i class="iconfont">&#xe620;</i><span>我的课程</span></div>
          <ul class="user-nav-sub">
            <li class="active" data-action="showcourse">所有课程</li>
            <li data-action="createcourse">创建课程</li>
            <li data-action="showvideo">所有视频</li>
            <li data-action="uploadvideo">上传视频</li>
          </ul>
        </div>
        <div class="user-nav">
          <div class="user-nav-main"><i class="iconfont">&#xe615;</i><span>我的消息</span></div>
          <ul class="user-nav-sub">
            <li data-action="notification">通知</li>
            <li data-action="message">私信</li>
          </ul>
        </div>
        <div class="user-nav">
          <div class="user-nav-main"><i class="iconfont">&#xe641;</i><span>我的资料</span></div>
          <ul class="user-nav-sub">
            <li data-action="profile">基本资料</li>
<!--        <li data-action="contact">联系方式</li>         -->
            <li data-action="password">修改密码</li>
          </ul>
        </div>
     </div>
    </div>
    
    <div class="col-sm-9" style="padding:6px;">
      <div class="action-content-wrap">
        <div class="action-content">
        </div>
      </div>
    </div>
    
  </div>

<script>
  function doAction(action){
      $.ajax({
          "url": "<%=application.getContextPath()%>/useraction?action="+action,
          "type": "get",
      }).success(function(data){
          $(".action-content").html(data);
          if(data.result=="failed"){
              checkreslut =  false;
          }
      }).fail(function(){
          alert("connect "+this.url+" failed!");
      });
  }
  $(function(){
      $(".user-nav .user-nav-main").on("click", function() {
          $(".user-nav li.active").removeClass("active");
          $(this).parent().find("li").first().addClass("active");
          var action = $(this).parent().find("li").first().attr("data-action");
          doAction(action);
      });
      $(".user-nav li").on("click", function() {
          var action = $(this).attr("data-action");
          $(".user-nav li.active").removeClass("active");
          $(this).addClass("active");
          doAction(action);
      });
  });
  doAction("showcourse");

</script>
</body>
</html>