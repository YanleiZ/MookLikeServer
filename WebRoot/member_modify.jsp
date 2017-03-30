<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Expires" CONTENT="-1">           
<meta http-equiv="Cache-Control" CONTENT="no-cache">           
<meta http-equiv="Pragma" CONTENT="no-cache">           
<title></title>
<meta name="description" content="">
<meta name="Keywords" content="">

   	<link rel="stylesheet" href="style/css/pintuer.css">
    <script src="style/js/jquery.js"></script>
    <script src="style/js/jquery.lazyload.min.js"></script>
	<script src="style/js/jquery.easing.min.js"></script>
    <script src="style/js/pintuer.js"></script>

	
	
	<link rel="stylesheet" href="style/css/style-out-base.css">

    <script src="style/js/respond.js"></script>
    <link type="image/x-icon" href="#/favicon.ico" rel="shortcut icon" />
    <link href="#/favicon.ico" rel="bookmark icon" />
	 <link rel="stylesheet" href="style/css/style.css">
    <style>
		.demo-nav.fixed.fixed-top{z-index:8;background:#fff;width:100%;padding:0;border-bottom:solid 3px #0a8;-webkit-box-shadow:0 3px 6px rgba(0, 0, 0, .175);box-shadow:0 3px 6px rgba(0, 0, 0, .175);}
    </style>

</head>

<body>

<%@include file="/common/head.jsp"%>


  	

<div id="" class="clr"></div>



	<div id="" class="" style="background:#f5f5f5">
		<div class="container" style="padding:10px 0 0 0;">
			<div class="line-small margin-big-bottom " style="padding:0px;">

 <%@include file="/common/buyerMenu.jsp"%> 				
<input type="hidden" id="buyerMenuHover" value="buyerMenuHover1" >		



				<div id="" class="xl12 xs9" style="background:#f5f5f5;padding:0px;">
<div id="" class="xl12"style="background:#fff;padding:10px 10px;margin:0 0 10px;">
		<div id="" class="xl12" style="">
			<span class="seller-right-head">个人信息</span>
		</div>
		<div id="" class="xl12 ">
			<span class="seller-right-head1 xl12 ">修改个人信息</span>
			<div id="" class="xl12 ">
				<form class="storeapply" method="post" action="MemberServlet?method=update2" > 
					<input type="hidden" class="input" id=id name="id" value="${member.id }" /> 
					<input type="hidden" class="input" id="user" name="user" value="${login_user.id }" /> 
				   <div class="form-group">
				   <div class="label">
					 <label for="username">姓名</label>
					</div> 
    <div class="field field-icon">
	  <span class="icon icon-user"></span>
      <input class="input" id="name" name="name" value="${member.name }" size="30" data-validate="required:必填" placeholder="姓名" type="text">
    </div>
  </div>
				   <div class="form-group">
				   <div class="label">
					 <label for="sex">性别</label>
					</div> 
    <div class="field field-icon">
	  <span class="icon icon-user"></span>
      <input class="input" id="sex" name="sex" value="${member.sex }" size="30" data-validate="required:必填" placeholder="性别" type="text">
    </div>
  </div>
  <div class="form-group">
  <div class="label">
					 <label for="username">验证手机</label>
					</div> 
    <div class="field field-icon">
	  <span class="icon icon-mobile-phone"></span>
      <input class="input" id="tel" name="tel" size="30"value="${member.tel }" data-validate="required:必填" placeholder="完成验证后您可使用手机号找回密码" type="text">
    </div>
  </div>
  <div class="form-group">
  <div class="label">
					 <label for="username">地址</label>
					</div> 
    <div class="field field-icon">
	  <span class="icon icon-map-marker"></span>
      <input class="input" id="address" name="address" size="30"value="${member.address }" data-validate="required:必填" placeholder="地址" type="text">
    </div>
  </div>
  <div class="form-group">
  <div class="label">
					 <label for="username">邮箱</label>
					</div> 
    <div class="field field-icon">
	  <span class="icon icon-envelope"></span>
      <input class="input" id="email" name="email" size="30"value="${member.email }" data-validate="required:必填" placeholder="邮箱" type="text">
    </div>
  </div>
				   <div class="form-button">
					<button  class="button asksubmit" type="submit" onclick="$('form[class=storeapply]').submit()">提交申请</button>
				   </div> 
				  </form>
			</div>
			
		</div>
		
	</div>










				</div>





			</div>
		</div>
	</div>
<%@include file="/common/foot.jsp"%>
</body>
</html>
<!--index_ok-->
