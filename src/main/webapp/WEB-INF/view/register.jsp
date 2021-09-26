<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Register</title>

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
      <div class="container">
        <div class="container-fluid text-center">
          <h1>臻品生活家</h1>
          <h4>注册</h4>
        </div>
        <div class="form-horizontal" data-register="form">
            <div class="form-group shelter-form">
              <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="Email" required autofocus>
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 shelter-tip" id="tip-inputEmail"></p>
            <div class="form-group shelter-form">
              <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword1" placeholder="Password" name="Password1" required>
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 shelter-tip" id="tip-inputPassword1"></p>
            <div class="form-group shelter-form">
                <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword2" placeholder="Confirm" name="Password2" required>
                </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 shelter-tip" id="tip-inputPassword2"></p>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default" id="btn-submit">注册</button>
              </div>
            </div>
            <p class="col-sm-10 col-sm-offset-2 goToAnotherPage">已有账号？<a href="${ctx}/login">立即登录</a></p>
        </div>
      </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${ctx}/static/vendor/jquery/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script>
       $(function(){
    	   flagEmail = false;
    	   flagPassword = false;
    	   flagRepeatPassword = false;
       
    	   regOfEmail = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/;
    	   regOfPassword = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z\\W]{8,15}$/;
    	   
    	   $('div[data-register="form"]').on('input','[name="Email"]',function(event){
    		   let emailAddress = event.target.value;
    		   flagEmail = regOfEmail.test(emailAddress);
    		   console.log(flagEmail);
    	   });
    	   $("#inputEmail").focus(function(){
    		   $("#tip-inputEmail").html('');
    	   });
    	   $("#inputEmail").blur(function(){
    		   console.log("email blur~~~");
    		   let emailAddress = $(this).val();
    		   console.log(emailAddress);
    		   if(flagEmail === false){
    			   if(emailAddress == ''){
        			   $("#tip-inputEmail").html("邮箱不能为空！");
        		   }
    			   else{
    				   $("#tip-inputEmail").html("邮箱不符合格式！");
    			   }
    		   }
    		   else{
    			   $.get("${ctx}/checkLoginName?loginName="+emailAddress,function(data,status){
    				   if(!data){
    					   $("#tip-inputEmail").html("该邮箱已被注册！");
    				   }
    				   else{
    					   $("#tip-inputEmail").html('');
    				   }
    			   });
    		   }
    	   });
    	   
    	   $('div[data-register="form"]').on('input','[name="Password1"]',function(event){
    		   let password = event.target.value;
    		   flagPassword = regOfPassword.test(password);
    		   console.log(flagPassword);
    	   });
    	   $("#inputPassword1").focus(function(){
    		   $("#tip-inputPassword1").html('');
    	   });
    	   $("#inputPassword1").blur(function(){
    		   console.log("password1 blur~~~");
    		   let password = $(this).val();
    		   console.log(password);
    		   if(flagPassword === false){
    			   if(password === ''){
    				   $("#tip-inputPassword1").html("密码不能为空！");
    			   }
    			   else{
    				   $("#tip-inputPassword1").html("密码必须为8-15位数字和字母的组合！");
    			   }
    		   }
    		   else{
    			   $("#tip-inputPassword1").html('');
    		   }
    	   });
    	   
    	   $("#inputPassword2").focus(function(){
    		   $("#tip-inputPassword2").html('');
    	   });
    	   $("#inputPassword2").blur(function(){
    		   let repeatPassword = $(this).val();
    		   if(repeatPassword === $("#inputPassword1").val()){
    			   flagRepeatPassword = true;
    			   $("#tip-inputPassword2").html('');
    		   }
    		   else{
    			   flagRepeatPassword = false;
    			   $("#tip-inputPassword2").html("密码输入不一致！");
    		   }
    	   });
    	   $('div[data-register="form"] button#btn-submit').on('click',function(){
    		   console.log('click to submit!');
    	   	   if(flagEmail && flagPassword && flagRepeatPassword){
    	   		  $.ajax({
               	     type:'post',
               	     url:'${ctx}/userRegister',
               	     dataType:'json',
               	     contentType:'application/json;charset=UTF-8',
               	     data:JSON.stringify({
                         loginName:$('#inputEmail').val(),
                         password:$('#inputPassword1').val()
                     }),
                     success:function(responseData){
                    	 console.log(responseData);
                   	     if(responseData.success){
                             alert("注册成功！");
                             window.location.href = '${ctx}/login';
                         }
                         else{
                             alert("注册过程出现问题");
                         }
                     },
                     error:function(response){
                    	 console.log(response);
                    	 alert("error!")
                     }
                 });
    	   	   }
    	   	   else{
    	   		   alert("请检查输入");
    	   		   this.reset();
    	   	   }
    	   }); 
       })
    </script>
  </body>
</html>