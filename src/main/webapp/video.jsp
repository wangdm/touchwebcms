<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.UserDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Video"%>
<%@ page import="com.lubocluod.touchwebcms.dao.VideoDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.VideoDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Course"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Lesson"%>
<%@ page import="com.lubocluod.touchwebcms.dao.LessonDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.LessonDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.NavMenu"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.NavMenuDaoImpl"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
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
    Course curCourse = courseservice.find(video.getCourseId());
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
<link rel="stylesheet" href="asset/css/course.css">
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
    padding-left:20px;
    display: block;
    list-style-type:none;
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
#player_list ul li a
{
    color: rgb(143,143,143);
}
#player_list ul li a:hover
{
    color: #337ab7;
}
#player_list ul li a.active
{
    color: #337ab7;
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
        <div class="video_nav"><a>首页</a> > <a>兴趣爱好</a> > <a>摄影</a> > <a href="course.jsp?courseId=<%=curCourse.getId()%>"><%=curCourse.getName() %></a></div>
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
                 if(tmpVideo.getId()==videoId){
                     out.println("<li><a class=\"active\" href=\""+application.getContextPath()+"/video.jsp?videoId="+tmpVideo.getId()+"\">"+(i+1)+". "+tmpVideo.getTitle()+"</a></li>");
                 }else{
                     out.println("<li><a href=\""+application.getContextPath()+"/video.jsp?videoId="+tmpVideo.getId()+"\">"+(i+1)+".  "+tmpVideo.getTitle()+"</a></li>");
                 }
             }
         }
         %>
          </ul>
      </div>
    </div>
  </div>
  
  <div class="container">

  <div class="col-lg-9 col-xs-12" style="padding:0px;">
    <div class="course_info_wrap">
      <ul id = "myTab" class = "nav nav-tabs">
         <li>
            <a href = "#course-description" data-toggle = "tab">课程详情</a>
         </li>
         <li class = "active">
            <a href = "#course-catalog" data-toggle = "tab">课程目录</a>
         </li>
         <li>
            <a href = "#course-comment" data-toggle = "tab">课程评论</a>
         </li>
      </ul>
      
      <div id = "myTabContent" class = "tab-content">
         <div class = "tab-pane fade" id = "course-description">
           <%=curCourse.getDetail() %>
         </div>
         <div class = "tab-pane fade in active" id = "course-catalog">
           <div class="catalog-head">
             <div class="catalog-cur" style="
             <%
             float per = (float)curCourse.getCurLesson()/curCourse.getTotalLesson()*100;
             if(per>20){
                 out.print("right:"+per+"%;");
             }else{
                 out.print("left:"+per+"%;");
             }
             Calendar c = Calendar.getInstance();
             c.setTime(curCourse.getUpdateTime());
             %>
             "><%=c.get(Calendar.MONTH)+1 %>月<%=c.get(Calendar.DAY_OF_MONTH) %>日更新</div>
             <div class="catalog-progress"><span class="catalog-progress-cur" style="width:<%=per %>%;"></span></div>
             <%
             c.setTime(curCourse.getStartTime());
             %>
             <div class="catalog-start-date"><%=c.get(Calendar.MONTH)+1 %>月<%=c.get(Calendar.DAY_OF_MONTH) %>日开课</div>
             <%
             c.setTime(curCourse.getEndTime());
             %>
             <div class="catalog-end-date"><%=c.get(Calendar.MONTH)+1 %>月<%=c.get(Calendar.DAY_OF_MONTH) %>日结课</div>
           </div>
         <%
         LessonDao lessonDao = new LessonDaoImpl();
         ArrayList<Lesson> lessonlist = (ArrayList<Lesson>)lessonDao.findCourseLesson(curCourse.getId());
         if(lessonlist!=null && lessonlist.size()>0)
         {
             for(int i=0; i<lessonlist.size(); i++)
             {
                 Lesson lesson = lessonlist.get(i);
         %>
           <div class="catalog-item">
            <div class="catalog-num1"><div class="catalog-num2">第<span class="catalog-num"><%=i+1 %></span>节</div></div>
            <div class="catalog-info">
              <div class="catalog-item-head">
                <div class="catalog-title">
                  <a <%if(lesson.getStatus()==1){out.print("href=\""+application.getContextPath()+"/video.jsp?videoId="+lesson.getVideoId()+"\"");} %>><%=lesson.getTitle()%></a>
                </div>
                <div class="catalog-time"><%if(lesson.getStatus()==1){out.print(lesson.getDuration());}else{out.print("[暂未授课]");}%></div>
              </div>
              <div class="catalog-desc"><%=lesson.getDesc()==null?lesson.getTitle():lesson.getDesc()%></div>
            </div>
           </div>
         <%
             }
         }
         %>
         </div>
         <div class = "tab-pane fade" id = "course-comment">
            <div  class="comment-head">
              <div class="comment-head-grade">
                <div class="comment-head-num"><%=((float)curCourse.getGrade())/10 %></div>
                <div class="comment-head-lable">综合评分</div>
              </div>
              <div class="comment-head-info">
                <div class="comment-head-grade1">
                    <span>课程与描述相符 :</span>
                    <div class="comment-grade-bg"><div class="comment-grade-value" style="width:<%=curCourse.getGrade()%>%"></div></div>
                    <span class="comment-grade1-num"></span>
                </div>
                <div class="comment-head-grade1">
                    <span>老师的讲解表达 :</span>
                    <div class="comment-grade-bg"><div class="comment-grade-value" style="width:<%=curCourse.getGrade()%>%"></div></div>
                    <span class="comment-grade1-num"></span>
                </div>
                <div class="comment-head-grade1">
                    <span>老师的课前服务 :</span>
                    <div class="comment-grade-bg"><div class="comment-grade-value" style="width:<%=curCourse.getGrade()%>%"></div></div>
                    <span class="comment-grade1-num"></span>
                </div>
              </div>
            </div>
            
            <div class="comment-wrap">
              <div class="comment-user"></div>
              <div class="comment">
                <div class="comment-title">
                  <div class="comment-grade-bg"><div class="comment-grade-value" style="width:85%;"></div></div>
                  <div class="comment-time">2015-11-19 18:11:22</div>
                </div>
                <div class="comment-content">很好，很强大</div>
              </div>
            </div>
         </div>
      </div>
    </div>
  </div>
  
  <div class="col-sm-3 hidden-xs" style="padding:0px;">
    <div class="boutique-box">
      <%
      {
      String tmpStr = request.getParameter("parentId");
      int parentCatId = 0;
      if(tmpStr != null && !"".equals(tmpStr))
      {
          parentCatId = Integer.parseInt(tmpStr);
      }
      CourseDao courseDao = new CourseDaoImpl();
      ArrayList<Course> courselist = (ArrayList<Course>)courseDao.findCoursebyCategory(parentCatId);
      for(int j=0; j<6; j++)
      {
      %>
      <div class="course-contain<%if(j>=5)out.print(" course-hidden-2");if(j>=5)out.print(" course-hidden-3");if(j>=4)out.print(" course-hidden-1"); %>">
      <%
          if(j<courselist.size())
          {
              Course course = courselist.get(j);
              UserDao courseUserDao = new UserDaoImpl();
              User courseUser = courseUserDao.find(course.getUid());
              String showUserName = null;
              if(!"".equals(courseUser.getFullname()))
              {
                  showUserName = courseUser.getFullname();
              }else{
                  showUserName = courseUser.getUsername();
              }
      %>
        <div class="course">
          <div class="course-img">
            <a href="<%=application.getContextPath()%>/course.jsp?courseId=<%=course.getId() %>"><img src="<%=course.getLogo()%>"/></a>
            <div class="course-title-bg"></div>
            <div class="course-title-name"><a href="<%=application.getContextPath()%>/course.jsp?courseId=<%=course.getId() %>"><%=course.getName() %></a></div>
         </div>
          <div class="course-info">
            <div class="course-owner">
              <div class="course-person"><span class="course-person-item">讲师：</span><span class="course-person-value"><a href="<%=application.getContextPath()%>/member.jsp?uid=<%=courseUser.getId()%>"><%=showUserName %></a></span></div>
              <div class="course-agency"><span class="course-agency-item">机构：</span><span class="course-agency-value"><a href="<%=application.getContextPath()%>/member.jsp?uid=<%=courseUser.getId()%>"><%=showUserName %></a></span></div>
            </div>
            <div class="course-price"><%if(course.getPrice()<=0){out.print("<span class=\"course-price-free\">免费</span>");}else{out.print("<span class=\"course-price-value\">¥"+course.getPrice()+"</span>");} %></div>
          </div>
          <div class="course-stat">
            <div class="course-grade">
              <div class="course-grade-img">
                <div class="course-grade-value" style="width:<%=course.getGrade() %>%;"></div>
              </div>
              <div class="course-grade-num"><% out.print(((float)course.getGrade())/10); %></div>
            </div>
            <div class="course-study"><span class="course-study-value"><%=course.getStudyCnt() %></span><span class="course-study-item">人学习</span></div>
          </div>
        </div>
      <%
          }else{
      %>
        <div class="course">
          <div class="course-img">
          <a href="<%=application.getContextPath()%>/course.jsp"><img src="asset/image/lubocloud.jpg"/></a>
            <div class="course-title-bg"></div>
          </div>
          <div class="course-info">
            <div class="course-owner">
              <div class="course-person"><span class="course-person-item">讲师：</span><span class="course-person-value"><a>admin</a></span></div>
              <div class="course-agency"><span class="course-agency-item">机构：</span><span class="course-agency-value"><a>Lubocloud</a></span></div>
            </div>
            <div class="course-price"><span class="course-price-free">免费</span></div>
          </div>
          <div class="course-stat">
            <div class="course-grade">
              <div class="course-grade-img">
                <div class="course-grade-value" style="width:50%;"></div>
              </div>
              <div class="course-grade-num">5.0</div>
            </div>
            <div class="course-study"><span class="course-study-value">0</span><span class="course-study-item">人学习</span></div>
          </div>
        </div>
      <%
          }
      %>
      </div>
      <%
      }
      }
      %>
    </div>
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
      
      $(".catalog-item-head").on("click", function(){
          $(this).next().toggleClass("show");
      });   
      
      
    });
</script>
</html>