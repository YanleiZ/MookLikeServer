<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<link rel="shortcut icon" href="style/images/logo.png">
 <%@include file="/common/upload.jsp"%>  
 <%@include file="/common/login-regist.jsp"%>  
	<!--顶部-->



				<form action="MemberServlet" method="post" name="store_search" id="storeSearch" onSubmit="" >
				<input type="hidden" name="method"  value="members"/>
				<input type="hidden" name="searchid" id="searchid" value=""/>
				<input type="hidden" name="str" id="str" value=""/>
				</form>




<!--nav-->
	<div id="navx" class=" hidden-l hidden-s" style="background:#000;">
		<div class="container" style="width:100%">
		<div class="line-small  ">
			<div class=" navbox  text-right navxb3">
			    <a href="/">
			    <img class="" src="style/images/logo.png" style="padding:0px 0 0px" height="100px" border="0" alt="">
			    </a>
			</div>
			<%int i = 0; %>
	  <% i = 1; %>
			<c:forEach items="${courseList}" var="s">
			<%if(i<=4){ %>
 		  <%i++; %>
			<div class=" navbox  text-center navx1"><a href="IndexServlet?method=course&id=${s.id}"><span class=" nav_icon"></span><span>${s.name }</span></a></div>
			<%} %>
			</c:forEach>  
			<div class=" navbox  text-center navxb3" style="float:right"><span>
				<div class="xl12 text-center" style=" color:white;font:100 12px/18px yahei">
					  <span class="show-l"style=" float:right;color:white;font:100 12px/18px yahei">
					<c:if test="${ login_user.username eq null}">
						  <a class="  dialogs" style="color:#fff"data-toggle="click" data-target="#login" data-mask="1" data-width="350px" href="javascript:;">登录</a><span> | </span>
						  <a class="  dialogs" style="color:#fff"data-toggle="click" data-target="#regist" data-mask="1" data-width="500px" href="javascript:;"> 注册</a>
					  </c:if>
					  <c:if test="${ login_user.username ne null}">
						 欢迎你，${ login_user.username }<a href="LoginServlet?method=loginOutf" target="_parent">【退出】</a>
					  </c:if>
					  </span>
				</div>
				</span></div>
		</div>
		
		</div>
	</div>


	<!--导航-->
    
    

<div id="" class="clear"></div>




