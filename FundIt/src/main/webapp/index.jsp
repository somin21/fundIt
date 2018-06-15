<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
div#slide-project{
    width: 145%;
    position: relative;
    left: -22%;
}
div#slide-project img{
	height: 500px;
}

@media ( max-width: 1300px ){
	div#slide-project img{
		height: 400px;
	}
}
@media ( max-width: 900px ){
	div#slide-project img{
		height: 300px;
	}
}
</style>

<div id="slide-project">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/projects/example (1).jpg" alt="First slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/projects/example (2).jpg" alt="Second slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/projects/example (3).jpg" alt="Third slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/projects/example (4).jpg" alt="Forth slide">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div>
	
<style>
div.index-project{
    margin-top: 40px;
    text-align: center;
}
div.project{
	width: 240px;
	border: 1.5px solid #eaeaea;
	border-radius: 3px;
	overflow: hidden;
	display: inline-block;
	margin: 0 10px;
	text-align: left;
}
div.project:hover{
	position: relative;
    top: -3px;
    left: -3px;
    box-shadow: 5px 5px 15px lightgrey;
}
div.project img{
	width: 240px;
	height: 180px;
}
div.project div.summary{
	height: 150px;
	padding: 15px;
	box-sizing: border-box;
}
div.project div.summary div.days {
	display: inline-block;
	float: left;
}
div.project div.summary div.support{
	display: inline-block;
	float: right;
}
@media (max-width: 1070px){
	div.project{
		width: 200px;
	}
	div.project img{
		width: 200px;
		height: 140px;
	}
	div.project div.summary{
		padding: 8px;
	}
}
@media (max-width: 925px){

}
</style>

<div id="index-container">
	
	<!-- 카테고리별 인기 프로젝트 6개 -->
	<div class="index-project" >
		<p class="title">
			분야별 인기 프로젝트
		</p>
		<c:forEach var="i" begin="1" end="4" step="1">
		<div class="project">
			<img src="${pageContext.request.contextPath }/resources/images/projects/example (${i }).jpg" />
			<div class="summary">
				<p>코타키나발루</p>
				<p>소민</p>
				<input type="range" />
				<br />
				<div class="days">10일 남음</div>
				<div class="support">후원금액 (150%)</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<!-- 새로운 프로젝트 12개 -->
	<div class="index-project" >
		<p class="title">
			새로운 프로젝트
		</p>
	</div>
	
	<!-- 마감 앞둔 프로젝트 12개 -->
	<div class="index-project" >
		<p class="title">
			마감 앞둔 프로젝트
		</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />