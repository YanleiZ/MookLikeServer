<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/backend/";
request.setAttribute("isSupportCheckCode",config.getServletContext().getInitParameter("isSupportCheckCode").equals("1")?true:false);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script  src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/js.js"></script>
	<script type="text/javascript">
			$(document).ready(function(){
			    $(".sysName").load("sysName.txt",function(data,x){
			    	document.title=data;
			    });	
			});
	</script>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style/skin.css" />
	<link rel="shortcut icon" href="images/logo2.png">
</head>
<body>


<table width="100%">
            <!-- 顶部部分 -->
            <tr height="41"><td colspan="2" background="images/login_top_bg.gif">&nbsp;</td></tr>
            <!-- 主体部分 -->
            <tr style="background:url(images/login_bg.jpg) repeat-x;" height="532">
                <!-- 主体左部分 -->
                <td id="left_cont">
                    <table width="100%" height="100%">
                        <tr height="100"><td colspan="2">&nbsp;</td></tr>
                        <tr>
                            <td width="20%" rowspan="2">&nbsp;</td>
                            <td width="60%">
                                <table width="100%">
                                    <tr height="70"><td align="right"><img src="images/logo.gif" title="" alt="" /></td></tr>
                                    <tr height="274">
                                        <td valign="top" align="right">
                                            <ul>
                                                <li><img src="images/logo5.png"  width="250px"/></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            <td width="15%" rowspan="2">&nbsp;</td>
                            </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                    </table>
                </td>
                <!-- 主体右部分 -->
                <td id="right_cont">
                    <table height="100%">
                        <tr height="27%"><td colspan="3">&nbsp;</td></tr>
                        <tr>
                            <td width="30%" rowspan="5">&nbsp;</td>
                            <td valign="top" id="form">
                                <form action="" method="">
                                    <table valign="top" width="100%">
                                        <tr><td colspan="2"><h4 style="letter-spacing:1px;font-size:25px;color:#2d84c6"><b class="sysName"></b></h4></td></tr>
                                    </table>
                                </form><br>
                                
                                
<form id="login" action="LoginServlet" method="post">
  <div id="center">
    <div id="center_left"></div>	
    <div id="center_middle">
      <div class="user">
        <label>用户名：
        <input type="text" name="username" id="username" />
        </label>
      </div>
      <br>
      <div class="user">
        <label>密　码：
        <input type="password" name="password" id="password" />
        </label>
      </div>
      <br>
      <c:if test="${isSupportCheckCode}">
      <div class="chknumber">
        <label>验证码：
        <input name="code" type="text" id="chknumber" size="6" maxlength="4" class="chknumber_input" />
        </label>
  <script>
  	function reloadImg(){
  		document.getElementById("safecode").src="CheckCode.jpg?x="+Math.random();
  	}
  </script>
        <img src="CheckCode.jpg" id="safecode" onclick="reloadImg();"/>
      </div>
       <br>
      </c:if>
      <div class="user">
    	${login_error}
      </div>
       <br>
    </div>
    <div id="center_middle_right"></div>
    <div id="center_submit">
    <input type="button" style="padding:1px 10px;height:25px;cursor:pointer" onclick="form_submit()" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" style="padding:1px 10px;height:25px;cursor:pointer"onclick="window.location.href='MemberServlet?method=addInput'" value="注册" />
    </div>
    <div id="center_right"></div>
  </div>
</form>
                                
                                
                                
                                
                            </td>
                            <td rowspan="5">&nbsp;</td>
                        </tr>
                        <tr><td colspan="3">&nbsp;</td></tr>
                    </table>
                </td>
            </tr>
            <!-- 底部部分 -->
            <tr id="login_bot"><td colspan="2">毕业设计 &copy; <a href="/"  style="color:#c4e0fa;"><b class="sysName"></b>的设计与实现</a> All Rights Reserved</td></tr>
        </table>


</body>
</html>

