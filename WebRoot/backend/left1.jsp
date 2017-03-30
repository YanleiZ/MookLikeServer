<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/backend/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
<script src="js/prototype.lite.js" type="text/javascript"></script>
    <script src="js/moo.fx.js" type="text/javascript"></script>
    <script src="js/moo.fx.pack.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="style/skin.css" />
    <script type="text/javascript">
        window.onload = function () {
            var contents = document.getElementsByClassName('content');
            var toggles = document.getElementsByClassName('type');

            var myAccordion = new fx.Accordion(
            toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                    dl_a.onfocus=function(){
                        this.blur();
                    }
            }
        }
    </script>
</head>

<body>
    <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
        <tr>
            <td width="182" valign="top">
                <div id="container">
                    <h1 class="type"><a href="javascript:void(0)">用户管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="MemberServlet?method=addInput" target="rightFrame">添加用户</a></li>
      						  <li><a href="MemberServlet" target="rightFrame">查看用户信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">管理员账号管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="AdminsServlet?method=addInput" target="rightFrame">添加管理员账号</a></li>
        <li><a href="AdminsServlet" target="rightFrame">查看管理员信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">课程管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="CourseServlet?method=addInput" target="rightFrame">添加课程</a></li>
        <li><a href="CourseServlet" target="rightFrame">查看课程信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">教学课件管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="PptsServlet?method=addInput" target="rightFrame">添加教学课件</a></li>
        <li><a href="PptsServlet" target="rightFrame">查看教学课件信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">教学视频管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="VideosServlet?method=addInput" target="rightFrame">添加教学视频</a></li>
        <li><a href="VideosServlet" target="rightFrame">查看教学视频信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">教学文档管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="WordsServlet?method=addInput" target="rightFrame">添加教学文档</a></li>
        <li><a href="WordsServlet" target="rightFrame">查看教学文档信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">课程测试管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="TestsServlet?method=addInput" target="rightFrame">添加课程测试</a></li>
        <li><a href="TestsServlet" target="rightFrame">查看课程测试信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">已做试题管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="DoneTestServlet?method=addInput" target="rightFrame">添加已做试题</a></li>
        <li><a href="DoneTestServlet" target="rightFrame">查看已做试题信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">新闻公告管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="NewsServlet?method=addInput" target="rightFrame">添加新闻公告</a></li>
        <li><a href="NewsServlet" target="rightFrame">查看新闻公告信息</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">角色管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="role/add_role.jsp" target="rightFrame">添加角色</a></li>
        <li><a href="RoleServlet" target="rightFrame">查看角色信息</a></li>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">系统管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
        <li><a href="sys/update_password.jsp" target="rightFrame">修改个人密码</a></li>
        <li><a href="/log.log" target="rightFrame">查看登录日志</a></li>
        <li><a href="UserServlet?method=users" target="rightFrame">查看在线用户</a></li>
                    </div>
                    <!-- *********** -->
                </div>
            </td>
        </tr>
    </table>
</body>
</html>

