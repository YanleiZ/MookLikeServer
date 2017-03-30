<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="" class="hidden-l xs2" style="background:#fff;padding:0px;margin:0 10px">
	<div id="" class="sellerMenu" style="width:150px;margin:10px">
		<div id="" class="xl12 icon-user user-left-1" >
			卖家中心
		</div>
		<div id="sellerMenuHover2" class="xl10 xl2-move user-left-3">
			<a href="StoreServlet?method=modify">编辑店铺</a>
		</div>
		<div id="sellerMenuHover3" class="xl10 xl2-move user-left-3">
			<a href="GoodsServlet?method=goodsList" >我的商品</a>
		</div>
		<div id="sellerMenuHover4" class="xl10 xl2-move user-left-3 ">
			<a href="SellerServlet?method=orderList">我的订单</a>
		</div>
		<div id="sellerMenuHover5" class="xl10 xl2-move user-left-3">
			<a href="SellerGroupServlet?method=sellerGroups">我的圈子</a>
		</div>
		<div id="sellerMenuHover6" class="xl10 xl2-move user-left-3">
			<a href="SellerGroupActivitiesMyServlet?method=SellerGroupActivitiesMyList">我的活动</a>
		</div>
		<div id="sellerMenuHover7" class="xl10 xl2-move user-left-3">
			<a href="SellerGroup1Servlet?method=sellerGroup1s">死党店铺</a>
		</div>
		
		<div id="sellerMenuHover11" class="xl10 xl2-move user-left-3 ">
			<a href="javascript:;"style="cursor:not-allowed;">积分发放</a>
		</div>
		<div id="sellerMenuHover12" class="xl10 xl2-move user-left-3 " >
			<a href="javascript:;"style="cursor:not-allowed;">店铺会员卡</a>
		</div>
		
		
		<div id="" class="xl10 xl1-move icon-align-left user-left-2">
			店铺信息
		</div>
		<div id="sellerMenuHover13" class="xl10 xl2-move user-left-3">
			<a href="SellerServlet?method=sellerAnnouncement">最新公告</a>
		</div>
		<div id="sellerMenuHover14" class="xl10 xl2-move user-left-3">
			<a href="SellerServlet?method=sellerSpecial">店铺特色</a>
		</div>
		<div id="sellerMenuHover15" class="xl10 xl2-move user-left-3">
			<a href="SellerServlet?method=sellerEvolm">环境展示</a>
		</div>
		<div id="sellerMenuHover16" class="xl10 xl2-move user-left-3">
			<a href="SellerServlet?method=sellerContect">联系我们</a>
		</div>
		<div id="" class="xl10 xl1-move icon-bar-chart-o user-left-2">
			我的统计
		</div>
		<div id="sellerMenuHover17" class="xl10 xl2-move user-left-3">
			<a href="javascript:;"style="cursor:not-allowed;">店铺点击量</a>
		</div>
		<div id="sellerMenuHover18" class="xl10 xl2-move user-left-3">
			<a href="javascript:;"style="cursor:not-allowed;">商品点击量</a>
		</div>
		<div id="sellerMenuHover19" class="xl10 xl2-move user-left-3">
			<a href="javascript:;"style="cursor:not-allowed;">销售额统计</a>
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
		卖家中心<span class="icon-sort-desc-diy padding"></span>
	</div>
	<div id="" class="user-left1">
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='StoreServlet?method=modify'">
			编辑店铺
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='GoodsServlet?method=goodsList'">
			我的商品
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerServlet?method=orderList'">
			我的订单
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerGroupServlet?method=sellerGroups'">
			我的圈子
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerGroupActivitiesMyServlet?method=SellerGroupActivitiesMyList'">
			我的活动
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerGroup1Servlet?method=sellerGroup1s'">
			死党店铺
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerServlet?method=sellerAnnouncement'">
			最新公告
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerServlet?method=sellerSpecial'">
			店铺特色
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerServlet?method=sellerEvolm'">
			环境展示
		</div>
		<div id="" class="xl12  user-left1-3 " style=";padding:5px 0;margin:0" onclick="window.location.href='SellerServlet?method=sellerContect'">
			联系我们
		</div>
	</div>
</div>

