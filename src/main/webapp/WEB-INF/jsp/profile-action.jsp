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