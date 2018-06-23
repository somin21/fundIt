<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-make-project.css" />

<script>
$(function(){
	
	$(".make-project-content div.shown").on("click",function(){
		$(".make-project-content").children(".shown").slideDown(500);
		$(".make-project-content").children(".hidden").slideUp(500);
		$(this).slideUp(500);	
		$(this).next(".hidden").slideDown(500);
		
	});
})
</script>


<div id="make-project">
	
	<div class="make-project-notice">
		<div class="alert alert-primary" role="alert">
		  펀딩 준비에 앞서 
		  공개 검토 가이드라인, 
		  펀드잇 커뮤니티 운영원칙
		  을 확인해주세요.
		</div>
		<div class="alert alert-secondary" role="alert">
		  프로젝트를 개설하려면 네 개의 섹션을 완성해야 합니다. 해당 섹션을 완성해야 다음 섹션으로 넘어갈 수 있습니다.
		</div>
		<div class="alert alert-secondary" role="alert">
		  완성된 섹션은 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" /> 
		  탭 아이콘에 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" /> 
		  파랗게 체크가 됩니다.
		</div>
	</div>
	
	<div class="make-project-btn">
		<button type="button">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/binoculars.png" />
			미리보기
		</button>
		<button type="button">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/paper-plane.png" />
			검토 요청하기
		</button>
	</div>
	
	<div class="make-project-title">
		<div class="section-title selected-title">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			프로젝트 개요
		</div>
		<div class="section-title">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
			펀딩 및 선물 구성
		</div>
		<div class="section-title">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			스토리텔링
		</div>
		<div class="section-title">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			계좌 설정
		</div>
	</div>
	
	
	<div class="make-project-contents">
	
		
	
