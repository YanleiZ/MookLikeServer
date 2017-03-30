<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/backend/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CMS 后台管理工作平台</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
A:active,A:visited,A:link {
	COLOR: #0629FD;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #FF6600;
	TEXT-DECORATION: none
}

A.relatelink:active,A.relatelink:visited,A.relatelink:link { 
	color: white;
	TEXT-DECORATION: none
}

A.relatelink:hover {
	COLOR: #FF6600;
	TEXT-DECORATION: none
}

td {
	font-size: 12px;
	color: #003366;
	height:24px
}

.STYLE1 a{
	COLOR: white;
}
.STYLE1 A:active,.STYLE1 A:visited,.STYLE1 A:link {
	COLOR: white;
	TEXT-DECORATION: none
}
.STYLE1 a:hover{
	COLOR: red;
}
-->
</style>

</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 已做试题信息列表</span></td>
              </tr>
            </table></td>
            <script>
            	function checkAll(item){
            		var chk = document.getElementsByName("doneTestCheckbox");
            		for ( var i = 0; i < chk.length; i++) {
						chk[i].checked = item.checked;
					}
            	}
            	function del(){
					document.getElementById("form_doneTest_betch").action="DoneTestServlet?method=deleteBetch&pageNo=${page.pageNo }&pageSize=${page.pageSize }";
            		document.getElementById("form_doneTest_betch").submit();
            	}
            </script>
            <td><div align="right"><span class="STYLE1">
<c:if test="${login_user.role.id eq '1'}">
             &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> <a href="DoneTestServlet?method=addInput">添加</a>   
             &nbsp; <img src="images/del.gif" width="10" height="10" /> <a href="javascript:del()">批量删除</a>    &nbsp;&nbsp;   &nbsp;
</c:if>
             </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox"  onclick="checkAll(this)"/>
        </div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程测试</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">测试时间</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <c:if test="${not empty doneTestList}">
      <form id="form_doneTest_betch" method="post">
      <c:forEach items="${doneTestList}" var="doneTest">
      <c:if test="${login_user.role.id ne '2'}">
<tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="doneTestCheckbox" value="${doneTest.id }"/>
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${doneTest.member.name }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${doneTest.tests.name }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${doneTest.settime }</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21">
        <script>
        	function delconfirm(str){
        		var c = confirm("确认要删除此项吗？");
				if(c){
				  window.location.href=str;
				}else{
				
				}

        	}
        </script>
        <a href="javascript:delconfirm('DoneTestServlet?method=delete&id=${doneTest.id }&pageNo=${page.pageNo }&pageSize=${page.pageSize }')" title="点击删除项目信息">删除</a> |
        <a href="DoneTestServlet?method=modify&id=${doneTest.id }&pageNo=${page.pageNo }&pageSize=${page.pageSize }" title="点击编辑项目信息">编辑</a>
        </div></td>
      </tr>
</c:if>
      <c:if test="${login_user.role.id eq '2'}">
<c:if test="${doneTest.member.users.id eq login_user.id}">
<tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="doneTestCheckbox" value="${doneTest.id }"/>
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${doneTest.member.name }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="TestsServlet?method=content&id=${doneTest.id } " target="_blank">${doneTest.tests.name }</a></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${doneTest.settime }</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21">
        <script>
        	function delconfirm(str){
        		var c = confirm("确认要删除此项吗？");
				if(c){
				  window.location.href=str;
				}else{
				
				}

        	}
        </script>
        <a href="javascript:delconfirm('DoneTestServlet?method=delete&id=${doneTest.id }&pageNo=${page.pageNo }&pageSize=${page.pageSize }')" title="点击删除项目信息">删除</a> 
        </div></td>
      </tr>
</c:if>
</c:if>
      </c:forEach>
      </form>
      </c:if>
      <c:if test="${ empty doneTestList }">
      <tr>
          <td height="20" colspan="9" bgcolor="#FFFFFF" class="STYLE19"><div align="center">没有已做试题信息可以显示</div></td>
      </tr>
      </c:if>
    </table></td>
  </tr>
<form id="form_page" action="DoneTestServlet" method="post">
	<input type="hidden" name="pageNo" value="${page.pageNo }" id="pageNo" />
	<input type="hidden" name="pageSize" value="${page.pageSize }" id="pageSize"/>
</form>  
<%--   <%@include file="/backend/commons/page.jsp" %> --%>
<%@include file="/backend/commons/page.jsp" %>
</table>
</body>
</html>

