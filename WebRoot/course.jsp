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
      <div class="xl9 " style="margin:18px 0 10px 0;padding:0 ;background:#fff">
      
	      <div class="xl12 cltitle"style="padding: 0 20px">
	      <a href="javascript:void(0)">教学视频</a> 
	      </div>
	      <br>
	      <br>
	      <div class="xl12" style="padding: 0 20px 0 40px">
	      <c:forEach items="${videosList}" var="s">
		      <div class="xl2" style="margin-bottom:10px">
			      <div class="xl12" >
			      <a href="VideosServlet?method=content&id=${s.id}"><img alt="" src="upload_image/${s.img }" width="100%" ></a>
			      </div>
			      <div class="xl12"style="margin-top:10px;max-height:40px;overflow:hidden;text-align:center">
			      	 <a href="VideosServlet?method=content&id=${s.id } ">${s.name }</a>
			      </div>
		      </div>
	      </c:forEach>
	      </div>
	      <div class="xl12 cltitle"style="padding: 0 20px">
	      <a href="javascript:void(0)">教学文档</a> 
	      </div>
	      <br>
	      <br>
	      <div class="xl12" style="padding: 0 20px 0 40px">
	      <c:forEach items="${wordsList}" var="s">
		      <div class="xl2" style="margin-bottom:10px">
			      <div class="xl12" >
			      <a href="WordsServlet?method=content&id=${s.id}"><img style="border:1px solid #9ec7c8"alt="" src="upload_image/${s.img }" width="100%" ></a>
			      </div>
			      <div class="xl12"style="margin-top:10px;max-height:40px;overflow:hidden;text-align:center">
			      	 <a href="WordsServlet?method=content&id=${s.id } ">${s.name }</a>
			      </div>
		      </div>
	      </c:forEach>
	      </div>
	      <div class="xl12 cltitle"style="padding: 0 20px">
	      <a href="javascript:void(0)">教学课件</a> 
	      </div>
	      <br>
	      <br>
	      <div class="xl12" style="padding: 0 20px 0 40px">
	      <c:forEach items="${pptsList}" var="s">
		      <div class="xl2" style="margin-bottom:10px">
			      <div class="xl12" >
			      <a href="PptsServlet?method=content&id=${s.id}"><img style="border:1px solid #9ec7c8"alt="" src="upload_image/${s.img }" width="100%" ></a>
			      </div>
			      <div class="xl12"style="margin-top:10px;max-height:40px;overflow:hidden;text-align:center">
			      	 <a href="PptsServlet?method=content&id=${s.id } ">${s.name }</a>
			      </div>
		      </div>
	      </c:forEach>
	      </div>
	      <div class="xl12 cltitle"style="padding: 0 20px">
	      <a href="javascript:void(0)">课程测试</a> 
	      </div>
	      <br>
	      <br>
	      <div class="xl12" style="padding: 0 20px 0 40px">
	      <c:forEach items="${testsList}" var="s">
		      <div class="xl6" style="margin-bottom:10px">
		       <a href="TestsServlet?method=content&id=${s.id } ">
			      <div class="xl12"style="margin-top:10px;max-height:40px;overflow:hidden">
			      	${s.name }
			      </div>
			      </a>
		      </div>
	      </c:forEach>
	      </div>
	      
	      
	      
	      
      
      </div>
      
      <div class="xl3" style="padding: 20px 0 0px 5px  ">
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  </div>
      <div class="xl3" style="padding:10px 0 20px 5px ;border-radius:10px">
	      <div class="xl12  hotstore" style="border-radius:10px">
        	<h2 class="bg-3 text-white padding">新闻公告</h2>
            <div class="padding bg-content">
            	<ul class="list-media list-underline">
            		<c:forEach items="${newsList}" var="s">
                	<li>
                        <div class="media media-x">
                                                  <a class="float-left" href="NewsServlet?method=content&id=${s.id }"><img src="upload_image/${s.img}"  height="60px" class="radius" alt="..."></a>
                        
                          <div class="media-body"style="font-size:11px"><strong >${s.name }</strong>
${s.descp }
				<a class="button button-little border-red swing-hover" href="NewsServlet?method=content&id=${s.id }">查看详情</a></div>
                        </div>
                    </li>
</c:forEach>                

                </ul>
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
