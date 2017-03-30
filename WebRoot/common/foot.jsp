<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




    <!--底部-->

    <div class="layout bg-black bg-inverse">
      <div class="container">
        <div class="navbar">
          <div class="navbar-head show-l show-s hidden-m hidden-b" style="width:100%"><button class="button bg-gray icon-navicon"  data-target="#navbar-footer" style="float:right"></button><a href="#" target="_blank"><img class="logo" style="width:22px;height:30px;float:left" src="style/css/img/logo-b.png" alt="" /><a href="#" target="_blank"style="margin-left:10px">Tc-byh.com</a></a></div>
          <div class="navbar-head hidden-l hidden-s hidden-m hidden-b" ><a href="#" target="_blank"><img class="logo" style="width:22px;height:30px;" src="style/css/img/logo-b.png" alt="" /></a></div>
          <div class="navbar-body hidden-l nav-navicon" id="navbar-footer">
            <div class="navbar-text navbar-left hidden-s hidden-l"style="width:100%;padding:30px 0">
            <center>
            <div class="xl12">
	           <img class="" src="style/images/logo.png" height="150px" border="0" alt=""><br>
	            <a href="#" class=" ">[首页]</a>
	            <c:if test="${ login_user.username eq null}">
		                 <a  class="  dialogs " data-toggle="click" data-target="#login" data-mask="1" data-width="350px"style="" href="javascript:;" >[会员中心]</a>
					</c:if>
					<c:if test="${ login_user.username ne null}">
            <a href="/MemberServlet?method=info"class=" ">[会员中心]</a>
					</c:if>
	            <a href="/houtai" target="_blank" class=" ">[后台管理]</a>
	            </ul>
            </div>
            <div class="xl12">
            毕业设计 &copy; <a href="#" target="_blank"><atitle></atitle>的设计与实现</a> All Rights Reserved
            </div>
            </center>
            </div>
            
            <br>
          </div>
        </div>
      </div>
    </div>

