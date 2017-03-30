<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/backend/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script  src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
			$(document).ready(function(){
			    $(".sysName").load("sysName.txt",function(data,x){
			    	document.title=data;
			    });	
			});
	</script>
	<link rel="stylesheet" type="text/css" href="style/skin.css" />
	<title></title>

</head>
<body>
<table cellpadding="0" width="100%" height="64" background="images/top_top_bg.gif">
            <tr valign="top" class="topclass">
                <td width="50%"><a href="javascript:void(0)"><img style="border:none" src="images/logo.png" /></a></td>
                <b class="sysName sysName1"></b>
                <td width="30%" style="padding-top:13px;font:15px Arial,SimSun,sans-serif;color:#FFF"><b>${login_user.username}</b> 您好，欢迎登陆使用！</td>
                <td style="padding-top:10px;" align="center"><a href="javascript:window.parent.location.href='main.jsp'" target="" style="color:#c4e0fa;background:url(images/button.png);width:46px;height:20px;display: inline-block;">主页</a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:history.go(-1);" style="color:#c4e0fa;background:url(images/button.png);width:46px;height:20px;display: inline-block;">后退</a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:history.go(1);" style="color:#c4e0fa;background:url(images/button.png);width:46px;height:20px;display: inline-block;">前进</a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:window.parent.location.reload();" style="color:#c4e0fa;background:url(images/button.png);width:46px;height:20px;display: inline-block;">刷新</a></td>
                <td style="padding-top:10px;" align="center"><a href="LoginServlet?method=loginout" target="_parent"style="color:#c4e0fa;background:url(images/button.png);width:46px;height:20px;display: inline-block;">退出</a></td>
            </tr>
        </table>

</body>
</html>

