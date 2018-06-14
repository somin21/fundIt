<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FundIT</title>
</head>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Shadows+Into+Light" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/style-header.css" />

<script>
$(function(){
	$(".menu-click").on("click",function(){
		$("#menu-click-div").slideToggle();
	});
	$(".profile-click").on("click",function(){
		$("#profile-click-div").slideToggle();
	});
	
})
</script>

<body>

<div id="nav">
	<div id="nav-menu">
		<img src="./resources/images/menu.png" class="menu-click" />
		<span class="menu-click">
			프로젝트 둘러보기
		</span>
		&nbsp;&nbsp;&nbsp;
		<span>
			<a href="">
				프로젝트 올리기
			</a>
		</span>
	</div>
	
	<div id="menu-click-div">
		<p><a href="">모든프로젝트</a></p>
		<p style="color:darkgray;font-size:0.8em;text-align:center;padding-top:15px;">카테고리</p>
		<p><a href="">게임</a></p>
		<p><a href="">푸드</a></p>
		<p><a href="">예술</a></p>
		<p><a href="">패션</a></p>
		<p><a href="">출판</a></p>
		<p><a href="">테크놀리지</a></p>
	</div>
	
	<div id="nav-title">
		<a href="${pageContext.request.contextPath }">Fund It</a>
	</div>
	
	<div id="nav-login">
		
		<!-- 로그인X -->
		<span>
		<a href="">로그인</a>
		/
		<a href="">회원가입</a>
		</span>
		<img src="./resources/images/profile.png" class="profile-click" />
		
		<!-- 로그인O --><!-- 
		<span class="profile-click">
			${memberLoggedIn.name}
		</span>
		<c:if test="${memberLoggedIn.profileImage ne null}">
			<img src="./resources/images/${memberLoggedIn.profileImage}" class="profile-click" />
		</c:if>
		<c:if test= "${memberLoggedIn.profileImage eq null}">
			<img src="./resources/images/profile.png" class="profile-click" />
		</c:if>
		-->
	</div>
	
	<div id="profile-click-div">
		<p><a href="">메시지</a></p>
		<hr />
		<p><a href="">관심 프로젝트</a></p>
		<p><a href="">후원 현황</a></p>
		<p><a href="">선물 배송리스트</a></p>
		<p><a href="">내가 만든 프로젝트</a></p>
		<hr />
		<p><a href="">계정 설정</a></p>
		<p><a href="">프로필 설정</a></p>
	</div>
</div>