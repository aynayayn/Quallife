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
    <title>Homepage</title>
    
    <!-- css -->
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
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
              <li class="active"><a href="index">首页 <span class="sr-only">(current)</span></a></li>
              <li><a href="food">美食</a></li>
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
      <!-- 轮播图 -->
      <div id="carousel-example-generic" class="carousel shelter-carousel" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner shelter-carousel-inner" role="listbox">
          <div class="item active">
            <img src="${ctx}/static/img/homepage/lunbo/lunbo1.jpg" alt="...">
            <div class="carousel-caption shelter-carousel-caption">
              <h2>红酒雪梨</h2>
              <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
              <a href="food-detail">
                <button type="button" class="btn btn-primary">查看详情</button>
              </a>
            </div>
          </div>
          <div class="item">
            <img src="${ctx}/static/img/homepage/lunbo/lunbo2.jpg" alt="...">
            <div class="carousel-caption shelter-carousel-caption">
              <h2>南瓜酒酿小圆子</h2>
              <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
              <a href="food-detail">
                <button type="button" class="btn btn-primary">查看详情</button>
              </a>
            </div>
          </div>
          <div class="item">
            <img src="${ctx}/static/img/homepage/lunbo/lunbo3.jpg" alt="...">
            <div class="carousel-caption shelter-carousel-caption">
                <h2>藜麦秋葵虾仁蛋饼</h2>
                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                <a href="food-detail">
                  <button type="button" class="btn btn-primary">查看详情</button>
                </a>
            </div>
          </div>
          <div class="item">
            <img src="${ctx}/static/img/homepage/lunbo/lunbo4.jpg" alt="...">
            <div class="carousel-caption shelter-carousel-caption">
                <h2>雪梨银耳炖木瓜</h2>
                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                <a href="food-detail">
                  <button type="button" class="btn btn-primary">查看详情</button>
                </a>
            </div>
          </div>
        </div>
      
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <!-- 下边的图标 -->
      <div class="container index-icon">
        <div class="row">
            <div class="col-xs-12 col-sm-4">
              <div class="thumbnail shelter-thumbnail">
                <a href="food"><img src="${ctx}/static/img/homepage/icons/meishi.png" alt="..."></a>
                <div class="caption text-center">
                  <a href="food"><h3>美食</h3></a>
                  <p>体验极致烹饪</p>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-4">
                <div class="thumbnail shelter-thumbnail">
                  <a href="activity"><img src="${ctx}/static/img/homepage/icons/huodong.png" alt="..."></a>
                  <div class="caption text-center">
                    <a href="activity"><h3>活动</h3></a>
                    <p>我们号召城中所有美食达人、辣妈主妇、烘焙大师、城市OL等民间高手，爱好生活、美食的伙伴们都相聚于此</p>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-4">
                <div class="thumbnail shelter-thumbnail">
                  <a href="wode"><img src="${ctx}/static/img/homepage/icons/wode.png" alt="..."></a>
                  <div class="caption text-center">
                    <a href="wode"><h3>我的</h3></a>
                    <p>更多个人信息查询管理</p>
                  </div>
                </div>
              </div>
          </div>
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
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${ctx}/static/vendor/jquery/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function(){

        })
    </script>
  </body>
</html>