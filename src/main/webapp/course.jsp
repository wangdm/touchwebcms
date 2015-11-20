<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.UserDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.NavMenu"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.NavMenuDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Course"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Video"%>
<%@ page import="com.lubocluod.touchwebcms.dao.VideoDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.VideoDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseCategoryDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CourseCategory"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseCategoryDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CoursePropertyGroupDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CoursePropertyGroup"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CoursePropertyGroupDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CoursePropertyItemDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CoursePropertyItem"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CoursePropertyItemDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%
    String tmpParam = null;
    String urlpath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String cururl = urlpath;
    String query = request.getQueryString();
    if (query != null) 
    {
        cururl += "?" + query; 
    }
    User user = (User) session.getAttribute("user");
    int parentId = -1, courseId = -1; 
    tmpParam = request.getParameter("parentId");
    if(tmpParam!=null && !"".equals(tmpParam))
    {
        parentId = Integer.parseInt(tmpParam);
    }
    tmpParam = request.getParameter("courseId");
    if(tmpParam!=null && !"".equals(tmpParam))
    {
        courseId = Integer.parseInt(tmpParam);
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
<link rel="stylesheet" href="asset/css/course.css">
<script type="text/javascript" src="asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.js"></script>
<script type="text/javascript" src="asset/jwplayer/jwplayer.js"></script>

<style type="text/css">
.video_head{
    margin-top:10px;
    background:#fff;
}
.video_nav{
    font-size:15px;
    padding:8px 0px 8px 10px;
    line-height: 30px;
    width:100%;
    height:100%;
}
.video_nav a{
    cursor:pointer;
    padding: 2px 5px;
    color:#000000;
}
.video_nav a:hover{
    color:#337ab7;
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

    <%
    if(courseId>0)
    {
        CourseDaoImpl courseservice = new CourseDaoImpl();
        Course curCourse = courseservice.find(courseId);
        UserDao curCourseUserDao = new UserDaoImpl();
        User curCourseUser = curCourseUserDao.find(curCourse.getUid());
        String curShowUserName = null;
        if(!"".equals(curCourseUser.getFullname()))
        {
            curShowUserName = curCourseUser.getFullname();
        }else{
            curShowUserName = curCourseUser.getUsername();
        }
    %>
  <div class="container">
    <div class="col-sm-12 col-xs-12 video_head" style="padding:0px;">
        <div class="video_nav"><a href="<%=application.getContextPath() %>">首页</a>
        <%
            CourseCategoryDao courseCatDao = new CourseCategoryDaoImpl();
            ArrayList<CourseCategory> courseCatlist = (ArrayList<CourseCategory>) courseCatDao.findParentCategory(curCourse.getCatId());
            if(courseCatlist!=null && courseCatlist.size()>0)
            {
                for(int i=courseCatlist.size()-1; i>=0; i--)
                {
                    CourseCategory tmpCat = courseCatlist.get(i);
                    out.print(" > <a href=\""+application.getContextPath()+"?parentId="+tmpCat.getCatId()+"\">"+tmpCat.getCatName()+"</a>");
                }
            }
        %>
        </div>
    </div>
    <div class="col-sm-12 col-xs-12" style="padding:0px;height:100%;">
      <div class="course_desc_wrap">
        <div class="col-md-6 col-xs-12 course-logo">
          <img src="<%=curCourse.getLogo() %>" style="width:100%;"/>
        </div>
        <div class="col-md-6 col-xs-12 course-detail">
          <div class="course_title"><h2><%=curCourse.getName() %></h2></div>
          <div class="course_statistics">
            <span>学习人数  <%=curCourse.getStudyCnt()%></span><span class="delimiter"></span><span>综合评分  <%=(float)curCourse.getGrade()/10%></span>
          </div>
          <div class="course_item">
            <span class="course_item_label">讲师： </span><span class="course_item_value"><a href="<%=application.getContextPath()%>/member.jsp?uid=<%=curCourseUser.getId()%>"><%=curShowUserName %></a></span>
          </div>
          <div class="course_item">
            <span class="course_item_label">机构： </span><span class="course_item_value"><a href="<%=application.getContextPath()%>/member.jsp?uid=<%=curCourseUser.getId()%>"><%=curShowUserName %></a></span>
          </div>
          <div class="course-desc">
            <div class="course-desc-title">简介</div>
            <span><%=curCourse.getDesc()%></span>
          </div>
          <div class="course_action_bar">
            <div class="doGreat course_action"><div class="icon-great"></div><span>赞(<%=curCourse.getGreatCnt() %>)</span></div>
            <div class="doFavorite course_action"><div class="icon-favorite"></div><span>收藏(<%=curCourse.getFavoriteCnt() %>)</span></div>
            <div class="doShare course_action"><div class="icon-share"></div><span>分享</span></div>
          </div>
            <div class="doStudy">参加课程</div>
        </div>
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
         <li>
            <a href = "#course-catalog" data-toggle = "tab">课程目录</a>
         </li>
         <li class = "active">
            <a href = "#course-comment" data-toggle = "tab">课程评论</a>
         </li>
      </ul>
      
      <div id = "myTabContent" class = "tab-content">
         <div class = "tab-pane fade" id = "course-description">
           <%=curCourse.getDetail() %>
         </div>
         <div class = "tab-pane fade" id = "course-catalog">
         <%
         VideoDao videoDao = new VideoDaoImpl();
         ArrayList<Video> videolist = (ArrayList<Video>)videoDao.findCourseVideo(curCourse.getId());
         if(videolist!=null && videolist.size()>0)
         {
             out.println("<ul>");
             for(int i=0; i<videolist.size(); i++)
             {
                 Video video = videolist.get(i);
                 out.println("<li><a href=\""+application.getContextPath()+"/video.jsp?videoId="+video.getId()+"\">"+video.getTitle()+"</a></li>");
             }
             out.println("<ul>");
         }
         %>
         </div>
         <div class = "tab-pane fade in active" id = "course-comment">
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
  <div class="col-lg-3 hidden-md" style="padding:0px;">
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
  <%
  }else{
  %>
  
  <div class="container">
    <div class="col-lg-9 col-xs-12" style="padding:0px;">
      <div class="search-tags-wrap">
          <% 
          {
          %>
        <div class="category">
          <div class="category-name">分类：</div>
          <div class="parent-cat">
          <% 
              String tmpStr = request.getParameter("parentId");
              int parentCatId = 0;
              if(tmpStr != null && !"".equals(tmpStr))
              {
                  parentCatId = Integer.parseInt(tmpStr);
              }
              CourseCategoryDao catDao = new CourseCategoryDaoImpl();
              CourseCategoryDao parentCatDao = new CourseCategoryDaoImpl();
              CourseCategory curcat = null;
              if(parentCatId>0)
              {
                  curcat = parentCatDao.find(parentCatId);
              }
              
              ArrayList<CourseCategory> parentCatlist = (ArrayList<CourseCategory>)parentCatDao.findChildCategory(0);
              for(int i=0; i<parentCatlist.size(); i++){
                  CourseCategory cat = parentCatlist.get(i);
                  if(cat.getCatId()==parentCatId || ( curcat!=null &&  cat.getCatId()==curcat.getParentId())){
                      out.print("<a class=\"active\" href=\"?parentId="+cat.getCatId()+"\">"+cat.getCatName()+"<span></span></a>");
                  }else{
                      out.print("<a href=\"?parentId="+cat.getCatId()+"\">"+cat.getCatName()+"</a>");
                  }
              }

          %>
          </div>
          <%
          if(curcat!=null)
          {
          %>
          <div class="child-cat">
          <% 
              ArrayList<CourseCategory> catlist = null;
              if(curcat.getParentId()==0){
                  catlist = (ArrayList<CourseCategory>)parentCatDao.findChildCategory(parentCatId);
              }else{
                  catlist = (ArrayList<CourseCategory>)parentCatDao.findChildCategory(curcat.getParentId());
              }
              for(int i=0; i<catlist.size(); i++){
                  CourseCategory cat = catlist.get(i);
                  if(cat.getCatId()==parentCatId){
                      out.print("<a class=\"active\" href=\"?parentId="+cat.getCatId()+"\">"+cat.getCatName()+"</a>");
                  }else{
                      out.print("<a href=\"?parentId="+cat.getCatId()+"\">"+cat.getCatName()+"</a>");
                  }
              }

          %>
          </div>
          <%
          }
          %>
          
        </div>
          <% 
              CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
              ArrayList<CoursePropertyGroup> propGrouplist = (ArrayList<CoursePropertyGroup>)propGroupDao.findCoursePropertyGroup(parentCatId);
              for(int i=0; i<propGrouplist.size(); i++)
              {
                  CoursePropertyGroup propGroup = propGrouplist.get(i);
          %>
        <div class="property">
          <div class="property-name"><span><%=propGroup.getPropGroupName() %>：</span></div>
          <div class="property-item">
          <%
              CoursePropertyItemDao propItemDao = new CoursePropertyItemDaoImpl();
              ArrayList<CoursePropertyItem> propItemlist = (ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(propGroup.getPropGroupId());
              for(int j=0; j<propItemlist.size(); j++){
                  CoursePropertyItem item = propItemlist.get(j);
                  out.print("<a>"+item.getPropItemName()+"</a>");
              }
          
          %>
          </div>
        </div>
          <%
              }
          }
          %>
      </div>
      <div class="search-order-wrap">
        <div class="search-sort">
          <span>排序：</span>
          <a data-value="time">发布时间</a>
          <a data-value="study">人气</a>
          <a data-value="great">好评</a>
          <a data-value="price">价格</a>
        </div>
        <div class="search-filter">
          <span>筛选：</span>
          <a data-value="final">更新完毕</a>
          <a data-value="live">正在直播</a>
          <a data-value="free">免费</a>
        </div>
        <div class="search-count">
        </div>
      </div>
      <script  type="text/javascript"></script>
      <div class="search-result-wrap">
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
      for(int j=0; j<15; j++)
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
    <div class="col-lg-3 hidden-xs" style="padding:0px;">
      <div class="boutique-box">
      <div class="boutique-title">推荐课程</div>
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
  <%
  }
  %>
  <div class="bottom"></div>
    
  <div id="goTop"><a></a>
  </div>
  
</body>
<script type="text/javascript">
    $(function(){   
        $("#goTop").on("click", function() {
            $("html,body").animate({scrollTop:0}, 300);
        });    
    
        $(".course").on("mouseover", function(){
            $(this).addClass("course-hover");
        });   
    
        $(".course").on("mouseout", function(){
            $(this).removeClass("course-hover");
        });
        var urlpath = "<%=urlpath %>";
        var urlquery = "<%=query %>";
        var loc = urlquery.split("&");
        var parentId = null;
        var property_tags = null;
        var sort = null;
        var filter_tags = null;
        for(var i=0; i<loc.length; i++){
            var param = loc[i].split("=");
            switch(param[0])
            {
            case "parentId":{
                parentId = param[1];break;
                }
            case "property_tags":{
                //console.log(param[1]);
                //console.log(decodeURIComponent(param[1]));
                property_tags = decodeURIComponent(param[1]).split("|");break;
                }
            case "sort":{
                sort = param[1];
                console.log(sort);break;
                }
            case "filter_tags":{
                filter_tags = decodeURIComponent(param[1]).split("|");break;
                }
            }
        }
        
        $(".property-item a").each(function(){
          console.log($(this).text());
          for(var i in property_tags)
          {
              if($(this).text()==property_tags[i]){
                  $(this).addClass("select");
              }
          }
        });
        $(".search-sort a").each(function(){
            if($(this).attr("data-value")==sort){
                $(this).addClass("active");
            }
          });
        $(".search-filter a").each(function(){
            for(var i in filter_tags)
            {
                if($(this).attr("data-value")==filter_tags[i]){
                    $(this).addClass("select");
                }
            }
          });
        Array.prototype.indexOf = function(val) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == val) return i;
            }
            return -1;
        };
        Array.prototype.remove = function(val) {
            var index = this.indexOf(val);
            if (index > -1) {
                this.splice(index, 1);
            }
        };
        
        $(".property-item a").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            if(sort && sort.length>0){
                url += "&sort="+sort;
            }
            if(property_tags&&property_tags.length>0){
                url += "&property_tags="+encodeURIComponent(property_tags.join("|")+"|"+$(this).text());
            }else{
                url += "&property_tags="+encodeURIComponent($(this).text());
            }
            if(filter_tags&&filter_tags.length>0){
                url += "&filter_tags="+encodeURIComponent(filter_tags.join("|"));
            }
            window.location.href = url;
        });
        $(".property-item a.select").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            if(sort && sort.length>0){
                url += "&sort="+sort;
            }
            if(property_tags&&property_tags.length>0){
                property_tags.remove($(this).text());
                if(property_tags.length>0){
                    url += "&property_tags="+encodeURIComponent(property_tags.join("|"));
                }
            }
            if(filter_tags&&filter_tags.length>0){
                url += "&filter_tags="+encodeURIComponent(filter_tags.join("|"));
            }
            window.location.href = url;
        });
        
        $(".search-sort a").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            url += "&sort="+$(this).attr("data-value");
            if(property_tags&&property_tags.length>0){
                url += "&property_tags="+encodeURIComponent(property_tags.join("|"));
            }
            if(filter_tags&&filter_tags.length>0){
                url += "&filter_tags="+encodeURIComponent(filter_tags.join("|"));
            }
            window.location.href = url;
        });
        $(".search-sort a.active").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            if(property_tags&&property_tags.length>0){
                url += "&property_tags="+encodeURIComponent(property_tags.join("|"));
            }
            if(filter_tags&&filter_tags.length>0){
                url += "&filter_tags="+encodeURIComponent(filter_tags.join("|"));
            }
            window.location.href = url;
        });
        
        $(".search-filter > a").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            if(sort && sort.length>0){
                url += "&sort="+sort;
            }
            if(property_tags&&property_tags.length>0){
                url += "&property_tags="+encodeURIComponent(property_tags.join("|"));
            }
            if(filter_tags&&filter_tags.length>0){
                url += "&filter_tags="+encodeURIComponent(filter_tags.join("|")+"|"+$(this).attr("data-value"));
            }else{
                url += "&filter_tags="+encodeURIComponent($(this).attr("data-value"));
            }
            window.location.href = url;
        });
        $(".search-filter > a.select").on("click", function(){
            var url = urlpath+"?";
            if(parentId.length>0){
                url += "parentId="+parentId;
            }
            if(sort && sort.length>0){
                url += "&sort="+sort;
            }
            if(property_tags&&property_tags.length>0){
                url += "&property_tags="+encodeURIComponent(property_tags.join("|"));
            }
            if(filter_tags&&filter_tags.length>0){
                filter_tags.remove($(this).attr("data-value"));
                if(filter_tags.length>0){
                    url += "&filter_tags="+encodeURIComponent(filter_tags.join("|"));
                }
            }
            window.location.href = url;
        });
    });
</script>
</html>