<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Course"%>
<%@ page import="com.lubocluod.touchwebcms.dao.CourseDao"%>
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
    if(user==null)
    {
        return;
    }
%>
<div class="col-sm-12">
  <div class="showcourse-head">
  </div>
  <div class="course-list">
  <%
      CourseDao courseDao = new CourseDaoImpl();
      ArrayList<Course> courselist = (ArrayList<Course>)courseDao.findCoursebyUser(user.getId());
      if(courselist!=null && !courselist.isEmpty())
      {
          for(int i=0; i<courselist.size(); i++)
          {
              Course course = courselist.get(i);
  %>
    <div class="course-item">
      <div class="course-img">
        <a href="<%=application.getContextPath()%>/course.jsp?courseId=<%=course.getId() %>"><img alt="<%=course.getName() %>" src="<%=course.getLogo() %>" width="200"/></a>
      </div>
      <div class="course-info">
        <div class="course-title"><a href="<%=application.getContextPath()%>/course.jsp?courseId=<%=course.getId() %>"><%=course.getName() %></a></div>
        <div class="course-lesson">共<%=course.getTotalLesson() %>课时(已更新<%=course.getCurLesson() %>课时)</div>
        <div class="course-stat">
          <span>学习人数  <%=course.getStudyCnt()%></span>
          <span class="delimiter"></span>
          <span>收藏人数  <%=course.getFavoriteCnt()%></span>
          <span class="delimiter"></span>
          <span>综合评分  <%=(float)course.getGrade()/10%></span>
        </div>
        <div class="course-tag"><a>一年级</a><a>语文</a></div>
      </div>
      <div class="course-cmd">
        <i class="course-cmd-modify iconfont">&#xe604;</i>
        <i class="course-cmd-delete iconfont">&#xe607;</i>
        <i class="course-cmd-sleect iconfont">&#xe605;</i>
      </div>
    </div>
  <%
          }
      }
  %>
  </div>
</div>
<script>
  $(function(){
      $(".course-cmd-sleect").on("click", function() {
          $(this).parent().parent().toggleClass("select");
          $(this).toggleClass("select");
      });
      $(".course-cmd-modify").on("click", function() {
      });
      $(".course-cmd-delete").on("click", function() {
      });
  });

</script>