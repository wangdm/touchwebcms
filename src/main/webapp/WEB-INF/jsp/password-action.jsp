<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lubocluod.touchwebcms.entity.User"%>
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
<script>
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
</script>