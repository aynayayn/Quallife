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
    <title>Activity</title>

    <!-- css -->
    <link rel="stylesheet" href="${ctx}/static/css/activity.css">
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
              <li><a href="/demo/index">首页 <span class="sr-only">(current)</span></a></li>
              <li><a href="/demo/food">美食</a></li>
              <li class="active"><a href="activity">活动</a></li>
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
      <!-- 查询条件面板 -->
      <p>	<p>	<p>
	  <div class="panel panel-default">
		<div class="panel-body">
		  <span><strong>排序方式：</strong></span>
			<div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-default active">
			    <input type="radio" name="options" id="option1" autocomplete="off" value="startDate"> 活动开始时间
			  </label>	
			  <label class="btn btn-default">
				<input type="radio" name="options" id="option2" autocomplete="off" value="activityName">活动名称
			  </label>
			  <label class="btn btn-default">
				<input type="radio" name="options" id="option3" autocomplete="off" value="user.loginName">发布人
			  </label>	
			</div>
			<br><br>
			<div id="queryForm">
			  <form class="form-inline">
				<div class="form-group" style="margin-bottom:10px">
				  <label for="txtActivityName">活动名称：</label>
				  <input type="text" class="form-control" id="txtActivityName" placeholder="活动名称">
				</div>
				<div class="form-group" style="margin-bottom:10px">
				  <label for="txtActivityArea">活动城市/地区：</label>
				  <input type="text" class="form-control" id="txtActivityArea" placeholder="活动城市/地区">
				</div>
				<div class="form-group" style="margin-bottom:10px">
				  <label for="dateStart">活动开始时间：</label>
				  <input type="date" class="form-control" id="dateStart">
				</div>
				<div class="form-group" style="margin-bottom:10px">
				  <label for="txtDeployUser">发布人：</label>
				  <input type="text" class="form-control" id="txtDeployUser" placeholder="发布人：">
				</div>
				<input type="button" name="query" id="query" value="查询" class ="btn btn-primary">
		        <input type="reset" name="reset" id="reset" value="重置" class ="btn btn-primary">
			  </form>
			</div>
		  </div>
	    </div>
	  </div>
	  
      <!-- 活动展示 -->
      <div id="activity-container" class="container">
      
      </div>
      
      <!-- 分页 row -->
	  <div class="row" style="margin:0 auto; text-align:center;">
		<ul id='example'></ul>
	  </div>
	  <hr class="hr-divider">
	  
    <!-- 版权信息 -->
    <div class="container">&copy;2018臻品生活家</div>
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
    <script src="${ctx}/static/vendor/otherjs/bootstrap-paginator.min.js"></script>
    <script>
      function getQueryString(str){
    	  let query = window.location.search.substring(1);
    	  console.log(query);
    	  let arr = query.split("&");
    	  for(let i = 0; i < arr.length; i++){
    		  let pair = arr[i].split("=");
    		  if(pair[0] == str){
    			  return pair[1];
    		  }
    	  }
    	  return '';
      }
      var pageNumber = 1;
      var pageSize = 2;
	  function showActivities(pageNumber){		
		let sort = $("input[name='options']:checked").val();
		sort = (sort == undefined || sort == null)?"":sort;
		let activityName=$("#txtActivityName").val();
		let activityArea=$("#txtActivityArea").val();
		let startDate=$("#dateB").val();
		let deployUser=$("#txtDeployUser").val();
		let id = getQueryString("id");
		console.log(id);
		let query={
			pageNumber: pageNumber,
			pageSize: pageSize,
			sort:sort,
			activityName:activityName,
			activityArea:activityArea,
			startDate:startDate,
			deployUser:deployUser,
			id:id
		};
        $.get("${ctx}/activity/showActivities",query,function(data,status){
    	  console.log(data);
    	  var activityHtmls = "";
		  if (data != null && data.records != null && data.records.length!=0) {
			if(pageNumber==1){
				var options = {
						bootstrapMajorVersion: 3, 	//版本
						currentPage: data.currentPage, 	//当前页数
						totalPages: data.pageCount, 		//总页数
						itemTexts: function(type, page, current) {
							switch(type) {
								case "first":
									return "首页";
								case "prev":
									return "上一页";
								case "next":
									return "下一页";
								case "last":
									return "末页";
								case "page":
									return page;
							}
						} ,
						//点击事件，用于通过Ajax来刷新整个list列表
						onPageClicked: function(event, originalEvent, type, page) {
							showActivities(page);              
						}
					};
				$('#example').bootstrapPaginator(options); 	
			}					
			$.each(data.records, function(index, item){
				activityHtmls += '<div  class="activity" id="act-'+item.id+'">';
				activityHtmls += '<h2 class="title">'+item.activityName+'</h2>';
				activityHtmls += '<p class="pos-city">';
				activityHtmls += '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>';
				activityHtmls += '<span class="city">'+item.activityArea+'</span>';
				activityHtmls += '</p>';
				activityHtmls += '<div class="row">';
		        activityHtmls += '<div class="col-md-4 text-left">';
		        activityHtmls += '<p class="detail-1">';
		        activityHtmls += '<strong>活动时间:</strong>';
		        var startDate = new Date(item.startDate);//时间戳转成常用的yyyy-mm-dd格式
		        var endDate = new Date(item.endDate);
		        var startHour = startDate.getHours();
		        startHour = (startHour<10)?startHour+'0':startHour;
		        var startMin = startDate.getMinutes();
		        startMin = (startMin<10)?startMin+'0':startMin;
		        var endHour = endDate.getHours();
		        endHour = (endHour<10)?endHour+'0':endHour;
		        var endMin = endDate.getMinutes();
		        endMin = (endMin<10)?endMin+'0':endMin;
		        if(startDate.toLocaleDateString() === endDate.toLocaleDateString()){
		        	 activityHtmls += '<span class="date">'+startDate.toLocaleDateString()+'</span>'+' ';
		        	 activityHtmls += '<span class="time">'+startHour+':'+startMin+' - '+endHour+':'+endMin+'</span>';
		        }
		        else{
		        	activityHtmls += '<span class="date">'+startDate.toLocaleDateString()+'</span>'+' ';
		        	activityHtmls += '<span class="time">'+startHour+':'+startMin+'  -  '+'</span>';
		        	activityHtmls += '<span class="date">'+endDate.toLocaleDateString()+'</span>'+' ';
		        	activityHtmls += '<span class="time">'+endHour+':'+endMin+'</span>';
		        }
		        activityHtmls += '</p>';
		        activityHtmls += '</div>';
		        activityHtmls += '<div class="col-md-4 text-left">';
		        activityHtmls += '<p class="detail-2">';
		        activityHtmls += '<strong>活动地点:</strong>';
		        activityHtmls += '<span class="site">'+item.activityAddress+'</span>';
		        activityHtmls += '</p>';
		        activityHtmls += '</div>';
		        activityHtmls += '</div>';
		        activityHtmls += '<hr class="fenge">';
		        activityHtmls += '<p class="text-desc">'+item.activityDesc+'</p>';
		        activityHtmls += '<div class="activityPics">';
				for(let i = 0; i < item.files.length; i++){
		        	activityHtmls += '<p class="pic-desc"><img src="${ctx}/'+item.files[i].filePath+'" alt="'+item.files[i].fileName+'"'+' style="width:100%"'+'></p>';
		        }
				activityHtmls += '</div>';	
				activityHtmls += '<p id="activity-id" style="display:none">'+item.id+'</p>';
				activityHtmls += '<div class="buttonZone activity'+item.id+'">';
				activityHtmls += '</div>';
				activityHtmls += '</div>';
			    activityHtmls += '</div>';
		        
		        $.get("${ctx}/activity/judgeOrder?id="+item.id,function(data,status){
		        	console.log(data);
		        	if(data){
		        		if(item.endDate > Date.now()){
		        			let newElement = '<p class="btn-section text-center"><button class="btn btn-success btn-lg" type="button" id="cancelOrder" onclick="cancelOrder()">已预约，点击取消</button></p>';
			        		$(".buttonZone.activity"+item.id).append(newElement);
		        		}
		        		else{
		        			let newElement = '<p class="btn-section text-center"><button class="btn btn-danger btn-lg" type="button" disabled="disabled">活动已结束</button></p>';
		        			$(".buttonZone.activity"+item.id).append(newElement);
		        		}
		        	}
		        	else{
		        		let newElement = '<p class="btn-section text-center"><button class="btn btn-default btn-lg" type="button" id="addOrder" onclick="addOrder()">点击预约</button></p>';
		        		$(".buttonZone.activity"+item.id).append(newElement);
		        	}
		        });
			});
		  }
		  else{
			activityHtmls='<h3>No Records</h3>';
			$("#example").html('');
		  }
		  $("#activity-container").html(activityHtmls);
        });
      };
      function addOrder(){
      	console.log("clickToAddOrder!");
      	if (currUser == null){
    		  alert("请先登录");
    		  window.location.href = "${ctx}/login";
    	    }
      	else{
      		let id = $("p#activity-id").html();
      		console.log(id);
      		$.get("${ctx}/activity/addOrder?id="+id,function(data){
          		if(data){
          			$("div.buttonZone p button").remove();
          			let newElement = '<button class="btn btn-success btn-lg" type="button" id="cancelOrder" onclick="cancelOrder()">已预约，点击取消</button>';
          			$("div.buttonZone p.btn-section").append(newElement);
          		}
          	});
      	}
      };
      function cancelOrder(){
    	  console.log("clickToCancelOrder!");
    	  let id = $("p#activity-id").html();
    	  console.log(id);
    	  $.get("${ctx}/activity/cancelOrder?id="+id,function(data){
    		  if(data){
    			  $("div.buttonZone p button").remove();
    			  let newElement = '<button class="btn btn-default btn-lg" type="button" id="addOrder" onclick="addOrder()">点击预约</button>';
    			  $("div.buttonZone p.btn-section").append(newElement);
    		  }
    	  });
      };
      $(function(){
    	showActivities(1);
  		$("#query").click(function(){ showActivities(1); });
  		$("input[name='options']").change(function(){ showActivities(1); });
  		$("#reset").click(function(){
  			//$(".form-inline").reset();
  		});
  		
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
        /* var a=0;
        $(".shelter-container button").click(function(){
          if(a++%2==0){
            $(this).addClass("btn-success");
            $(this).text("已预约，点击取消");
            //这里得往后台传数据，更新预约人数
          }
          else{
            $(this).removeClass("btn-success");
            $(this).text("点击预约");
            //这里得往后台传数据，更新预约人数
          }
        }); */
    
      })
    </script>
  </body>
</html>