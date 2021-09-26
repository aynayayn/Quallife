<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src= "${ctx}/static/vendor/jquery/jquery.min.js"></script>
<script>
	var currUser = null;
	$(function(){
		$.get("${ctx}/getCurrUser",function(data){
			currUser = data;
			if(currUser == null){
				$("#userInfoLi").html('<a href="/demo/login">登录</a>');
				$("#operationLi").html('<a href="/demo/register">注册</a>')
			}
			else{
				$("#userInfoLi").html('<a href="/demo/wode">'+currUser.loginName+'</a>');
				$("#operationLi").html('<a href="/demo/logout">退出</a>')
			}
		},"json");
	});
</script>
<ul class="nav navbar-nav navbar-right">
	<li id="userInfoLi"><a href="/demo/login">登录</a></li>
	<li id="operationLi"><a href="/demo/register">注册</a></li>
</ul>
