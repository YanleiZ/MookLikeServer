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
<script  src="backend/js/validate_form.js"></script>
	
	
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
<input type="hidden" id="buyerMenuHover" value="buyerMenuHover2" >		



				<div id="" class="xl12 xs9" style="background:#f5f5f5;padding:0px;">
<div id="" class="xl12"style="background:#fff;padding:10px 10px;margin:0 0 10px;">
		<div id="" class="xl12" style="">
			<span class="seller-right-head">个人信息</span>
		</div>
		<div id="" class="xl12 ">
			<span class="seller-right-head1 xl12 ">修改登录密码</span>
			<div id="" class="xl12 ">
			
			<script type="text/javascript">
function check(){
var f=0
jQuery("#checkold").text("密码不正确").css("color","red");
		  jQuery.ajax({
          type: "POST",
          url: 'SysServlet',
          cache: false,
          async: false,
          data:{
        	 method:"checkOld",
           	 password:jQuery("#old").val()
          },
          success: function(data){
          		if(data==0)
          		{
          		jQuery("#checkold").text("密码不正确,请重新输入").css("color","red");
          		f=1;
          		}
          		else {
          		jQuery("#checkold").text("恭喜你，密码正确").css("color","green");
          		f=2;
          		}
          }
       });
       if (f==1){
		  return false;
		  }
       if (f==2){
	  return true;
		  }
}
function v_password(password){
	  if (isNull(password.value)){
		  jQuery("#check_new").text("*密码不能为空");
		  return false;
		  }
	  jQuery("#check_new").text("");
	  return true;
}
function v_confirm_password(confirm_password){
	  if ((jQuery("#c_new").val()!=jQuery("#newp").val())){
		  jQuery("#check_c_new").text("*两次输入的密码不一致");
		  return false;
		  }
	  jQuery("#check_c_new").text("");
	  return true;
}
function validate_form(thisform){
	
with (thisform)

{
  if(
		  check()
		  &(v_password(newp))
		  &(v_confirm_password(c_new))
	
		  )

  return true;
  else
  return false;
}
}
</script>
</head>
<body>
<div id="formwrapper" >
	<h3>编辑密码</h3>
	<form action="SysServlet?method=updatePassword1" method="post" onsubmit="return validate_form(this)">
	<input type="hidden" class="input" id="user" name="user" value="${login_user.id }" />
	<fieldset>
		<legend>修改</legend>
		<div>
			<label for="old">原始密码</label>
			<input type="password" name="old" id="old" value="" size="20" maxlength="20" /> 
			<input type="button" id="che"  onclick="check()" value="查询密码是否正确"/>
			<div  style="display: inline"><font id="checkold" color="red"></font></div>
			<br />	
		</div>
		<div>
			<label for="new">新密码</label>
			<input type="password" name="new" id="newp" value="" size="20" maxlength="20" onblur="v_password(this)"/> 
			<div  style="display: inline"><font id="check_new" color="red"></font></div>
			<br />	
		</div>
		<div>
			<label for="c_new">新密码确认</label>
			<input type="password" name="c_new" id="c_new" value="" size="20" maxlength="20" onblur="v_confirm_password(this)"/> 
			<div  style="display: inline"><font id="check_c_new" color="red"></font></div>
			<br />	
		</div>
	
		<div class="enter">
		    <input name="submit" type="submit" class="buttom" value="提交" />
		    <input name="reset" type="reset" class="buttom" value="重置" />
		</div>
	</fieldset>
	</form>
</div>
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
