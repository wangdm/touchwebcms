<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.UserDao"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.NavMenu"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.NavMenuDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseCategoryDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CourseCategory"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseCategoryDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CoursePropertyGroupDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CoursePropertyGroup"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CoursePropertyGroupDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CoursePropertyItemDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.CoursePropertyItem"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CoursePropertyItemDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseDao"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Course"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.CourseDaoImpl"%>
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
      for(int j=0; j<8; j++)
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
            <a href="<%=application.getContextPath()%>/course.jsp?courseId=<%=course.getId() %>"><img alt="<%=course.getName() %>" src="<%=course.getLogo()%>"/></a>
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
  
  <%
  String tmpStr = request.getParameter("parentId");
  int parentCatId = 0;
  if(tmpStr != null && !"".equals(tmpStr))
  {
      parentCatId = Integer.parseInt(tmpStr);
  }
  CourseCategoryDao catDao = new CourseCategoryDaoImpl();
  ArrayList<CourseCategory> catlist = (ArrayList<CourseCategory>)catDao.findChildCategory(parentCatId);
  String color[] = {"#900900","#20673F","#0064B7","#257397",};
  for(int i=0; i<catlist.size(); i++)
  {
      CourseCategory cat = catlist.get(i);
  %>
  <div id="cat_<%=cat.getCatId() %>" class="area <%if(i%2==0){out.print("even");}else{out.print("odd");} %>">
    <div class="container">
      <div class="course-contain">
        <div class="cat" style="background:<%=color[i%4] %>">
      <%
      if(parentCatId<=0)
      {
      %>
          <div class="cat-parent"><h2><a href="<%=application.getContextPath()%>?parentId=<%=cat.getCatId()%>"><%=cat.getCatName() %></a></h2></div>
          <div class="cat-child">
            <ul>
          <%
          CourseCategoryDao childCatDao = new CourseCategoryDaoImpl();
          ArrayList<CourseCategory> childCatlist = (ArrayList<CourseCategory>)childCatDao.findChildCategory(cat.getCatId());
          for(int j=0; j<childCatlist.size(); j++)
          {
              CourseCategory childCat = childCatlist.get(j);
          
          %>
              <li class="cat-child-item"><a href="<%=application.getContextPath()%>?parentId=<%=cat.getCatId()%>#cat_<%=childCat.getCatId() %>"><%=childCat.getCatName() %></a></li>
          <%
          }
          %>
            </ul>
          </div>
      <%
      }else{
      %>
          <div class="cat-parent"><h2><a href="<%=application.getContextPath()%>/course.jsp?parentId=<%=cat.getCatId()%>"><%=cat.getCatName() %></a></h2></div>
          <div class="cat-prop">
            <ul>
          <%
          CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
          CoursePropertyGroup propGroup = propGroupDao.findCoursePropertyNavGroup(cat.getCatId());
          if(propGroup != null)
          {
              CoursePropertyItemDao propItemDao = new CoursePropertyItemDaoImpl();
              ArrayList<CoursePropertyItem> propItemlist = (ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(propGroup.getPropGroupId());
              for(int j=0; j<propItemlist.size(); j++)
              {
                  CoursePropertyItem propItem = propItemlist.get(j);
          %>
              <li class="cat-prop-item"><a href="<%=application.getContextPath()%>/course.jsp?parentId=<%=cat.getCatId()%>&property_tags=<%=propItem.getPropItemName()%>"><%=propItem.getPropItemName() %></a></li>
          <%
              }
          }
          %>
            </ul>
          </div>
      <%
      }
      %>
        </div>
      </div>
      
      <%
      {
      CourseDao courseDao = new CourseDaoImpl();
      ArrayList<Course> courselist = (ArrayList<Course>)courseDao.findCoursebyCategory(cat.getCatId());
      for(int j=0; j<7; j++)
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
  <%
  }
  %>
  
  <div class="area even">
    <div class="container">
      <div class="area-title">
        <div class="area-title-name">推荐讲师</div>
        <div class="area-title-more">更多</div>
      </div>
        <div class="lecturer-wrap">
        </div>
        <div class="lecturer-wrap">
        </div>
        <div class="lecturer-wrap">
        </div>
        <div class="lecturer-wrap course-hidden-4">
        </div>
        <div class="lecturer-wrap course-hidden-4 course-hidden-5">
        </div>
        <div class="lecturer-wrap">
        </div>
    </div>
  </div>
  <div class="area even">
    <div class="container">
      <div class="area-title">
        <div class="area-title-name">合作机构</div>
        <div class="area-title-more">更多</div>
      </div>
        <div class="agency-wrap">
        </div>
        <div class="agency-wrap">
        </div>
        <div class="agency-wrap">
        </div>
        <div class="agency-wrap course-hidden-4">
        </div>
        <div class="agency-wrap course-hidden-4 course-hidden-5">
        </div>
        <div class="agency-wrap">
        </div>
    </div>
  </div>
  
  <div class="bottom"></div>
  
  <div id="goTop"><a></a>
  </div>
  
</body>
<script type="text/javascript">
	$(function(){
    	$('#myCarousel').carousel({
    	    interval: false
    	});      
	
    	$(".course").on("mouseover", function(){
    	    $(this).addClass("course-hover");
    	});   
    
        $(".course").on("mouseout", function(){
            $(this).removeClass("course-hover");
        });
    	
        $("#goTop").on("click", function() {
            $("html,body").animate({scrollTop:0}, 300);
        });
	});
</script>
</html>