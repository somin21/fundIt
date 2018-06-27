<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
 
<style>
div.title{background:linear-gradient(to right, #0f0051, #320032); padding: 10px 0 10px 0; text-align: center;}
span.titleSp{color:white; font-size: 23px; font-weight: bold;}
div.menu{background:rgb(240, 240, 240);  padding: 40px 0 40px 30px;}
div.menu:hover{background:rgb(220, 220, 220);cursor: pointer;}
span.money{font-weight: bold; font-size: 18px;}
input.form-control{width: 180px; display: inline-block; font-size: 20px;}
div.menu2{display: none;}
span.moneyMent{font-size: 15px; color:blue;}
</style>
<div class="title">
	<span class="titleSp">${title }</span> 
</div>
<div>
	<div class="menu">
		<div class="menu1">
			<span class="money">1,000원 이상 밀어주시는 분께</span>
			<br /><br /><br />
			<span>선물을 선택하지 않고, 밀어만 줍니다.</span>
		</div>
		<div class="menu2">
			<input type="number" class="form-control" min="0" max="10000000" value="1000" step="100"/> 원
			<button>클릭</button>
			<br /><br />
			<span class="moneyMent">더 많이 입력하실 수 있습니다</span>
			<br /><br /><br />
			<span>선물을 선택하지 않고, 밀어만 줍니다.</span>
		</div>
	</div>
	<c:if test="${not empty List}">
	<c:forEach var="i" items="${List }">
	<div class="menu">
		<div class="menu1">
			<span class="money"><fmt:formatNumber>${i.minMoney }</fmt:formatNumber>원 이상 밀어주시는 분께</span>
			<br /><br /><br />
			<ul>
				<li><span>${i.itemName } (X${i.itemnumber })</span></li>
			</ul>
			<br />
			<span>예상 전달일 : <fmt:formatDate value="${calculateduedDate }" pattern="yyyy년 MM월 dd일"/></span>
		</div>
		<div class="menu2">
			<input type="number" class="form-control" min="0" max="10000000" value="${i.minMoney }" step="100"/> 원
			<button>클릭</button>
			<br /><br />
			<span class="moneyMent">더 많이 입력하실 수 있습니다</span>
			<br /><br /><br />
			<ul>
				<li><span>${i.itemName } (X${i.itemnumber })</span></li>
			</ul>
			<br />
			<span>예상 전달일 : <fmt:formatDate value="${calculateduedDate }" pattern="yyyy년 MM월 dd일"/></span>
		</div>
	</div>
	</c:forEach>
	</c:if>
</div>
<script>
$(function(){
	$(".menu").click(function(){
		$(this).children($(".menu1").hide());
		$(this).children($(".menu2").show());
	});
	/* $(".menu2").click(function(){
		$(".menu2").hide();
		$(".menu1").show();
	}); */

});
</script>
	