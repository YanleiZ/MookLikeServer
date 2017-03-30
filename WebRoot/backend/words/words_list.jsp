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
                <td width="94%" valign="bottom"><span class="STYLE1"> 教学文档信息列表</span></td>
              </tr>
            </table></td>
            <script>
            	function checkAll(item){
            		var chk = document.getElementsByName("wordsCheckbox");
            		for ( var i = 0; i < chk.length; i++) {
						chk[i].checked = item.checked;
					}
            	}
            	function del(){
					document.getElementById("form_words_betch").action="WordsServlet?method=deleteBetch&pageNo=${page.pageNo }&pageSize=${page.pageSize }";
            		document.getElementById("form_words_betch").submit();
            	}
            </script>
            <td><div align="right"><span class="STYLE1">
<c:if test="${login_user.role.id eq '1'}">
             &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> <a href="WordsServlet?method=addInput">添加</a>   
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
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">名称</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">上传时间</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">摘要</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">文件</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">展示图片</span></div></td>
        <td width="200" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <c:if test="${not empty wordsList}">
      <form id="form_words_betch" method="post">
      <c:forEach items="${wordsList}" var="words">
<tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="wordsCheckbox" value="${words.id }"/>
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${words.name }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${words.settime }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${words.course.name }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${words.descp }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href='upload_file/${words.docts }'>下载文件</a></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><img src='upload_image/${words.img }' style='max-height:80px'/></div></td>
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
        <a href="javascript:delconfirm('WordsServlet?method=delete&id=${words.id }&pageNo=${page.pageNo }&pageSize=${page.pageSize }')" title="点击删除项目信息">删除</a> |
        <a href="WordsServlet?method=modify&id=${words.id }&pageNo=${page.pageNo }&pageSize=${page.pageSize }" title="点击编辑项目信息">编辑</a>
        </div></td>
      </tr>
      </c:forEach>
      </form>
      </c:if>
      <c:if test="${ empty wordsList }">
      <tr>
          <td height="20" colspan="9" bgcolor="#FFFFFF" class="STYLE19"><div align="center">没有教学文档信息可以显示</div></td>
      </tr>
      </c:if>
    </table></td>
  </tr>
<form id="form_page" action="WordsServlet" method="post">
	<input type="hidden" name="pageNo" value="${page.pageNo }" id="pageNo" />
	<input type="hidden" name="pageSize" value="${page.pageSize }" id="pageSize"/>
</form>  
<%--   <%@include file="/backend/commons/page.jsp" %> --%>
<%@include file="/backend/commons/page.jsp" %>
</table>
</body>
</html>

