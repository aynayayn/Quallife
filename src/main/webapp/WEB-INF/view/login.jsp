<!DOCTYPE html>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="${ctx}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/registerAndLogin.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<%
  		String error = (String)request.getAttribute("shiroLoginFailure");
  		String info = null;
  		if(error != null){
  			info = "用户名不存在";
  			if(error=="org.apache.shiro.authc.IncorrectCredentialsException"){
  				info="密码不正确";
  			}
  		}
  	%>
      <div class="container">
        <input id="error" hidden value="<%=info%>"></input>
        
        <div class="container-fluid text-center">
          <h1>臻品生活家</h1>
          <h4>登录</h4>
        </div>
        <form class="form-horizontal" action="${ctx}/login" method="post">
            <div class="form-group shelter-form">
              <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="username">
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 shelter-tip" id="tip-inputEmail">
                
            </p>
            <div class="form-group shelter-form">
              <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 shelter-tip" id="tip-inputPassword">
               
            </p>
             <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <label>
                	<input type="checkbox" value="true" name="remenberMe">记住我
                </label>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" id="btn-submit">登录</button>
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 goToAnotherPage">没有账号？<a href="register">立即注册</a></p>
        </form>
      </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${ctx}/static/vendor/jquery/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function(){
        	 let info = $("#error").val();
             if (info != "null"){
                 alert(info);
             }
        })
    </script>
  </body>
</html>