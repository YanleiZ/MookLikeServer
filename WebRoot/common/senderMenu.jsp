<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="" class="hidden-l xs2" style="background:#fff;padding:0px;margin:0 10px">
	<div id="" class="sellerMenu" style="width:150px;margin:10px">
		<div id="" class="xl12 icon-user user-left-1" >
			帮助中心
		</div>
		<div id="senderMenuHover2" class="xl10 xl2-move user-left-3">
			<a href="OrderServlet?method=orderList">待取商品</a>
		</div>
		<div id="senderMenuHover3" class="xl10 xl2-move user-left-3">
			<a href="OrderServlet?method=orderListSend">待配送商品</a>
		</div>
		<div id="senderMenuHover4" class="xl10 xl2-move user-left-3">
			<a href="OrderServlet?method=sendGoodsComplete">已送达的商品</a>
		</div>
		<span class="clr"></span>
	</div>



	<div id="" class="xl12 user-left-1" style="width:100%;height:150px;margin:0px 0;border-top:10px solid #f5f5f5">
			广告位
	</div>
	<div id="" class="xl12 user-left-1" style="width:100%;height:150px;margin:0px 0;border-top:10px solid #f5f5f5">
			广告位
	</div>
</div>

<div id="" class="xl12 hidden-s hidden-m hidden-b text-center" style="background:#fff;padding:0;margin:10px 0px;width:100%">
	<div id="" class="xl12 icon-user user-left1-1 button" style=";padding:10px 0;margin:0;cursor:pointer;">
		帮助中心<span class="icon-sort-desc-diy padding"></span>
	</div>
	<div id="" class="user-left1">
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='OrderServlet?method=orderList'">
			待取商品
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='OrderServlet?method=orderListSend'">
			待配送商品
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='OrderServlet?method=sendGoodsComplete'">
			已送达的商品
		</div>
	</div>
</div>

