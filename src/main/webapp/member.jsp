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
    <div class="col-md-offset-1 col-md-10 col-sm-12 col-xs-12">
      <div id="tabs" class="col-sm-12">
        <ul>
          <li><a href="#tabs-1">My Profile</a></li>
          <li><a href="#tabs-2">My Live</a></li>
          <li><a href="#tabs-3">Change Password</a></li>
        </ul>
        <div id="tabs-1">
          <form class="form-horizontal" name="profile" action="" id="profile"
            method="post">
            <fieldset class="col-sm-12">
              <div class="form-group">
                <label for="fullname" class="control-label col-md-2 col-sm-3 col-xs-12">Full Name:</label>
                <div class="col-md-6 col-sm-5 col-xs-12">
                  <input type="text" name="fullname" class="form-control" value="<%=user.getFullname() %>"
                    id="fullname" placeholder="Full Name" required="required" disabled="disabled" onblur='formcheck(this,"fullname", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger"></span>
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="control-label col-md-2 col-sm-3 col-xs-12">E-mail:</label>
                <div class="col-md-6 col-sm-5 col-xs-12">
                  <input type="text" name="email" class="form-control" value="<%=user.getEmail() %>"
                    id="email" placeholder="E-mail" required="required" disabled="disabled" onblur='formcheck(this,"email", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger form-error">The E-mail is taken by other</span>
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="control-label col-md-2 col-sm-3 col-xs-12">Phone:</label>
                <div class="col-md-6 col-sm-5 col-xs-12">
                  <input type="text" name="phone" class="form-control" value="<%=user.getPhone() %>"
                    id="phone" placeholder="Phone" required="required" disabled="disabled" onblur='formcheck(this,"phone", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger form-error">The phone is taken by other</span>
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-2 col-md-6 col-sm-offset-3 col-sm-5 col-xs-12">
                  <button type="button" id="editprofile" value="edit" class="btn btn-success">Edit</button>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
        <div id="tabs-2" class="col-sm-12">
            <%
                ChannelDaoImpl chnservice = new ChannelDaoImpl();
                ArrayList<Channel> chnlist = (ArrayList<Channel>) chnservice.findByUser(user.getId());
                if (null != chnlist) {
            %>
            <div  class="col-sm-12" style="float: none;height:40px">
                <button style="float: right;" type="button"
                  class="menu_delete_chn btn btn-danger">Delete</button>
                <span style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <button style="float: right;" type="button"
                  class="menu_add_chn btn btn-success">Add</button>
                  </div>
            <div class="table-responsive">
              <table id="chnlist"
                class="table table-bordered table-striped table-hover table-condensed">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Push URI</th>
                    <th>Pull URL</th>
                    <th>Status</th>
                    <th>Create Time</th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <%
                      for (int i = 0; i < chnlist.size(); i++) {
                          Channel c = chnlist.get(i);
                          String user_name = "";
                          UserDaoImpl userservice = new UserDaoImpl();
                          User u = userservice.find(c.getUserid());
                          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                          if(u != null )
                          {
                              user_name = u.getUsername();
                          }
                          out.println("<tr id=\"chnlist_"+c.getId()+"\">");
                          out.println("<td><input type=\"checkbox\" name=\"choose\" value=\""+c.getId()+"\"></td>");
                          out.println("<td>"+c.getName()+"</td>");
                          out.println("<td>"+c.getPushuri()+"</td>");
                          out.println("<td>"+c.getPulluri()+"</td>");
                          out.println("<td>"+c.getStatus()+"</td>");
                          out.println("<td>"+sdf.format(c.getCreatetime())+"</td>");
                          out.println("<td><button type=\"button\" value=\""+c.getId()+"\"class=\"deletechn btn btn-danger btn-xs\">Delete</button></td>");
                          out.println("<td><button type=\"button\" value=\"" + c.getId() + "\"class=\"editchn btn btn-info btn-xs\">Edit</button></td>");
                          out.println("</tr>");
                      }
                  %>
                </tbody>
              </table>
            </div>
            <%
                }
            %>
        </div>
        <div id="tabs-3">
          <form class="form-horizontal" name="changepwd" action=""
            method="post">
            <fieldset class="col-sm-12">
              <div class="form-group">
                <div class="col-md-offset-1 col-md-7 col-sm-8 col-xs-12">
                  <input type="password" name="oldpasswd" class="form-control"
                    id="oldpasswd" placeholder="Old Password" required="required" onblur='formcheck(this,"oldpasswd", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger form-error">Password is error!</span>
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-1 col-md-7 col-sm-8 col-xs-12">
                  <input type="password" name="passwd" class="form-control"
                    id="passwd" placeholder="New Password" required="required" onblur='formcheck(this,"passwd", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger form-error">Password must be six char at least</span>
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-1 col-md-7 col-sm-8 col-xs-12">
                  <input type="password" name="_passwd" class="form-control"
                    id="_passwd" placeholder="Conform Password" required="required" onblur='formcheck(this,"_passwd", this.value)'>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                  <span class="label label-danger form-error">Entered passwords does not match</span>
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-1 col-md-2 col-sm-2 col-xs-4">
                  <button type="button"  id="editpasswd" class="btn btn-success">Confirm</button>
                </div>
                <div class=" col-md-4 col-sm-5 col-xs-7 ">
                  <span id="pwd-result" class="form-error alert alert-danger">Error!</span>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div id="adddialog" title="Add Channel">
    <form class="form-horizontal" name="chn_add" id="chn_add" action=""
      method="post">
      <fieldset>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="titlename" class="form-control"
              id="titlename" placeholder="Title" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="pushuri" class="form-control"
              id="pushuri" placeholder="Push URI" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="pulluri" class="form-control"
              id="pulluri" placeholder="Pull URI" required="required">
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <div id="deletedialog" title="Delete Channel"></div>
  <div id="editdialog" title="Edit channel profile">
    <form class="form-horizontal" name="chn_edit" id="chn_edit" method="post">
      <fieldset>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="titlename" class="form-control"
              id="titlename" placeholder="Title" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="pushuri" class="form-control"
              id="pushuri" placeholder="Push URI" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="pulluri" class="form-control"
              id="pulluri" placeholder="Pull URI" required="required">
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <script>
  var cur_chn = -1;
  $(function(){
      $( "#tabs" ).tabs();
      $( "#adddialog" ).dialog({ 
          autoOpen: false,
          resizable: false,
          modal: true,
          buttons: 
          [{
              text: "Add",
              class: "btn btn-info",
              click: function() {
                  $( this ).dialog( "close" );
                  var add_chn_info = $("#chn_add").serialize();
                  $.ajax({
                      "url": "<%=application.getContextPath()%>/chnmanager?op=add",
                      "type": "get",
                      "data": add_chn_info,
                      "dataType": "json",
                  }).fail(function(){
                      alert("connect "+this.url+" failed!");
                  }).success(function(data){
                      var str = "<tr id=\"chnlist_"+data.chnid+"\">" 
                                 + "<td><input type=\"checkbox\" name=\"choose\" value=\""+data.chnid+"\"></td>" 
                                 + "<td>" + $("#chn_add input:text[name='titlename']").val() + "</td>" 
                                 + "<td>" + $("#chn_add input:text[name='pushuri']").val() + "</td>" 
                                 + "<td>" + $("#chn_add input:text[name='pulluri']").val() + "</td>" 
                                 + "<td>0</td>"
                                 + "<td>" + new Date() + "</td>"
                                 + "<td><button type=\"button\" value=\"" + data.chnid + "\"class=\"deletechn btn btn-danger btn-xs\">Delete</button></td>" 
                                 + "<td><button type=\"button\" value=\"" + data.chnid + "\"class=\"editchn btn btn-info btn-xs\">Edit</button></td>" 
                                 + "</tr>";
                      $("#chnlist").append(str);
                  });
              }
          },
          {
              text: "Cancel",
              class: "btn btn-default",
              click: function() {
              $( this ).dialog( "close" );
              }
          }]
      });
      $( "#deletedialog" ).dialog({ 
          autoOpen: false,
          resizable: false,
          modal: true,
          buttons: 
          [{
              text: "Delete",
              class: "btn btn-danger",
              click: function() {
                  $( this ).dialog( "close" );
                  if(cur_chn > 0){
                      $.ajax({
                          "url": "<%=application.getContextPath()%>/chnmanager?op=del&chnid="+cur_chn,
                          "type": "get",
                      }).fail(function(){
                          alert("delete failed!");
                      }).success(function(){
                          $("tr[id=chnlist_"+cur_chn+"]").remove();
                      });
                  }else{
                      $("#chnlist :checked").each(function(){
                          var id = $(this).val();
                          $.ajax({
                              "url": "<%=application.getContextPath()%>/chnmanager?op=del&chnid="+id,
                              "type": "get",
                          }).fail(function(){
                              alert("delete failed!");
                          }).success(function(){
                              $("tr[id=chnlist_"+id+"]").remove();
                          });
                      });
                  }
              }
          },
          {
              text: "Cancel",
              class: "btn btn-default",
              click: function() {
                 $( this ).dialog( "close" );
              }
          }]
      });
      $( "#editdialog" ).dialog({ 
          autoOpen: false,
          resizable: false,
          modal: true,
          buttons: 
          [{
              text: "Modify",
              class: "btn btn-info",
              click: function() {
                  $( this ).dialog( "close" );
                  var add_chn_info = $("#chn_edit").serialize();
                  $.ajax({
                      "url": "<%=application.getContextPath()%>/chnmanager?op=edit&chnid="+ cur_chn,
                      "type" : "get",
                      "data": add_chn_info,
                      "dataType": "json",
                  }).fail(function() {
                      alert("connect " + this.url + " failed!");
                  }) .success(function(data) {
                      $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(2)").text($("#chn_edit input:text[name='titlename']").val());
                      $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(4)").text($("#chn_edit input:text[name='pushuri']").val());
                      $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(5)").text($("#chn_edit input:text[name='pulluri']").val());
                  });
              }
          }, {
              text : "Cancel",
              class : "btn btn-default",
              click : function() {
                  $(this).dialog("close");
              }
          } ]
      });
  });
  var checkreslut = false;
  function formcheck(ele,type,value){
      if(type=="username"){
          if(value.length==0){
              $(ele).parent().parent().find("span").text("The username can't be empty!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
          }else
          if(value.length<6){
              $(ele).parent().parent().find("span").text("The username must be six word at least!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
         }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
             $.ajax({
                 "url": "<%=application.getContextPath()%>/usermanager?op=check&type="+type+"&value="+value,
                 "type": "get",
             }).success(function(data){
                 if(data.result=="failed"){
                     $(ele).parent().parent().find("span").text(data.errorinfo);
                     $(ele).parent().parent().find("span").css("visibility", "visible");
                     checkreslut =  false;
                 }
             });
         }
      }else if(type=="passwd"){
          if(value.length<6){
              $(ele).parent().parent().find("span").text("The password must be six word at least!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
         }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
         }
          
      }else if(type=="oldpasswd"){
          if(value.length==0){
              $(ele).parent().parent().find("span").text("Please input the old password!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
         }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
         }
          
      }else if(type=="_passwd"){
          if($("input[name=passwd]").val()!=$("input[name=_passwd]").val()){
              $(ele).parent().parent().find("span").text("Password don't match!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
         }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
         }
      }else if(type=="fullname"){
          if(value.length==0){
              $(ele).parent().parent().find("span").text("The fullname can't be empty!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
          }else{
              $(ele).parent().parent().find("span").css("visibility", "hidden");
          }
          
      }else if(type=="email"){
          if(value.length==0){
              $(ele).parent().parent().find("span").text("The email can't be empty!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
          }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
             $.ajax({
                 "url": "<%=application.getContextPath()%>/usermanager?op=check&type="+type+"&value="+value,
                 "type": "get",
             }).success(function(data){
                 if(data.result=="failed"){
                     $(ele).parent().parent().find("span").text(data.errorinfo);
                     $(ele).parent().parent().find("span").css("visibility", "visible");
                     checkreslut =  false;
                 }
             });
         }
          
      }else if(type=="phone"){
          if(value.length==0){
              $(ele).parent().parent().find("span").text("The phone can't be empty!");
              $(ele).parent().parent().find("span").css("visibility", "visible");
              checkreslut =  false;
          }else{
             $(ele).parent().parent().find("span").css("visibility", "hidden");
             $.ajax({
                 "url": "<%=application.getContextPath()%>/usermanager?op=check&type="+type+"&value="+value,
                 "type": "get",
             }).success(function(data){
                 if(data.result=="failed"){
                     $(ele).parent().parent().find("span").text(data.errorinfo);
                     $(ele).parent().parent().find("span").css("visibility", "visible");
                     checkreslut =  false;
                 }
             });
         }
      }
  }

  function profileCheck(){
      checkreslut = true;
      $("#profile input").each(function(){
          $(this).blur();
      });
      return checkreslut;
  }
  function passwordCheck(){
      checkreslut = true;
      $("#changepwd input").each(function(){
          $(this).blur();
      });
      return checkreslut;
  }
  $("#editprofile").on("click",function(){
      if($("#editprofile").text()=="Edit"){
          $("#editprofile").text("Save");
          $("form[name=profile] input").each(function(){
              $(this).removeAttr("disabled");
          });
      }else{
          profileCheck();
          if(checkreslut==true){
              var edit_profile_info = $("#profile").serialize();
              $.ajax({
                  "url": "<%=application.getContextPath()%>/usermanager?op=edit&userid="+ <%=user.getId()%>,
                  "type" : "get",
                  "data": edit_profile_info,
                  "dataType": "json",
              }).fail(function() {
                  alert("connect " + this.url + " failed!");
              }) .success(function(data) {
                  if(data.result=="success"){
                      $("#editprofile").text("Edit");
                      $("form[name=profile] input").each(function(){
                          $(this).attr("disabled","disabled");
                      });
                  }
              });
          }
      }
  });
  $("#editpasswd").on("click",function(){
      passwordCheck();
      if(checkreslut==true){
        var edit_pwd_info = $("form[name=changepwd]").serialize();
        $.ajax({
            "url": "<%=application.getContextPath()%>/usermanager?op=changepwd&userid="+ <%=user.getId()%>,
            "type" : "get",
            "data": edit_pwd_info,
            "dataType": "json",
        }).fail(function() {
            alert("connect " + this.url + " failed!");
        }) .success(function(data) {
            if(data.result=="success"){
                $("#pwd-result").removeClass("form-error alert-danger");
                $("#pwd-result").addClass("alert-success");
                $("#pwd-result").text("Password change successfully.");
            }else{
                $("#pwd-result").removeClass("form-error alert-success");
                $("#pwd-result").addClass("alert-danger");
                $("#pwd-result").text(data.errorinfo);
            }
        });
      }
  });
  $(".menu_add_chn").on("click", function() {
      cur_chn = -1;
      $("#adddialog").dialog("open");
  });
  $(".menu_delete_chn").on("click", function() {
      cur_chn = -1;
      $("#deletedialog").dialog("open");
  });
  $(document).on("click", ".deletechn", function() {
      cur_chn = this.value;
      $("#deletedialog").dialog("open");
  });
  $(document).on("click",".editchn",function() {
      cur_chn = this.value;
      $("#chn_edit input:text[name='titlename']").val($("tr[id=chnlist_" + cur_chn + "] td:nth-child(2)").text()).select();
      $("#chn_edit input:text[name='pushuri']").val($("tr[id=chnlist_" + cur_chn + "] td:nth-child(3)").text());
      $("#chn_edit input:text[name='pulluri']").val($("tr[id=chnlist_" + cur_chn + "] td:nth-child(4)").text());
      $("#editdialog").dialog("open");
  });
  </script>
</body>
</html>