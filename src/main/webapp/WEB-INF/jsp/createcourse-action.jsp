<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-sm-12">
  <div class="createcourse-head">
    <div class="create-step">
      <div class="step active">
        <div style="float:left;"><span class="index">1</span><span>基本信息</span></div>
        <div class="step-space">
          <div class="step-a"></div>
          <div class="step-b"></div>
        </div>
      </div>
      <div class="step">
        <div style="float:left;"><span class="index">2</span><span>详细信息</span></div>
        <div class="step-space">
          <div class="step-a"></div>
          <div class="step-b"></div>
        </div>
      </div>
      <div class="step">
        <div style="float:left;"><span class="index">3</span><span>课时设置</span></div>
      </div>
    </div>
  </div>
  
  <div class="createcourse-step1">
    <form class="form-horizontal" name="course-basic" action="" id="course-basic"
      method="post">
      <fieldset class="col-sm-12">
        <div class="form-group">
          <label for="coursetitle" class="control-label col-md-2 col-sm-3 col-xs-12">课程名:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="text" name="coursetitle" class="form-control" value=""
              id="coursetitle" placeholder="" required="required" onblur=''>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger"></span>
          </div>
        </div>
        <div class="form-group">
          <label for="coursedesc" class="control-label col-md-2 col-sm-3 col-xs-12">简介:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
           <textarea  name="coursedesc" class="form-control" id="coursedesc" placeholder=""  rows="3"></textarea>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger form-error"></span>
          </div>
        </div>
        <div class="form-group form-inline">
          <label for="coursecategory" class="control-label col-md-2 col-sm-3 col-xs-12">分类:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <select  name="coursecategory" id="coursecategory" class="form-control"style="display:inline-block;width: auto;">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
            <select  name="coursecategorysub" id="coursecategorysub" class="form-control" style="margin-left:10px;display:inline-block;width: auto;">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger form-error"></span>
          </div>
        </div>
        <div class="form-group">
          <label for="coursetag" class="control-label col-md-2 col-sm-3 col-xs-12">标签:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="text" name="coursetag" class="form-control" value=""
              id="coursetag" placeholder="" required="required" onblur=''>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger"></span>
          </div>
        </div>
        <div class="form-group form-inline">
          <label for="courseprice" class="control-label col-md-2 col-sm-3 col-xs-12">价格:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="text" name="courseprice" class="form-control" value="0" size="5"
              id="courseprice" placeholder="" required="required" onblur='' style="float:left;border-radius:4px 0px 0px 4px;display:inline-block;width: auto;">
            <div class="input-group-addon" style="float:left;height:34px;width:auto;line-height:20px;">元</div>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger"></span>
          </div>
        </div>
        <div class="form-group">
          <label for="starttime" class="control-label col-md-2 col-sm-3 col-xs-12">开课时间:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="date" name="starttime" class="form-control"
              id="starttime" required="required" onblur=''>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger form-error"></span>
          </div>
        </div>
        <div class="form-group">
          <label for="endtime" class="control-label col-md-2 col-sm-3 col-xs-12">结课时间:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="date" name="endtime" class="form-control"
              id="endtime" required="required" onblur=''>
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger form-error"></span>
          </div>
        </div>
        <div class="form-group">
          <label for="courselogo" class="control-label col-md-2 col-sm-3 col-xs-12">课程封面:</label>
          <div class="col-md-6 col-sm-5 col-xs-12">
            <input type="file" name="courselogo" id="courselogo" class="form-control" value="ssssss">
          </div>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <span class="label label-danger form-error"></span>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  
  <div class="createcourse-step2">
    <form class="form-horizontal" name="course-detail" action="" id="course-basic"
      method="post">
      <fieldset class="col-sm-12">
        <div class="form-group">
          <div class="col-xs-offset-1 col-xs-9">
           <textarea  name="coursedetail" class="form-control" id="coursedetail" placeholder=""  rows="20"></textarea>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  
  <div class="createcourse-step3">
    <form name="course-detail" action="" id="course-basic"
      method="post">
      <fieldset class="col-sm-12">
        <div class="catalog-total">
          <div style="float:right">
            <div class="input-group-addon" style="float:left;height:34px;width:auto;line-height:20px;">共</div>
            <input type="text" name="totallesson" class="form-control" value="0" size="3"
                id="totallesson" disabled="disabled" required="required" onblur='' style="float:left;border-radius:0px 0px 0px 0px;display:inline-block;width: auto;text-align:center;">
            <div class="input-group-addon" style="float:left;height:34px;width:auto;line-height:20px;">课时</div>
          </div>
        </div>
        <div class="catalog-list">

        </div>
        <div class="catalog-add">
          <div style="float:right">
            <button type="button" id="addlesson" class="btn btn-info">添加课时</button>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  
  <div class="createcourse-tail">
    <div class="form-group">
      <div class="col-md-offset-2 col-md-8 col-sm-offset-3 col-sm-6 col-xs-12">
        <button type="button" id="step-back" value="下一步" class="btn btn-default col-sm-4">上一步</button>
        <button type="button" id="step-next" value="下一步" class="btn btn-success col-sm-4"style="margin-left:10px;">下一步</button>
      </div>
    </div>
  </div>
  
