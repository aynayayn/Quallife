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
    <title>管理我的</title>

    <!-- css -->
    <link rel="stylesheet" href="${ctx}/static/css/wode.css">
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
    <nav class="navbar navbar-default navbar-fixed-top shelter-navbar">
        <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">我的臻品生活</a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="index">首页 <span class="sr-only">(current)</span></a></li>
              <li><a href="food">美食</a></li>
              <li><a href="activity">活动</a></li>
            </ul>
            <jsp:include page="layout/info.jsp"></jsp:include>
            <!--  
            <ul class="nav navbar-nav navbar-right">
              <li><a href="login">退出</a></li>
            </ul>
            -->
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
      <!-- 主体 -->
      <!-- 最外层的div.wrap -->
      <div class="container-myself main">
        <!-- 先写需要自适应屏幕宽度的div，它只是壳，里面还得再包一层 -->
        <div class="right-main">
            <!-- 自适应的右边的区域的实际内容div ，又因为是container-fluid类，所以width值为auto，左右各有15px的padding值-->
            <div class="container-fluid content">
              <div class="main" id="main-1">
                <h2 style="font-family: SimSun;">管理我的臻品生活</h2>
                <hr>
                <div class="mycl-food">
                  <p class="title">我收藏的美食</p>
                  <ul id="foodCollectListZone">
                    
                  </ul>
                </div>
              </div>
              <div class="main" id="main-2">
                <h2 style="font-family: SimSun;">管理我的臻品生活</h2>
                <hr>
                <div class="myod-activity">
                  <p class="title">我预约的活动</p>
                  <div class="true-content" id="activityOrderListZone">
                    
                  </div>
                </div>
              </div>
              <div class="main" id="main-3">
                <h2 style="font-family: SimSun;">修改密码</h2>
                <div class="container text-center">
                  <div id="changePassword">
                    <p>
                      <input type="text" placeholder="邮件" name="loginName"  required>
                    </p>
                    <p id="tipForLoginName" style="color:red;font-size:10px;line-height:12px;"></p>
                    <p>
                      <input type="password" placeholder="输入原来的密码" name="originalPassword" required>
                    </p>
                    <p id="tipForOriginalPassword" style="color:red;font-size:10px;line-height:12px;"></p>
                    <p>
                      <input type="password" placeholder="输入新密码" name="newPassword" required>
                    </p>
                    <p id="tipForNewPassword" style="color:red;font-size:10px;line-height:12px;"></p>
                    <p>
                      <button type="button" id="btn-submit">提交</button>
                    </p>
                  </div>
                </div>
              </div>
              <div class="main" id="main-4">
                  <form class="form-horizontal" method="post" enctype="multipart/form-data" action="${ctx}/food/deploy">
                    <div class="form-group">
                      <label for="name" class="col-sm-2 control-label">美食名称</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="请输入美食名称" name="foodName" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="pic" class="col-sm-2 control-label">上传照片</label>
                      <div class="col-sm-10">
                        <input type="file" id="pic" name="picFile" accept="image/*" required>
                        <img class="foodImage" id="mainImage" src="" alt="">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="material" class="col-sm-2 control-label">材料</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="material" placeholder="需要的材料" name="foodMaterial" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="steps-num" class="col-sm-2 control-label">步骤数</label>
                      <div class="container-fluid">
                        <div class="row">
                          <div class="col-xs-10 col-sm-8 col-md-8 col-lg-9 self-defi">
                            <input type="number" class="form-control" id="step-num" placeholder="需要的步骤数" name="stepNumber" required>
                          </div>
                          <div class="col-xs-2 col-sm-2 col-md-2 col-lg-1">
                            <button type="button" id="step-num-btn" class="btn btn-sure btn-success">确认</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="step-detail">
                      <div class="form-group">
                        <label for="step1" class="col-sm-2 control-label">步骤一</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="step1" placeholder="步骤一具体操作" name="stepDesc" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="uploadImageForStep1" class="col-sm-2 control-label">上传照片</label>
                        <div class="col-sm-10">
                          <input type="file" id="uploadImageForStep1" name="picFile" accept="image/*" required>
                          <img class="foodImage" id="subImage1" src="" alt="">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="step2" class="col-sm-2 control-label">步骤二</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="step2" placeholder="步骤二具体操作" name="stepDesc" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="uploadImageForStep2" class="col-sm-2 control-label">上传照片</label>
                        <div class="col-sm-10">
                          <input type="file" id="uploadImageForStep2" name="picFile" accept="image/*" required>
                          <img class="foodImage" id="subImage2" src="" alt="">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="step3" class="col-sm-2 control-label">步骤三</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="step3" placeholder="步骤三具体操作" name="stepDesc" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="uploadImageForStep3" class="col-sm-2 control-label">上传照片</label>
                        <div class="col-sm-10">
                          <input type="file" id="uploadImageForStep3" name="picFile" accept="image/*" required>
                          <img class="foodImage" id="subImage3" src="" alt="">
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10 text-center">
                        <button type="submit" class="btn btn-default">提交</button>
                      </div>
                    </div>
                  </form>
              </div>
              <div class="main" id="main-5" style="margin-top:20px;">
                <form class="form-horizontal" role="form" action="${ctx}/activity/deploy" method="post"  enctype="multipart/form-data"> 
            	  <div class="form-group"> 
                	<label for="inputActivityName" class="col-sm-2 control-label">活动名称</label> 
                	<div class="col-sm-10">
                      <input type="text" class="form-control" id="inputActivityName" placeholder="请输入活动名称" name="activityName" required>
                	</div> 
            	  </div>
                  <div class="form-group"> 
                    <!-- <label for="inputActivityArea" class="glyphicon glyphicon glyphicon-map-marker" aria-hidden="true">活动城市</label> -->
                    <label for="inputActivityName" class="col-sm-2 control-label">活动地区</label> 
                    <div class="col-sm-10">
                      <!-- <input type="text" class="form-control" id="inputActivityArea" placeholder="请输入活动范围" name="activityArea" required> -->
                      <select style="margin-right:20px" id="prov" name="province">
                      	<option>--请选择省市--</option>
                      </select>
                      <select style="margin-right:20px" id="city" name="city">
                      	<option>--请选择城市--</option>
                      </select>
                      <select id="country" name="country">
                      	<option>--请选择区县--</option>
                      </select>
                    </div> 
                  </div>
                  <div class="form-group"> 
                    <label for="inputActivityAddress" class="col-sm-2 control-label">具体地点</label> 
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputActivityAddress" placeholder="请输入活动的具体地点" name="activityAddress" required>
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <label for="inputActivityStartTime" class="col-sm-2 control-label">活动开始时间</label> 
                    <div class="col-sm-10">
                      <input type="datetime-local" class="form-control" id="inputActivityStartTime" placeholder="请输入活动开始时间"  name="activityStartTime"required>
                    </div> 
                  </div>    
                  <div class="form-group"> 
                    <label for="inputActivityEndTime" class="col-sm-2 control-label">活动结束时间</label> 
                    <div class="col-sm-10">
                      <input type="datetime-local" class="form-control" id="inputActivityEndTime" placeholder="请输入活动结束时间"  name="activityEndTime"required>
                    </div> 
                  </div>    
                  <div class="form-group"> 
                    <label for="inputActivityContent" class="col-sm-2 control-label">活动内容</label> 
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputActivityContent" placeholder="请输入活动内容" name="activityDesc" required>
                    </div>   
                  </div>
                  <div class="activityImageGroup">
                    <div class="form-group activityImageGroupAt1"> 
                      <label for="uploadImageForActivity1" class="col-sm-2 control-label">上传照片</label> 
                      <div class="col-sm-10">
                        <input type="file" id="uploadImageForActivity1" name="picFile" accept="image/*" required>
                        <img class="activityImage" id="activityImage1" src="" alt="" style="width:200px;height:200px;">
                      </div>
                    </div> 
                  </div>
                  <div class="form-group"> 
                    <div class="col-sm-3 col-sm-push-2">
                      <button type="button" id="addActivityPic">继续添加图片</button>
                    </div>
                    <div class="col-sm-2 col-sm-push-2">
                      <button type="button" id="deleteActivityPic">减一张</button>
                    </div>
                  </div> 
                  <div class="form-group text-center"> 
                    <button type="submit" class="btn btn-default">提交</button>
                  </div>
                </form>  
              </div>                          
            </div> 
        </div>
        <!-- 再写需要固定宽度的区div-->
        <div class="left-navbar">
          <ul class="item-list">
            <li class="active-my"><a href="#main-1">收藏的美食</a></li>
            <li><a href="#main-2">预约的活动</a></li>
            <li><a href="#main-3">修改密码</a></li>
            <li><a href="#main-4">美食发布</a></li>
            <li><a href="#main-5">活动发布</a></li>
          </ul>
        </div>
      </div>
      <!-- 其他 -->
      <!-- 一个脱离正常文本流的div -->
      <div class="absolute-hg"></div>
      <!-- 一个脱离正常文本流的上弹菜单按钮 -->
      <div class="btn-container">
        <!-- 以下是经bootstrap中文文档复制而来并经过修改的代码 -->
        <div class="btn-group dropup">
          <button type="button" class="btn dropdown-toggle btn-shelter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">管理</button>
          <ul class="dropdown-menu">
            <!-- Dropdown menu links -->
            <li><a href="#main-1">收藏的美食</a></li>
            <li><a href="#main-2">收藏的活动</a></li>
            <li><a href="#main-3">修改密码</a></li>
            <li><a href="#main-4">美食预约</a></li>
            <li><a href="#main-5">活动预约</a></li>
          </ul>
      </div>
      </div>
      <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${ctx}/static/vendor/jquery/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${ctx}/static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/vendor/otherjs/cities.js"></script>
    <script>
    function cancelOrder(event){
      console.log("clickToCancelOrder!");
      parentElement = event.srcElement.parentNode;
      let activityIdDiv = parentElement.children[0];
      let id = activityIdDiv.innerHTML;
      console.log(id);
      $.get("${ctx}/activity/cancelOrder?id="+id,function(data){
        if(data){
          parentElement.remove();
       	}
      });
    };
    function cancelCollect(event){
    	console.log("clickToCancelCollectFood!");
    	parentElement = event.srcElement.parentNode;
        let foodIdDiv = parentElement.children[1];
        let id = foodIdDiv.innerHTML;
        console.log(id);
        $.get("${ctx}/food/cancelCollect?id="+id,function(data){
        	if(data) {
        		parentElement.remove();
        	}
        });
    };
    $(function(){
        // li和a的样式切换
        // 当点击li所在的区域的时候；当点击a标签时实际上也是在点击li标签，所以，只写li的响应就行;
        // 注意事项：得确保每个a都有对应的跳转项
        $('.container-myself .left-navbar .item-list li').click(function(){
          $(this).parent('ul.item-list').children('li.active-my').removeClass('active-my');
          $(this).addClass('active-my');//li添加了active-my类之后，它之下的a的字体颜色就会自动改变（在css中已定义）

          // 先隐藏所有的div，再显示对应的a标签的对应的项目
          var href=$(this).children('a').attr('href');
          // console.log(href);
          $('.right-main .content').children('.main').hide();
          $('.right-main .content').children('.main'+href).show();

          //点击事件可能造成整个文档的高度的改变;把左边栏的高度设置好
          //51是顶部导航栏的高度
          var docHeight = Math.max($('ul.item-list').height() + 51, $('div.right-main').height() + 51);
          //console.log(docHeight);
          var browserHeight = $(window).height();
          //console.log(browserHeight);
          if(docHeight < browserHeight){
            $(".absolute-hg").css('height', browserHeight);
          }
          else{
            $(".absolute-hg").css('height', docHeight);
          }            
        });  

        // 上拉菜单中的li的点击事件
        $('.btn-container .dropup ul.dropdown-menu li').click(function(){
          // 先隐藏所有的div，再显示对应的a标签的对应的项目
          var href=$(this).children('a').attr('href');
          // console.log(href);
          $('.right-main .content').children('.main').hide();
          $('.right-main .content').children('.main'+href).show();
          $('.right-main .content').children('.main'+href).css('margin-top','50px');

          //点击事件可能造成整个文档的高度的改变;把左边栏的高度设置好
          //51是顶部导航栏的高度
          var docHeight = Math.max($('ul.item-list').height() + 51, $('div.right-main').height() + 51);
          //console.log(docHeight);
          var browserHeight = $(window).height();
          //console.log(browserHeight);
          if(docHeight < browserHeight){
            $(".absolute-hg").css('height', browserHeight);
          }
          else{
            $(".absolute-hg").css('height', docHeight);
          }         
        });

        $('button#step-num-btn').click(function(){
            //全部清掉步骤部分的form-group
            $('div.step-detail').children('div.form-group').remove();
            
            //完全重新生成
            let str=['零','一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十'];
            let create='';            
            let num=$("#step-num").val();
            //console.log(num);
            for(let i=1;i<=num;i++){
               create='<div class="form-group">'+
             			'<label for="step'+i+'" class="col-sm-2 control-label">步骤'+str[i]+'</label>'+
             			'<div class="col-sm-10">'+
             				'<input type="text" class="form-control" id="step'+i+'" placeholder="步骤'+str[i]+'具体操作" name="stepDesc" required>'+
             			'</div>'+
             		  '</div>'+
             		  '<div class="form-group">'+
             			'<label for="uploadImageForStep'+i+'" class="col-sm-2 control-label">上传照片</label>'+
             			'<div class="col-sm-10">'+
             				'<input type="file" id="uploadImageForStep'+i+'" name="picFile" accept="image/*" required>'+
             				'<img class="foodImage" id="subImage'+i+'" src="" alt="">'+
             			'</div>'+
             		  '</div>';
              $("div.step-detail").append(create);
            }
            //点击事件可能造成整个文档的高度的改变;把左边栏的高度设置好
            //51是顶部导航栏的高度
            var docHeight = Math.max($('ul.item-list').height() + 51, $('div.right-main').height() + 51);
            //console.log(docHeight);
            var browserHeight = $(window).height();
            //console.log(browserHeight);
            if(docHeight < browserHeight){
              $(".absolute-hg").css('height', browserHeight);
            }
            else{
              $(".absolute-hg").css('height', docHeight);
            }         
        });     
        $(document).on("change",':file',function(){	
            var reads= new FileReader();
            //获取上传的文件
            f=$(this).get(0).files[0];
            //读取file文件
            reads.readAsDataURL(f);
            //处理image
            var id=$(this).get(0).id;
            //console.log(id);
            var imageName="mainImage"
            if(id.indexOf('uploadImageForStep')>=0){
            	imageName="subImage"+id.substring(18);
            }   
            if(id.indexOf('uploadImageForActivity')>=0){
            	imageName="activityImage"+id.substring(22);
            	//console.log(imageName);
            }
            reads.onload=function (e) {
                document.querySelector('#'+imageName).src =this.result;
            };
        });
        
        /*根据id获取对象*/
        /*
        function $(str) {
            return document.getElementById(str);
        }*/
         
        //var addrShow = $('addr-show');
        //var btn = document.getElementsByClassName('met1')[0];
        var prov = $("#prov");
        var city = $("#city");
        var country = $("#country");
         
         
        /*用于保存当前所选的省市区*/
        var current = {
            prov: '',
            city: '',
            country: ''
        };
         
        /*自动加载省份列表*/
        function showProv() {
            //btn.disabled = true;
            var len = province.length;
            for (var i = 0; i < len; i++) {
                var provOpt = document.createElement('option');
                //let selected = province[i]['name'];
                //console.log(selected);
                provOpt.innerText = province[i]['name'];
                provOpt.value = province[i]['name'];
                provOpt.setAttribute("serinum",i);
                prov.append(provOpt);
            }
        };
        flagOptions = false;
        $('a[href="#main-5"]').parent("li").click(function(){
        	//showProv();
        	if(!flagOptions){
        		showProv();
        		flagOptions = true;
        	}
        })
         
        /*根据所选的省份来显示城市列表*/
        function showCity(number) {
            //var val = obj.options[obj.selectedIndex].value;
            if (number != current.prov) {
                current.prov = number;
            }
            //console.log(val);
            if (number != null) {
                $("#city option[value]").remove();//清空之前的内容只留第一个默认选项
                var cityLen = province[number]['city'].length;
                for (var j = 0; j < cityLen; j++) {
                    var cityOpt = document.createElement('option');
                    cityOpt.innerText = province[number]['city'][j]['name'];
                    cityOpt.value = province[number]['city'][j]['name'];
                    cityOpt.setAttribute("serinum",j);
                    city.append(cityOpt);
                }
            }
        }
        
        $("#prov").on("change",function(){
        	showCity($(this).find('option:selected').attr("serinum"));
        	//console.log($(this).find('option:selected').attr("serinum"));
        });
         
        /*根据所选的城市来显示县区列表*/
        function showCountry(number) {
            //var val = obj.options[obj.selectedIndex].value;
            current.city = number;
            if (number != null) {
                $("#country option[value]").remove();//清空之前的内容只留第一个默认选项
                var countryLen = province[current.prov]['city'][number].districtAndCounty.length;
                //if (countryLen == 0) {
                 //  addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name;
                 //   return;
                //}
                for (var n = 0; n < countryLen; n++) {
                    var countryOpt = document.createElement('option');
                    countryOpt.innerText = province[current.prov]['city'][number].districtAndCounty[n];
                    countryOpt.value = province[current.prov]['city'][number].districtAndCounty[n];
                    countryOpt.setAttribute("serinum",n)
                    country.append(countryOpt);
                }
            }
        };
        $("#city").on("change",function(){
        	showCountry($(this).find('option:selected').attr("serinum"));
        });
         
        /*选择县区之后的处理函数*/
        function selectCountry(number) {
            //current.country = obj.options[obj.selectedIndex].value;
        	current.country = number;
        	console.log(province[current.prov].name + '-' + province[current.prov]["city"][current.city].name + '-' + province[current.prov]["city"][current.city].districtAndCounty[current.country]);
        }
        $("#country").on("change",function(){
        	selectCountry($(this).find('option:selected').attr("serinum"));
        });
        
        let activityImageCount = 1;
        $("#addActivityPic").click(function(){
        	activityImageCount++;
        	let newItem = 
        	'<div class="form-group activityImageGroupAt' + activityImageCount+'">' +
              '<label for="uploadImageForActivity'+ activityImageCount+'"'+' class="col-sm-2 control-label">上传照片'+activityImageCount+'</label>' +
              '<div class="col-sm-10">' +
                '<input type="file" id="uploadImageForActivity'+activityImageCount+'"' +'name="picFile" accept="image/*" required>' +
                '<img class="activityImage" id="activityImage'+activityImageCount+'"'+' src="" alt="" style="width:200px;height:200px;">' +
              '</div>' +
            '</div>';
            $("div.activityImageGroup").append(newItem);
            
            //点击事件可能造成整个文档的高度的改变;把左边栏的高度设置好
            //51是顶部导航栏的高度
            var docHeight = Math.max($('ul.item-list').height() + 51, $('div.right-main').height() + 51);
            //console.log(docHeight);
            var browserHeight = $(window).height();
            //console.log(browserHeight);
            if(docHeight < browserHeight){
              $(".absolute-hg").css('height', browserHeight);
            }
            else{
              $(".absolute-hg").css('height', docHeight);
            }         
        });
        $("#deleteActivityPic").click(function(){
        	if(activityImageCount==1){
        		alert("至少要上传一张图片，不能再减了");
        	}
        	else{
        		$(".activityImageGroup .activityImageGroupAt"+activityImageCount).remove();
            	activityImageCount--;
        	}
        	
        	//点击事件可能造成整个文档的高度的改变;把左边栏的高度设置好
            //51是顶部导航栏的高度
            var docHeight = Math.max($('ul.item-list').height() + 51, $('div.right-main').height() + 51);
            //console.log(docHeight);
            var browserHeight = $(window).height();
            //console.log(browserHeight);
            if(docHeight < browserHeight){
              $(".absolute-hg").css('height', browserHeight);
            }
            else{
              $(".absolute-hg").css('height', docHeight);
            }         
        });    
        
        flagLoginName = false;
        flagOriginalPassword = false;
        flagNewPassword = false;
        regOfNewPassword = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z\\W]{8,15}$/;
        $("div#changePassword").on('focus','[name="loginName"]',function(){
        	$("#tipForLoginName").html("");
        });
        $("div#changePassword").on('blur','[name="loginName"]',function(event){
        	if(event.target.value === ''){
        		$("#tipForLoginName").html("登录名不能为空");
        	}
        	else if(event.target.value !== currUser.loginName){
        		$("#tipForLoginName").html("登录名与当前登录用户不一致");
        	}
        	else{
        		flagLoginName = true;
        		$("#tipForLoginName").html("");
        	}
        });
        $("div#changePassword").on('focus','[name="originalPassword"]',function(){
        	$("#tipForOriginalPassword").html("");
        });
        $("div#changePassword").on('blur','[name="originalPassword"]',function(event){
        	let oPsw = event.target.value;
        	if(oPsw === ''){
        		$("#tipForOriginalPassword").html("原密码不能为空");
        	}
        	else{
        		flagOriginalPassword = true;
        	}
        });
        $("div#changePassword").on('focus','[name="newPassword"]',function(){
        	$("#tipForNewPassword").html("");
        });
        $("div#changePassword").on('input','[name="newPassword"]',function(event){
        	let password = event.target.value;
        	flagNewPassword = regOfNewPassword.test(password);
        });
        $("div#changePassword").on('blur','[name="newPassword"]',function(event){
        	if(!flagNewPassword){
        		if(event.target.value===''){
        			$("#tipForNewPassword").html('新密码不能为空');
        		}
        		else{
        			$("#tipForNewPassword").html('密码必须为8-15位数字和字母的组合！');
        		}
        	}
        	else{
        		$("#tipForNewPassword").html('');
        	}
        });
        $('div#changePassword button#btn-submit').on('click',function(){
        	console.log("click to submit to change password!");
        	if(!flagLoginName || !flagOriginalPassword || !flagNewPassword){
        		alert("请检查表单输入并重新填写");
        		this.reset();
        	}
        	else{
        		if($('input[name="originalPassword"]').val() === $('input[name="newPassword"]').val()){
        			alert("两次密码输入不能相同");
        		}
        		else{
        			$.ajax({
            			type:'post',
            			url:'${ctx}/changePassword',
            			dataType:'json',
            			contentType:'application/json;charset=UTF-8',
            			data:JSON.stringify({
            				originalPassword:$('input[name="originalPassword"]').val(),
            				newPassword:$('input[name="newPassword"]').val()
            			}),
            			success:function(responseTxt){
            				console.log(responseTxt.success);
            				console.log(responseTxt.msg);
            				if(!responseTxt.success){
            					alert("您输入的原密码不正确，校验未通过");
            				}
            				else{
            					alert("密码修改成功");
            					window.location.href = "${ctx}/login";
            				}
            			}
            		});
        		}
        	}
        });
        
        (function(){
        	$.get("${ctx}/getFoodCollectList",function(data){
        		//console.log(data);
        		for(let i=0;i<data.length;i++){
        			let newLi = '<li><a href="food-detail?id='+data[i]["food"].id+'">'+data[i]["food"].foodName+'</a><p id="food-id" style="display:none">'+data[i]["food"].id+'</p><button class="btn-cancel" onclick="cancelCollect(event)">取消收藏</button></li>';
        			$("#main-1 ul#foodCollectListZone").append(newLi);
        		}
        	});
        }());
        
        (function(){
        	$.get("${ctx}/getActivityOrderList",function(data){
        		//console.log(data);
        		/*<div>
                      <li><a href="activity #act-1">新年家宴-云南菜</a></li>
                      <button class="btn-cancle">已预约，取消</button>
                    </div>
                    <div>
                      <li><a href="activity #act-2">新年家宴-法式甜品</a></li>
                      <button class="btn-endact">活动结束</button>
                    </div>*/
        		for(let i=0;i<data.length;i++){
        			let newElement = '<div>';
        			newElement += '<p id="activity-id" style="display:none">'+data[i]["activity"].id+'</p>'
        			newElement += '<li><a href="${ctx}/activity?id='+data[i]["activity"].id+'">'+data[i]["activity"].activityName+'</a></li>';
        			//let date = new Date();
        			//console.log(date.valueOf());
        			if(data[i]["activity"].endDate > Date.now()){
        				newElement += '<button class="btn-cancle" onclick="cancelOrder(event)">已预约，取消</button>';
        			}
        			else{
        				newElement += '<button class="btn-endact" disabled="disabled">活动结束</button>';
        			}
        			newElement += '</div>';
        			$("div#activityOrderListZone").append(newElement);
        		}
        	});
        }());
      })
    </script>
  </body>
</html>