<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>美食详情 - ${food.foodName}</title>

    <!-- css -->
    <link rel="stylesheet" href="${ctx}/static/css/food-detail.css">
    <!-- Bootstrap -->
    <link href="${ctx}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">臻品生活家</a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="index">首页 <span class="sr-only">(current)</span></a></li>
              <li class="active"><a href="food">美食</a></li>
              <li><a href="activity.">活动</a></li>
              <li><a href="#" data-toggle="modal" data-target="#myModal">关于</a></li>
            </ul>
            <jsp:include page="layout/info.jsp"></jsp:include>
            <!--  
            <ul class="nav navbar-nav navbar-right">
              <li><a href="login">登录</a></li>
              <li><a href="register">注册</a></li>
            </ul>
            -->
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
    <!-- 主体部分 -->
    <div class="container shelter-container">
        <!-- 标题部分 -->
        <div class="title-bar">
            <h3 class="title">${food.foodName}</h2>
            <p>
                <!-- 当鼠标移到#collect上时里面的所有内容变浅绿色，且光标由箭头变成小手； -->
                <!-- 当点击后所有内容变绿色，且文字变成“取消收藏”，且调用Ajax在后台更新收藏人数但不返回前端显示； -->
                <!-- 再次点击后回复原样，且文字变成“收藏”，且调用Ajax在后台更新收藏人数但不返回前端显示 -->
                <span id="collectControl">
                	<c:if test="${collectFlag==null || collectFlag==false}">
                		<a id="addCollect" style="text-decoration:none;">
                			<span class="glyphicon glyphicon-heart-empty"></span>
                    		<span class="text">收藏</span>
                		</a>
                  	</c:if>
                  	<c:if test="${collectFlag == true}">
                  		<a id="cancelCollect" style="text-decoration:none;">
                  			<span class="glyphicon glyphicon-heart" style="color:red;"></span>
                    		<span class="text">取消收藏</span>
                  		</a>
                  	</c:if>
                </span>
                &nbsp; &nbsp; &nbsp;
                <!-- 当鼠标移到#like中第一个span（即实体点赞字符）上时点赞字符变浅红色，且光标由箭头变成小手； -->
                <!-- 当点击点赞字符后，点赞字符变红色，且调用Ajax在后台更新点赞人数并返回在.text中显示 -->
                <!-- 当再次点击点赞字符后，点赞字符回复原样，且调用Ajax在后台更新点赞人数并返回在.text中显示 -->
                <span id="like">
                    <span class="glyphicon glyphicon-thumbs-up"></span>
                    <span class="text">${food.likes}</span>
                </span> 
            </p>
        </div>
        <!-- 分隔线 -->
        <hr class="title-hr">
        <!-- 主体菜谱内容 -->
        <span class="time"><fmt:formatDate value="${food.deployDate}" pattern="yyyy-MM-dd"/></span>
        <div class="big-pic"><img src="${ctx}/${food.fileAttach.filePath}" alt=""></div>
        <div class="ingredient-section">
            <p>素材：</p>
            <p class="ingredient">${food.foodMaterial}</p>
        </div> 
        <div class="step-section">
            <p>步骤：</p>
            <c:forEach var="foodStep" items="${food.foodSteps }" varStatus="varStep">
            <div class="step">
                <p class="text">${foodStep.stepNo}. ${foodStep.stepDesc}</p>
                <p class="pic"><img src="${ctx}/${foodStep.fileAttach.filePath}" alt=""></p>
            </div>
            </c:forEach>
        </div>
        <!-- 分隔线 -->
        <hr class="title-hr">
        <!-- 版权信息 -->
        &copy;2018臻品生活家
    </div>
    <!-- 模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="myModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">臻品生活家</h4>
          </div>
          <div class="modal-body">
            <p>城市美食与活动发布管理平台</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- 回到顶部 -->
    <div id="back_top">
        <div class="arrow"></div>
        <div class="stick"></div>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${ctx}/static/vendor/jquery/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function(){
          $(window).scroll(function(){  //只要窗口滚动,就触发下面代码
            var scrollt = document.documentElement.scrollTop + document.body.scrollTop; //获取滚动后的高度
            if( scrollt >200 ){  //判断滚动后高度超过200px,就显示
              $("#back_top").fadeIn(400); //淡入
            }
            else{
              $("#back_top").stop().fadeOut(400); //如果返回或者没有超过,就淡出.必须加上stop()停止之前动画,否则会出现闪动
            }
          });
          $("#back_top").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
            $("html,body").animate({scrollTop:"0px"},200);
          }); 
          var a=0;
         /*  $(".shelter-container #collect").click(function(){
              if(a++%2==0){
                // $(this).addClass("changecolor1");
                $(this).css("color","rgb(2, 179, 2)")
                $(this).children(".text").text("取消收藏");
                //调用Ajax在后台更新收藏人数但不返回前端显示
              }
              else{               
                // $(this).removeClass("changecolor1");
                $(this).css("color","black");
                $(this).children(".text").text("收藏");
                //调用Ajax在后台更新收藏人数但不返回前端显示
              }
          }); */
          $(".shelter-container #like").click(function(){
        	  $.get("${ctx}/food/foodLikes?id=${food.id}",function(data){
        		  if(data){
        			  window.location.reload();
        		  }
        	  })
          });
          var b=0;
         /*  $(".shelter-container #like").click(function(){
              if(b++%2==0){
                // $(this).children("span:nth-child(1)").addClass("changecolor2");
                $(this).children("span:nth-child(1)").css("color","red");
                // 调用Ajax在后台更新点赞人数并返回在.text中显示
                
              }
              else{               
                // $(this).children("span:nth-child(1)").removeClass("changecolor2");
                $(this).children("span:nth-child(1)").css("color","black");
                // 调用Ajax在后台更新点赞人数并返回在.text中显示
              }
          }) */
          $(".shelter-container #collectControl #addCollect").click(function(){
        	  if (currUser == null){
        		  alert("请先登录");
        		  window.location.href = "${ctx}/login";
        	  }
        	  else{
        		  $.get("${ctx}/food/addCollect?id=${food.id}",function(data){
        			  if(data){
        				  window.location.reload();
        			  }
        		  })
        	  }
          });
          $(".shelter-container #collectControl #cancelCollect").click(function(){
        	  $.get("${ctx}/food/cancelCollect?id=${food.id}",function(data){
        		  console.log(data);
        		  if(data){
        			  window.location.reload();
        		  }
        	  })
          });
      })
    </script>
  </body>
</html>