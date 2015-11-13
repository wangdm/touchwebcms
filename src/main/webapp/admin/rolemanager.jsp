<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
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
<title>Role Manager</title>
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
      <li role="presentation"><a href="usermanager.jsp">User</a></li>
      <li role="presentation" class="active"><a href="rolemanager.jsp">Role</a></li>
      <li role="presentation"><a href="chnmanager.jsp">Channel</a></li>
      <li role="presentation"><a href="setting.jsp">Setting</a></li>
    </ul>
    <%
    	RoleDaoImpl roleservice = new RoleDaoImpl();
    	ArrayList<Role> rolelist = (ArrayList<Role>) roleservice.findAll();
    	if (null != rolelist) {
    %>
    <br>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_role btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_role btn btn-success">Add</button>
      </div>
    </div>
    <div class="table-responsive">
    <table id="rolelist"
      class="table table-bordered table-striped table-hover table-condensed">
      <thead>
        <tr>
          <th>#</th>
          <th>Type</th>
          <th>Title</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <%
            for (int i = 0; i < rolelist.size(); i++) {
                Role r = rolelist.get(i);
                out.println("<tr id=\"rolelist_" + r.getId() + "\">");
                out.println("<td><input type=\"checkbox\" name=\"choose\" value=\""+r.getId()+"\"></td>");
                out.println("<td>" + r.getId() + "</td>");
                out.println("<td>" + r.getTitle() + "</td>");
                out.println("<td><button type=\"button\" value=\"" + r.getId() + "\"class=\"deleterole btn btn-danger btn-xs\">Delete</button></td>");
                out.println("<td><button type=\"button\" value=\"" + r.getId() + "\"class=\"editrole btn btn-info btn-xs\">Edit</button></td>");
                out.println("</tr>");
            }
        %>
      </tbody>
    </table>
    </div>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_role btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_role btn btn-success">Add</button>
      </div>
    </div>
    <%
    	}
    %>
  </div>
  <div id="adddialog" title="Add role">
    <form class="form-horizontal" name="role_add" id="role_add"  method="post">
      <fieldset>
        <input type="text" name="rolename" class="form-control"
        id="rolename" placeholder="Rolename" required="required">
      </fieldset>
    </form>
  </div>
  <div id="deletedialog" title="Delete role"></div>
  <div id="editdialog" title="Edit role profile">
    <form class="form-horizontal" name="role_edit" id="role_edit"  method="post">
      <fieldset>
        <input type="text" name="rolename" class="form-control"
        id="rolename" placeholder="Rolename" required="required">
      </fieldset>
    </form>
  </div>
  <script>
  var cur_role = -1;
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
                    var add_role_info = $("#role_add").serialize();
                    $.ajax({
                        "url": "<%=application.getContextPath()%>/rolemanager?op=add",
                        "type": "get",
                        "data": add_role_info,
                        "dataType": "json",
                    }).fail(function(){
                        alert("connect "+this.url+" failed!");
                    }).success(function(data){
                        var str =  "<tr id=\"rolelist_"+data.roleid+"\">" 
                                   + "<td><input type=\"checkbox\" name=\"choose\" value=\""+data.roleid+"\"></td>" 
                                   + "<td>"+data.roleid+"</td>" 
                                   + "<td>"+$("#role_add input:text[name='rolename']").val()+"</td>" 
                                   + "<td><button type=\"button\" value=\""+data.roleid+"\"class=\"deleterole btn btn-danger btn-xs\">Delete</button></td>" 
                                   + "<td><button type=\"button\" value=\""+data.roleid+"\"class=\"editrole btn btn-info btn-xs\">Edit</button></td>" 
                                   + "<\tr>";
                        $("#rolelist").append(str);
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
                    if(cur_role > 0){
                        $.ajax({
                            "url": "<%=application.getContextPath()%>/rolemanager?op=del&roleid="+cur_role,
                            "type": "get",
                        }).fail(function(){
                            alert("delete failed!");
                        }).success(function(){
                            $("tr[id=rolelist_"+cur_role+"]").remove();
                        });
                    }else{
                        $("#rolelist :checked").each(function(){
                            var id = $(this).val();
                            $.ajax({
                                "url": "<%=application.getContextPath()%>/rolemanager?op=del&roleid="+id,
                                "type": "get",
                            }).fail(function(){
                                alert("delete failed!");
                            }).success(function(){
                                $("tr[id=rolelist_"+id+"]").remove();
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
                    var add_role_info = $("#role_edit").serialize();
                    $.ajax({
                        "url": "<%=application.getContextPath()%>/rolemanager?op=edit&roleid="+ cur_role,
                        "type" : "get",
                        "data": add_role_info,
                        "dataType": "json",
                    }).fail(function() {
                        alert("connect " + this.url + " failed!");
                    }) .success(function(data) {
                        $("tr[id=rolelist_"+ cur_role+ "] td:nth-child(3)").text($("#role_edit input:text[name='rolename']").val());
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
    $(".menu_add_role").on("click", function() {
        cur_role = -1;
        $("#role_add input:text[name='rolename']").select();
        $("#adddialog").dialog("open");
    });
    $(".menu_delete_role").on("click", function() {
        cur_role = -1;
        $("#deletedialog").dialog("open");
    });
    $(document).on("click", ".deleterole", function() {
        cur_role = this.value;
        $("#deletedialog").dialog("open");
    });
    $(document).on("click", ".editrole", function() {
        cur_role = this.value;
        $("#role_edit input:text[name='rolename']").val($("tr[id=rolelist_" + cur_role + "] td:nth-child(3)").text()).select();
        $("#editdialog").dialog("open");
    });
  </script>
</body>
</html>