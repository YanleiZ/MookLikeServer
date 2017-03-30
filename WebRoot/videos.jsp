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


  	

	<!--内容-->


<div id="navx4" class="">
<div class="container">
      <div class="line-small">
      <div class=" maincontent" style="margin-bottom:10px">
      	
	      <div class=" xl8" style="">
	      <input type="hidden" id="vpath" value="${videos.docts }">
	      
	      
	      <div id="a1"></div>
<script type="text/javascript" src="/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
    var flashvars={
        f:'upload_file/'+$("#vpath").val(),
        c:0
    };
    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
    CKobject.embedSWF('/ckplayer/ckplayer.swf','a1','ckplayer_a1','680','400',flashvars,params);
</script>  
				
	<br>
	<br>


	      	${videos.content }
	      </div>
	      <div class=" xl4" style="">
	      	
		      <div class=" xl12 cxtitle text-center" style="">
		      	${videos.name }
		      </div>
		      <div class=" xl12 cxtitle text-center" style="margin:20px 0">
		      	<img alt="" src="upload_image/${videos.img }" width="100px" >
		      </div>
		      <div class=" xl12 text-center" style="margin:10px">
		      	发布时间：${videos.settime }
		      </div>
		      <div class=" xl12 text-center" style="margin:10px">
		      	视频简介：${videos.descp }
		      </div>
		      <div class=" xl12 text-center" style="margin:10px">
		      	<a href='upload_file/${videos.docts }'>下载视频</a>
		      </div>
		      
		      
		      
	      </div>
      </div>
      
      
      </div>
      <br />

    </div>
    
    <br /><br />
    







</div>
<%@include file="/common/foot.jsp"%>
</body>
</html>
<!--index_ok-->