</div>

<script>
var curstep = 1;
function changestep(step){
    console.log("current step:"+curstep);
    $(".create-step .step-space .active").removeClass("active");
    $(".create-step .active").removeClass("active");
    $(".create-step .step").eq(curstep-1).addClass("active");
    if(curstep>=2){
        $(".create-step .step-space").eq(curstep-2).children(".step-a").addClass("active");
    }
    if(curstep==1){
        $(".createcourse-step1").show();
        $(".createcourse-step2").hide();
        $(".createcourse-step3").hide();
        $("#step-back").css("visibility","hidden");
    }else{
        $("#step-back").css("visibility","visible");
    }
    if(curstep==2){
        $(".createcourse-step1").hide();
        $(".createcourse-step2").show();
        $(".createcourse-step3").hide();
    }
    if(curstep==3){
        $(".createcourse-step1").hide();
        $(".createcourse-step2").hide();
        $(".createcourse-step3").show();
        $("#step-next").text("创建课程");
    }else{
        $("#step-next").text("下一步");
    }
        
}

var totallesson = 0;
function createlesson(){
    totallesson++;
    var htmlstr = 
    "<div class=\"catalog-item\">"+
    "  <div class=\"catalog-num1\">"+
    "    <div class=\"catalog-num2\">第<span class=\"catalog-num\">"+totallesson+"</span>节</div>"+
    "  </div>"+
    "  <div class=\"catalog-info\">"+
    "    <div class=\"catalog-item-head\">"+
    "      <div class=\"catalog-title\">"+
    "        <input type=\"text\" name=\"lesson"+totallesson+"\" value=\"未命名标题\">"+
    "      </div>"+
    "      <div class=\"catalog-lesson-cmd\">"+
    "        <i class=\"iconfont catalog-lesson-delete\">&#xe607;</i>"+
    "        <i class=\"iconfont catalog-lesson-down\">&#xe609;</i>"+
    "        <i class=\"iconfont catalog-lesson-up\">&#xe608;</i>"+
    "      </div>"+
    "    </div>"+
    "    <div class=\"catalog-desc\">"+
    "    </div>"+
    "  </div>"+
    "</div>";
    $(".catalog-list").append(htmlstr);
    $("#totallesson").val(totallesson);
    document.documentElement.scrollTop=document.body.clientHeight; 
    document.body.scrollTop=document.body.clientHeight; 
    $(".catalog-list .catalog-item").last().find("input").select();
}
function resortlesson(){
    var i=0
    $(".catalog-list .catalog-item").each(function(){
        i++;
        $(this).find("span").text(i);
        $(this).find("input").attr("name","lesson"+i);
    });
}

function confirmcourse(step){
    console.log("comfirm");
}

$(function(){
    changestep(curstep);
    for(var i=0;i<5; i++){
        createlesson();
    }
    
    $("#step-back").on("click", function() {
        if(curstep>=2)
        {
            curstep--;
            changestep(curstep);
        }
    });
    $("#step-next").on("click", function() {
        if(curstep>=3)
        {
            confirmcourse();
        }else{
            curstep++;
            changestep(curstep);
        }
    });
    $("#addlesson").on("click", function() {
        createlesson();
    });
    $(".catalog-list").on("click","input", function() {
        $(this).select();
    });
    $(".catalog-list").on("click",".catalog-lesson-delete", function() {
        $(this).parent().parent().parent().parent().remove();
        totallesson--;
        $("#totallesson").val(totallesson);
        resortlesson();
    });
    $(".catalog-list").on("click",".catalog-lesson-up", function() {
        $(this).parent().parent().parent().parent().insertBefore($(this).parent().parent().parent().parent().prev());
        resortlesson();
    });
    $(".catalog-list").on("click",".catalog-lesson-down", function() {
        $(this).parent().parent().parent().parent().insertAfter($(this).parent().parent().parent().parent().next());
        resortlesson();
    });
});
</script>