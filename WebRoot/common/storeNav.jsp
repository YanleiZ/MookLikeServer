<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="line-middle  margin-bottom">
	  <div class="xl12" style="padding:0">
	  
	  
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0" onclick="window.location.href='/SellerServlet?method=storeAnnouncement&id=${store.id}'">
	  		<span class="store-nav-s-in bg-4">
		  		<img src="style/images/store_announcement.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">最新公告</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/SellerServlet?method=storeSpecial&id=${store.id}'">
	  		<span class="store-nav-s-in bg-2">
		  		<img src="style/images/store_home.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">店铺特色</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/SellerServlet?method=storeEvolm&id=${store.id}'">
	  		<span class="store-nav-s-in bg-3">
		  		<img src="style/images/store_em.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">环境展示</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/StoreServlet?method=storeGoods&id=${store.id}'">
	  		<span class="store-nav-s-in bg-1">
		  		<img src="style/images/store_goods.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">店铺商品</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/StoreServlet?method=storeComments&id=${store.id}'">
	  		<span class="store-nav-s-in bg-5">
		  		<img src="style/images/store_comment.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">店铺点评</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/StoreServlet?method=storeDetails&id=${store.id}'">
	  		<span class="store-nav-s-in bg-6">
		  		<img src="style/images/store_detail.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">店铺详情</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;"onclick="window.location.href='/SellerGroupActivitiesMyServlet?method=storeActivities&id=${store.seller.id}&store=${store.id }'">
	  		<span class="xl12 store-nav-s" style="padding:0">
	  		<span class="store-nav-s-in bg-7">
		  		<img src="style/images/store_activity.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">店铺活动</span>
		  	</span>
	  	</span>
	  	<span class="xl3 xs1n5 xm1n5  "  style="margin:0px;padding:2px;">
	  		<span class="xl12 store-nav-s" style="padding:0"onclick="window.location.href='/SellerServlet?method=storeContect&id=${store.id}'">
	  		<span class="store-nav-s-in bg-8">
		  		<img src="style/images/store_contect.png" width="26" height="26" border="0" alt="">
		  	</span>
		  	<span class="store-nav-s-font">联系我们</span>
		  	</span>
	  	</span>
	  	
	  	
	  </div>
	  </div>

