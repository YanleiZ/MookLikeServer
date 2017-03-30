<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/backend/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>编辑教学课件</title>
<link rel="STYLESHEET" type="text/css" href="codebase/dhtmlxcalendar.css">
<script  src="codebase/dhtmlxcommon.js"></script>
<script  src="codebase/dhtmlxcalendar.js"></script>
<script src="js/jquery-1.9.1.min.js" language="javascript" /></script>
	<script src="js/js.js" language="javascript" /></script>
	<script src="ckeditor/ckeditor.js"></script>
<script>
		function initCKEditor(){
			CKEDITOR.replace( 'content' ,
			{
				width:900,
				height:500
			});
		}

var 
settime,
mCal,
mDCal,
newStyleSheet;
var dateFrom = null;
var dateTo = null;
window.onload = function() {
    settime = new dhtmlxCalendarObject('settime');
    initCKEditor();
}
</script>
<script>
function addcontent(){
	var ret = window.showModalDialog("upload.jsp",window,"dialogWidth=400px;dialogHeight=200px");
	if(ret!=null&&ret!=""){
		filename=ret.split("::")[0];
		contentType=ret.split("::")[1];
		var url="";
		if(contentType.indexOf("image")>-1){
			url='<div class="item"><a href="javascript:void(0)" ><img src="upload_image/'+filename+'"  style="width:100%;" ></a></div>';
		}else{
			url="<a href=\"upload_file/"+filename+"\" />下载文件</a>";
		}
		
		//向CKEDITOR插入html代码 url
		var editor = CKEDITOR.instances.content;
		// Check the active editing mode.
		if ( editor.mode == 'wysiwyg' )
		{
			// Insert HTML code.
			// http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertHtml
			var elements = CKEDITOR.dom.element.createFromHtml(url);
			editor.insertElement(elements);
		}
		else{
			alert( 'You must be in WYSIWYG mode!' );
		}
	
	}
}
 function image(str){
	var ret = window.showModalDialog("upload.jsp",window,"dialogWidth=400px;dialogHeight=200px");
	if(ret!=null&&ret!=""){
		filename=ret.split("::")[0];
		contentType=ret.split("::")[1];
		var url="";
		if(contentType.indexOf("image")>-1){
			if($("#"+str+"_image").size()>0){
			$("#"+str+"_image").attr("src","upload_image/"+filename+"");
			}else{
			$("#"+str).after("<img id='"+str+"_image' max-width='100%' src='upload_image/"+filename+"'>");
			}
		}else{
			if($("#"+str+"_file").size()>0){
			$("#"+str+"_file").attr("href","upload_file/"+filename+"");
			}else{
			$("#"+str).after("<a id='"+str+"_file'  href='upload_file/"+filename+"'>下载文件</a>");
			}
		}
		document.getElementById(str).value = filename;
		
	}
}

function InsertHTML(value){
	var editor = CKEDITOR.instances.content;
	// Check the active editing mode.
	if ( editor.mode == 'wysiwyg' )
	{
		// Insert HTML code.
		// http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertHtml
		editor.insertHtml( value );
	}
	else
		alert( 'You must be in WYSIWYG mode!' );
}
</script>
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#666666;
	background:#fff;
	text-align:center;

}

* {
	margin:0;
	padding:0;
}

a {
	color:#1E7ACE;
	text-decoration:none;	
}

a:hover {
	color:#000;
	text-decoration:underline;
}
h3 {
	font-size:14px;
	font-weight:bold;
}

pre,p {
	color:#1E7ACE;
	margin:4px;
}
input, select,textarea{
	padding:1px;
	margin:2px;
	font-size:12px;
}
.buttom{
	padding:1px 10px;
	font-size:12px;
	border:1px #1E7ACE solid;
	background:#D0F0FF;
}
#formwrapper {
	width:95%;
	margin:15px auto;
	padding:20px;
	text-align:left;
}

fieldset {
	padding:10px;
	margin-top:5px;
	border:1px solid #1E7ACE;
	background:#fff;
}

fieldset legend {
	color:#1E7ACE;
	font-weight:bold;
	background:#fff;
}

fieldset label {
	float:left;
	width:120px;
	text-align:right;
	padding:4px;
	margin:1px;
}

fieldset div {
	clear:left;
	margin-bottom:2px;
}

.enter{ text-align:center;}
.clear {
	clear:both;
}

-->
</style>
</head>
<body>
<div id="formwrapper">
	<h3>编辑教学课件</h3>
	<form action="PptsServlet?method=update&pageNo=${page.pageNo }&pageSize=${page.pageSize }" method="post">
	<input type="hidden" name="id" value="${ppts.id }">

	<fieldset>
		<legend>教学课件信息</legend>
		<div>
			<label for="name">名称</label>
			<input type="text" name="name" id="name" value="${ppts.name }" size="60" maxlength="200" /> 
			<br />	
		</div>
		<div>
			<label for="settime">上传时间</label>
			<input type="text" name="settime" id="settime" value="${ppts.settime }" size="8" maxlength="200" /> 
			<br />	
		</div>
<div>
			<label for="courseIds">课程</label>
			<select name="course" id="courseIds" >
				<c:forEach items="${courseList }" var="s" >
				<option value="${s.id }"  <c:if test="${s.id eq ppts.course.id }">selected="selected"</c:if>
				>${s.name}</option>
				</c:forEach>
			</select> 
		</div>
		<div>
			<label for="descp">摘要</label>
			<input type="text" name="descp" id="descp" value="${ppts.descp }" size="60" maxlength="200" /> 
			<br />	
		</div>
		<div>
			<label for="img">上传文件</label>
			<input type="button" onclick="image('docts')" id="attachs" value="点此上传">
			<input type="hidden" name="docts" id="docts" value="${ppts.docts }" size="60" maxlength="200" /> 
			<a id="docts_file" href="upload_file/${ppts.docts }">下载文件</a>
			<br />	
		</div>
		<div>
			<label for="content">内容</label>
			<div style="margin:0px 0px 0px 130px;">
			<textarea rows="10" cols="100" name="content" id="content" >${ppts.content }</textarea>
			</div>
			<br />	
		</div>
		<div>
			<label for="attachs">添加内容附件</label>
			<input type="button" onclick="addcontent()" id="attachs" value="添加">
			<br />	
		</div>
		<div>
			<label for="img">添加图片</label>
			<input type="button" onclick="image('img')" id="attachs" value="添加">
			<input type="hidden" name="img" id="img" value="${ppts.img }" size="60" maxlength="200" /> 
			<img id="img_image" src="upload_image/${ppts.img }">
			<br />	
		</div>
		<div class="enter">
		    <input name="submit" type="submit" class="buttom" value="提交" />
		    <input name="reset" type="reset" class="buttom" value="重置" />
		    <input name="return" type="button" class="buttom" value="返回列表页面" onclick="window.location = 'PptsServlet'"/>
		</div>
	</fieldset>
	</form>
</div>

</body>
</html>

