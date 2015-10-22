<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.UserDaoImpl"%>
<%@ page import="com.lubocluod.touchwebcms.entity.Channel"%>
<%@ page import="com.lubocluod.touchwebcms.dao.impl.ChannelDaoImpl"%>
<%!String username = "sssss";%>
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
        username = user.getFullname();
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
<title>User Manager</title>
</head>
<body style="padding-top: 31px;">
  <nav role="navigation" class="navbar navbar-default navbar-fixed-top"
    style="min-height: 30px;">
    <div class="container" style="height: 30px;">
      <div style="line-height: 30px;">
        <a style="float: left;" href="<%=application.getContextPath()%>">lubocloud.com</a>
      </div>
      <div style="line-height: 30px;">
        <a style="float: right;" href="logout.jsp">Logout</a>
        <div style="float: right;">&nbsp;|&nbsp;</div>
        <a style="float: right;" href="member.jsp"><%=username%></a>
      </div>
    </div>
  </nav>
  <div class="container">
    <ul class="nav nav-tabs">
      <li role="presentation"><a href="usermanager.jsp">User</a></li>
      <li role="presentation"><a href="rolemanager.jsp">Role</a></li>
      <li role="presentation" class="active"><a href="chnmanager.jsp">Channel</a></li>
      <li role="presentation"><a href="setting.jsp">Setting</a></li>
    </ul>
    <%
        ChannelDaoImpl chnservice = new ChannelDaoImpl();
        ArrayList<Channel> chnlist = (ArrayList<Channel>) chnservice.findAll();
        if (null != chnlist) {
    %>
    <br>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_chn btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_chn btn btn-success">Add</button>
      </div>
    </div>
    <div class="table-responsive">
    <table id="chnlist"
      class="table table-bordered table-striped table-hover table-condensed">
      <thead>
        <tr>
          <th>#</th>
          <th>Title</th>
          <th>Owner</th>
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
                out.println("<td>"+user_name+"</td>");
                out.println("<td>"+c.getPushuri()+"</td>");
                out.println("<td>"+c.getPulluri()+"</td>");
                out.println("<td>"+c.getStatus()+"</td>");
                out.println("<td>"+sdf.format(c.getCreatetime())+"</td>");
                out.println("<td><button type=\"button\" value=\""+c.getId()+"\"class=\"deletechn btn btn-danger btn-xs\">Delete</button></td>");
                out.println("<td><button type=\"button\" value=\"" + c.getId() + "\"class=\"editchn btn btn-info btn-xs\">Profile</button></td>");
                out.println("</tr>");
            }
        %>
      </tbody>
    </table>
    </div>
    <div class="container">
      <div class="col-sm-12">
        <button style="float: right;" type="button"
          class="menu_delete_chn btn btn-danger">Delete</button>
        <div style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <button style="float: right;" type="button"
          class="menu_add_chn btn btn-success">Add</button>
      </div>
    </div>
    <%
        }
    %>
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
                                   + "<td>" + $("#user_add input:text[name='titlename']").val() + "</td>" 
                                   + "<td><%=username%></td>"
                                   + "<td>" + $("#user_add input:text[name='pushuri']").val() + "</td>" 
                                   + "<td>" + $("#user_add input:text[name='pulluri']").val() + "</td>" 
                                   + "<td>0</td>"
                                   + "<td>" + new Date() + "</td>"
                                   + "<td><button type=\"button\" value=\"" + data.chnid + "\"class=\"deletechn btn btn-danger btn-xs\">Delete</button></td>" 
                                   + "<td><button type=\"button\" value=\"" + data.chnid + "\"class=\"editchn btn btn-info btn-xs\">Profile</button></td>" 
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
                        $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(2)").text($("#user_edit input:text[name='titlename']").val());
                        $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(4)").text($("#user_edit input:text[name='pushuri']").val());
                        $("tr[id=chnlist_"+ cur_chn+ "] td:nth-child(5)").text($("#user_edit input:text[name='pulluri']").val());
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
        $("#chn_edit input:text[name='pushuri']").val($("tr[id=chnlist_" + cur_chn + "] td:nth-child(4)").text());
        $("#chn_edit input:text[name='pulluri']").val($("tr[id=chnlist_" + cur_chn + "] td:nth-child(5)").text());
        $("#editdialog").dialog("open");
    });
  </script>
</body>
</html>