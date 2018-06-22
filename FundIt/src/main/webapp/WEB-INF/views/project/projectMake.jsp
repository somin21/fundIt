<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
div#make-project{
	margin: 0 auto;
	position: relative;
	padding: 5%;
}
div.make-project-btn{
	position: relative;
    text-align: center;
    margin: 30px 0;
}
div.make-project-title{
	margin: 0 auto;
	position: relative;
	width: 100%;
	text-align: center;
}
div.section-title{
    display: inline-block;
    width: 20%;
    height: 50px;
    padding: 10px;
    box-sizing: border-box;
    font-weight: bold;
}
div.selected-title{
	border-top: 1px solid darkgray;
	border-left: 1px solid darkgray;
	border-right: 1px solid darkgray;
	background: #e6e6e6;
}
div.make-project-contents{
	background: #e6e6e6;
	min-height: 500px;
    margin-top: -1px;
}
</style>

<div id="make-project">
	<div class="make-project-btn">
		<button type="button">미리보기</button>
		<button type="button">검토 요청하기</button>
	</div>
	<div class="make-project-title">
		<div class="section-title selected-title">
			<span>
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			</span>
			프로젝트 개요
		</div>
		<div class="section-title">
			<span>
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
			</span>
			펀딩 및 선물 구성
		</div>
		<div class="section-title">
			<span>
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			</span>
			스토리텔링
		</div>
		<div class="section-title">
			<span>
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
			</span>
			계좌 설정
		</div>
	</div>
	<div class="make-project-contents">
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />