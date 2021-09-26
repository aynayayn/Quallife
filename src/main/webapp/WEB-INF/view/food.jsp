<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Food</title>

    <!-- css -->
    <link rel="stylesheet" href="${ctx}/static/css/food.css">
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
              <li><a href="activity">活动</a></li>
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
    <div class="container" style="margin-top:50px;">
        	<!-- 查询条件面板 -->
    			<p>	<p>	<p>
			<div class="panel panel-default">
				  <div class="panel-body">
				    <span><strong>排序方式：</strong></span>
				    <div class="btn-group" data-toggle="buttons">
				    <label class="btn btn-default active">
					    <input type="radio" name="options" id="option1" autocomplete="off" value="deployDate"> 发布日期
					  </label>	
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option2" autocomplete="off" value="foodName">美食名称
					  </label>
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option3" autocomplete="off" value="user.loginName">发布人
					  </label>	
				  
					</div>
				    <br><br>
				    <div id="queryForm">
					    <form class="form-inline">
						  <div class="form-group">
						    <label for="txtFoodName">美食名称：</label>
						    <input type="text" class="form-control" id="txtFoodName" placeholder="美食名称">
						  </div>
						  <div class="form-group">
						    <label for="txtDeployUser">发布人：</label>
						    <input type="text" class="form-control" id="txtDeployUser" placeholder="发布人：">
						  </div>
						  <div class="form-group">
						    <label for="dateB">发布日期：</label>
						    <input type="date" class="form-control" id="dateB">
						  </div>
						  <div class="form-group">
						    <label for="dateE">至</label>
						    <input type="date" class="form-control" id="dateE">
						  </div>
						  <input type="button" name="query" id="query" value="查询" class ="btn btn-primary">
		        		  <input type="reset" name="reset" id="reset" value="重置" class ="btn btn-primary">
						</form>
					</div>
				  </div>
			</div>
    
    <!-- 美食列表row -->
    <div class="row" id="food-container">         
		
    </div> 
    <!-- 分页 row -->
	<div class="row" style="margin:0 auto; text-align:center;">
		<ul id='example'></ul>
	</div>
	<hr class="hr-divider">
	
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
    <script src="${ctx}/static/vendor/otherjs/jqthumb.min.js"</script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/vendor/otherjs/bootstrap-paginator.min.js"></script>
   
    <script>
    function DrawImage(hotimg){
    	$(hotimg).jqthumb({
 	    	width:'100%',
 	    	height:'265px',
 	    	position:{ y: '50%', x: '50%'},//从图片的中间开始产生缩略图
 	    	zoom:'1',
 	    	method:'auto'
 	    });
    }
    var pageNumber = 1;
    var pageSize = 4;
	function getFoodList(pageNumber){
		var sort = $("input[name='options']:checked").val();
		var foodName=$("#txtFoodName").val();
		var deployUser=$("#txtDeployUser").val();
		var startDate=$("#dateB").val();
		var endDate=$("#dateE").val();
		var query={
			pageNumber: pageNumber,
			pageSize: pageSize,
			sort:sort,
			foodName:foodName,
			deployUser:deployUser,
			startDate:startDate,
			endDate:endDate
		};
		$.get("${ctx}/food/getFoodList",query,function(data,status){
			console.log(data);
			var foodHtmls = "";	
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
								getFoodList(page);              
							}
						};
					$('#example').bootstrapPaginator(options); 	
				}					
				$.each(data.records, function(index, item){
					foodHtmls += '<div class="col-sm-6 col-md-4 col-lg-3 ">';
					foodHtmls += '<div class="thumbnail">';
					foodHtmls += '<div class="picture">';
					foodHtmls += '<a href="${ctx}/food-detail?id='+item.id+'" title="'+item.foodName+'" target="_blank" ><img class="lazy" onload="DrawImage(this)" src="${ctx}/'+item.fileAttach.filePath+'" alt="'+item.foodName+'"></a>';
					foodHtmls += '</div>';
					foodHtmls += "<div class='caption'>";
					var d=new Date(item.deployDate);//时间戳转成常用的yyyy-mm-dd格式
					foodHtmls += '<div class="caption"> <h3><a style="text-decoration:none" href="${ctx}/food-detail?id='+item.id+'" title="'+item.foodName+'" target="_blank">'+item.foodName+'<br><small>'+d.toLocaleDateString()+'</small></a></h3>';
					foodHtmls +='<p style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;">'+item.foodMaterial+'</p>  </div>';
					foodHtmls += "</div>";
					foodHtmls += "</div>";
					foodHtmls += "</div>";
					console.log(item.id);
					console.log(item.foodName);
					console.log(item.fileAttach.filePath);
				});
			}
			else{
				foodHtmls='<div class="row" id="food-container"> <div class="col-sm-6 col-md-4 col-lg-3 "><div class="thumbnail">'
						+'<div class="caption"> <h3>No Records</h3></div></div></div>';
				$("#example").html('');
			}
			$("#food-container").html(foodHtmls);
		}, "json");	
    }
   
    $(function(){
        getFoodList(1);
        
    	$("#query").click(function(){ getFoodList(1); });
    	$("input[name='options']").change(function(){ getFoodList(1); });
    	$("#reset").click(function(){
    		//$(".form-inline").reset();
    	});
    		
        $(window).scroll(function(){  
        	//只要窗口滚动,就触发下面代码
            var scrollt = document.documentElement.scrollTop + document.body.scrollTop; //获取滚动后的高度
            if( scrollt >200 ){  
              //判断滚动后高度超过200px,就显示
              $("#back_top").fadeIn(400); //淡入
            }
            else{
              $("#back_top").stop().fadeOut(400); //如果返回或者没有超过,就淡出.必须加上stop()停止之前动画,否则会出现闪动
            }
          });
          $("#back_top").click(function(){ 
        	//当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
          	$("html,body").animate({scrollTop:"0px"},200);
        }); 
    })
    </script>
  </body>
</html>