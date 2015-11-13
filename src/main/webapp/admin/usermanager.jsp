<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Role"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.RoleDaoImpl"%>
<%
    String cururl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getRequestURI();
    String query = request.getQueryString();
    if (query != null) 
    {
        cururl += "?" + query; 
    }
    User user = (User) session.getAttribute("user");
    if (null == user) {
        response.sendRedirect("../login.jsp?from=" + cururl);
        return;
    }
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../asset/css/jquery-ui.css">
<link rel="stylesheet" href="../asset/css/jquery-ui.structure.css">
<link rel="stylesheet" href="../asset/css/jquery-ui.theme.css">
<link rel="stylesheet" href="../asset/css/bootstrap.css">
<link rel="stylesheet" href="../asset/css/bootstrap-theme.css">
<script type="text/javascript" src="../asset/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../asset/js/jquery-ui.js"></script>
<script type="text/javascript" src="../asset/js/bootstrap.js"></script>
<title>User Manager</title>
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
        <a style="float: left;" href="setting.jsp">Setting</a>
        <%
        }
        %>
      </div>
      <div style="line-height: 30px;">
      <% 
        if(user!=null){
      %>
        <a style="float: right;" href="../logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="../member.jsp">
        <% 
        if(null==user.getFullname()||"".equals(user.getFullname())){
            out.print(user.getUsername());
        }else{
            out.print(user.getFullname());
        }
        %>
        </a>
        <%
        }
        %>
      </div>
    </div>
  </nav>
  
  <div class="container">
    <ul class="nav nav-tabs">
      <li role="presentation" class="active"><a href="usermanager.jsp">User</a></li>
      <li role="presentation"><a href="rolemanager.jsp">Role</a></li>
      <li role="presentation"><a href="chnmanager.jsp">Channel</a></li>
      <li role="presentation"><a href="setting.jsp">Setting</a></li>
    </ul>
    <%
    	UserDaoImpl userservice = new UserDaoImpl();
    	ArrayList<User> userlist = (ArrayList<User>) userservice.findAll();
    	if (null != userlist) {
    %>
    <br>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_user btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_user btn btn-success">Add</button>
      </div>
    </div>
    <div class="table-responsive">
    <table id="userlist"
      class="table table-bordered table-striped table-hover table-condensed">
      <thead>
        <tr>
          <th>#</th>
          <th>Username</th>
          <th>Role</th>
          <th>Fullname</th>
          <th>Email</th>
          <th>Phone</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <%
            for (int i = 0; i < userlist.size(); i++) {
                RoleDaoImpl roleservice = new RoleDaoImpl();
                User u = userlist.get(i);
                String user_title = "";
                Role r = roleservice.find(u.getRoletype());
                if(r != null )
                {
                    user_title = r.getTitle();
                }
                out.println("<tr id=\"userlist_"+u.getId()+"\">");
                out.println("<td><input type=\"checkbox\" name=\"choose\" value=\""+u.getId()+"\"></td>");
                out.println("<td>"+u.getUsername()+"</td>");
                out.println("<td>"+user_title+"</td>");
                out.println("<td>"+u.getFullname()+"</td>");
                out.println("<td>"+u.getEmail()+"</td>");
                out.println("<td>"+u.getPhone()+"</td>");
                out.println("<td><button type=\"button\" value=\""+u.getId()+"\"class=\"deleteuser btn btn-danger btn-xs\">Delete</button></td>");
                out.println("<td><button type=\"button\" value=\"" + u.getId() + "\"class=\"edituser btn btn-info btn-xs\">Profile</button></td>");
                out.println("</tr>");
            }
        %>
      </tbody>
    </table>
    </div>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_user btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_user btn btn-success">Add</button>
      </div>
    </div>
    <%
        }
    %>
  </div>
  <div id="adddialog" title="Add user">
    <form class="form-horizontal" name="user_add" id="user_add" action="register.jsp"
      method="post">
      <fieldset>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="username" class="form-control"
              id="username" placeholder="Username" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="passwd" class="form-control"
              id="passwd" placeholder="Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="_passwd" class="form-control"
              id="_passwd" placeholder="Conform Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <label>User Type: 
              <select name="usertype">
              </select>
            </label>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="email" name="email" class="form-control"
              id="email" placeholder="E-mail" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="fullname" class="form-control"
              id="fullname" placeholder="Full Name" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="phone" class="form-control"
              id="phone" placeholder="Phone" required="required">
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <div id="deletedialog" title="Delete user"></div>
  <div id="editdialog" title="Edit user profile">
    <form class="form-horizontal" name="user_edit" id="user_edit" method="post">
      <fieldset>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="username" class="form-control"
              id="username" placeholder="Username" required="required" disabled="disabled">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="passwd" class="form-control"
              id="passwd" placeholder="Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="password" name="_passwd" class="form-control"
              id="_passwd" placeholder="Conform Password" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <label>User Type: 
              <select name="usertype">
              </select>
            </label>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="email" name="email" class="form-control"
              id="email" placeholder="E-mail" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="fullname" class="form-control"
              id="fullname" placeholder="Full Name" required="required">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="text" name="phone" class="form-control"
              id="phone" placeholder="Phone" required="required">
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <script>
    var cur_user = -1;
    $(function(){
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
                    var add_user_info = $("#user_add").serialize();
                    $.ajax({
                        "url": "<%=application.getContextPath()%>/usermanager?op=add",
                        "type": "get",
                        "data": add_user_info,
                        "dataType": "json",
                    }).fail(function(){
                        alert("connect "+this.url+" failed!");
                    }).success(function(data){
                        var str = "<tr id=\"userlist_"+data.userid+"\">" 
                                   + "<td><input type=\"checkbox\" name=\"choose\" value=\""+data.userid+"\"></td>" 
                                   + "<td>" + $("#user_add input:text[name='username']").val() + "</td>" 
                                   + "<td>" + $("#user_add select option:selected").html() + "</td>"
                                   + "<td>" + $("#user_add input:text[name='fullname']").val() + "</td>" 
                                   + "<td>" + $("#user_add input[name='email']").val() + "</td>" 
                                   + "<td>" + $("#user_add input:text[name='phone']").val() + "</td>"
                                   + "<td><button type=\"button\" value=\"" + data.userid + "\"class=\"deleteuser btn btn-danger btn-xs\">Delete</button></td>" 
                                   + "<td><button type=\"button\" value=\"" + data.userid + "\"class=\"edituser btn btn-info btn-xs\">Profile</button></td>" 
                                   + "</tr>";
                        $("#userlist").append(str);
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
                    if(cur_user > 0){
                        $.ajax({
                            "url": "<%=application.getContextPath()%>/usermanager?op=del&userid="+cur_user,
                            "type": "get",
                        }).fail(function(){
                            alert("delete failed!");
                        }).success(function(){
                            $("tr[id=userlist_"+cur_user+"]").remove();
                        });
                    }else{
                        $("#userlist :checked").each(function(){
                            var id = $(this).val();
                            $.ajax({
                                "url": "<%=application.getContextPath()%>/usermanager?op=del&userid="+id,
                                "type": "get",
                            }).fail(function(){
                                alert("delete failed!");
                            }).success(function(){
                                $("tr[id=userlist_"+id+"]").remove();
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
                    var add_user_info = $("#user_edit").serialize();
                    $.ajax({
                        "url": "<%=application.getContextPath()%>/usermanager?op=edit&userid="+ cur_user,
                        "type" : "get",
                        "data": add_user_info,
                        "dataType": "json",
                    }).fail(function() {
                        alert("connect " + this.url + " failed!");
                    }) .success(function(data) {
                        $("tr[id=userlist_"+ cur_user+ "] td:nth-child(3)").text($("#user_edit select option:selected").text());
                        $("tr[id=userlist_"+ cur_user+ "] td:nth-child(4)").text($("#user_edit input:text[name='fullname']").val());
                        $("tr[id=userlist_"+ cur_user+ "] td:nth-child(5)").text($("#user_edit input[name='email']").val());
                        $("tr[id=userlist_"+ cur_user+ "] td:nth-child(6)").text($("#user_edit input:text[name='phone']").val());
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
    $(".menu_add_user").on("click", function() {
        cur_user = -1;
        $.ajax({
            "url": "<%=application.getContextPath()%>/rolemanager?op=list",
            "type": "get",
        }).fail(function(){
            alert("connect "+this.url+" failed!");
        }).success(function(data){
            var str =  "";
            $(data.list).each(function(){
                str += "<option value=\""+this["type"]+"\">"+this["title"]+"</option>";
            });
            $("#user_add select[name='usertype']").append(str);
        });
        $("#adddialog").dialog("open");
    });
    $(".menu_delete_user").on("click", function() {
        cur_user = -1;
        $("#deletedialog").dialog("open");
    });
    $(document).on("click", ".deleteuser", function() {
        cur_user = this.value;
        $("#deletedialog").dialog("open");
    });
    $(document).on("click",".edituser",function() {
        cur_user = this.value;
        $("#user_edit input:text[name='username']").val($("tr[id=userlist_" + cur_user + "] td:nth-child(2)").text());
        $("#user_edit input:text[name='fullname']").val($("tr[id=userlist_" + cur_user + "] td:nth-child(4)").text()).select();
        $("#user_edit input[name='email']").val($("tr[id=userlist_" + cur_user + "] td:nth-child(5)").text());
        $("#user_edit input:text[name='phone']").val($("tr[id=userlist_" + cur_user + "] td:nth-child(6)").text());
        $("#user_edit select[name='usertype']").children().remove();
        $.ajax({
            "url": "<%=application.getContextPath()%>/rolemanager?op=list",
            "type": "get",
        }).fail(function(){
            alert("connect "+this.url+" failed!");
        }).success(function(data){
            var str =  "";
            $(data.list).each(function(){
                str += "<option value=\""+this["type"]+"\">"+this["title"]+"</option>";
            });
            $("#user_edit select[name='usertype']").append(str);
            var ele = $("#user_edit select[name='usertype']").children();
            $(ele).each(function(){
                if($(this).text()==$("tr[id=userlist_" + cur_user + "] td:nth-child(3)").text())
                {
                    $(this).attr("selected",true);
                }
            });
        });
        $("#editdialog").dialog("open");
    });
  </script>
</body>
</html>