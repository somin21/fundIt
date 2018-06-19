<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script>
$(function(){
	
	/* slideImage */
	$.ajax({
		url : "selectIndexProject",
		success : function(data){
			console.log(data);
			for(var i = 0; i < data.length; i++){
				var html = '';
				if(i == 1){
					html += '<div class="carousel-item active">';
				} else {
					html += '<div class="carousel-item">';
				}
			    html += '<img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/projects/'+data[i].projectImage+'" />';
			    html += '</div>';
			    
			    $(".carousel-inner").append(html);
			}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	/* 분야별 인기 프로젝트 12개 *//* 새로운 프로젝트 12개 *//* 마감 앞둔 프로젝트 12개 */
	$.ajax({
		url : "selectIndexProjectsList",
		success : function(data){
			console.log(data);
			
			for(var i = 0; i < data.length; i++){
				var html = '';
				
				html += '<div class="project">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/projects/'+data[i].projectImage+'" />';
				html += '<div class="summary">';
				html += '<p>'+data[i].projectTitle+'</p>';
				html += '<p>'+data[i].name+'</p>';
				html += '<div class="progress">';
				
				if(data[i].supportPercent < 100){
					html += '<div class="progress-bar bg-danger" role="progressbar" style="width: '+data[i].supportPercent+'%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
				} else {
					html += '<div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
				}
				
				html += '</div>';
				html += '<br />';
				html += '<div class="days">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>';
				html += '&nbsp;'+data[i].deadlineDay+'일 남음';
				html += '</div>';
				html += '<div class="support">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/money.png"/>';
				
				var supportMoney = numberWithCommas(data[i].supportMoney);
				html += '&nbsp;'+supportMoney+'&nbsp;('+data[i].supportPercent+'%)';
				
				html += '</div>';
				html += '</div>';
				html += '</div>';
			    
			    $("#newProjects").append(html);
			}
			
			if(data.length < 4){
				for(var i = data.length+1; i <= 4; i++){
					
					var html = '<div class="project">';
					html += '<div class="project-img">';
					html += '<img src="${pageContext.request.contextPath }/resources/images/empty.png" />';
					html += '</div>';
					html += '<div class="summary">';
					html += '<p>';
					html += '<span class="no-project">';
					html += '<br />&nbsp;&nbsp;';
					html += '등록된 프로젝트가 없습니다';
					html += '</span>';
					html += '</p>';
					html += '</div>'; 
					html += '</div>';
					
					$("#newProjects").append(html);	
				}
			}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});

	/* 마감 앞둔 프로젝트 12개 */
	/* $.ajax({
		url : "selectIndexDeadlineProject",
		success : function(data){
			console.log(data);
			
			for(var i = 0; i < data.length; i++){
				var html = '';
				
				html += '<div class="project">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/projects/'+data[i].projectImage+'" />';
				html += '<div class="summary">';
				html += '<p>'+data[i].projectTitle+'</p>';
				html += '<p>'+data[i].name+'</p>';
				html += '<div class="progress">';
				
				if(data[i].supportPercent < 100){
					html += '<div class="progress-bar bg-danger" role="progressbar" style="width: '+data[i].supportPercent+'%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
				} else {
					html += '<div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
				}
				
				html += '</div>';
				html += '<br />';
				html += '<div class="days">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>';
				html += '&nbsp;'+data[i].deadlineDay+'일 남음';
				html += '</div>';
				html += '<div class="support">';
				html += '<img src="${pageContext.request.contextPath }/resources/images/money.png"/>';
				
				var supportMoney = numberWithCommas(data[i].supportMoney);
				html += '&nbsp;'+supportMoney+'&nbsp;('+data[i].supportPercent+'%)';
				
				html += '</div>';
				html += '</div>';
				html += '</div>';
			    
			    $("#deadlineProjects").append(html);
			}
			
			if(data.length < 4){
				for(var i = data.length+1; i <= 4; i++){
					
					var html = '<div class="project" >';
					html += '<div class="project-img">';
					html += '<img src="${pageContext.request.contextPath }/resources/images/empty.png" />';
					html += '</div>';
					html += '<div class="summary">';
					html += '<p>';
					html += '<span class="no-project">';
					html += '<br />&nbsp;&nbsp;';
					html += '등록된 프로젝트가 없습니다';
					html += '</span>';
					html += '</p>';
					html += '</div>'; 
					html += '</div>';
					
					$("#deadlineProjects").append(html);	
				}
			}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	}); */
});

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}
</script>


<style>
div#slide-project{
    width: 100%;
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
    margin-top: 50px;
    text-align: center;
}
div.index-project p.title{
	font-size: 1.5em;
	font-family: 'Do Hyeon', sans-serif;	
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
    pointer: cursor;
}
div.project img{
	width: 240px;
	height: 180px;
}
div.project div.project-img{
	background: lightgray;
	width: 240px;
	height: 180px;
	text-align: center;
}
div.project div.project-img img{
	width: 100px;
	height: 100px;
    margin-top: 40px;
}
div.project div.summary{
	height: 150px;
	padding: 15px;
	box-sizing: border-box;
	position: relative;
}
div.project div.summary p:first-of-type{
	font-weight: bold;
}
div.project div.summary p:last-of-type{
    font-size: 11px;
    margin-top: -10px;
}
div.project div.summary div.progress{
    width: 95%;
    height: 5%;    
    position: absolute;
    bottom: 45px;
    left: 2.5%;
}
div.project div.summary div.days {
	display: inline-block;
	float: left;
	font-size: 11px;
    position: absolute;
    bottom: 13px;
}
div.project div.summary div.days img{
    width: 15px;
    height: 15px;
    margin-top: -3px;
}
div.project div.summary div.support{
	display: inline-block;
	float: right;
	font-size: 11px;
    position: absolute;
    bottom: 13px;
    right: 10px;
}
div.project div.summary div.support img{
    width: 15px;
    height: 15px;
    margin-top: -3px;
}
div.project div.summary span.no-project{
	font-weight: normal;
    margin-top: 0;
	font-size: 13px;
	color: red;
	
}
@media (max-width: 1070px){
	div.project{
		width: 200px;
	}
	div.project img{
		width: 200px;
		height: 140px;
	}
	div.project div.project-img{
		width: 200px;
		height: 140px;
	}
	div.project div.project-img img{
		width: 80px;
		height: 80px;
		margin-top: 30px;
	}
	div.project div.summary{
		padding: 8px;
	}
	div.project div.summary div.progress{
	    width: 95%;
	    height: 3%;
        bottom: 38px;
	}
}
@media (max-width: 925px){

}
</style>

<div id="index-container">
	
	<!-- 카테고리별 인기 프로젝트 12개 -->
	<div class="index-project" >
		<p class="title">
			분야별 인기 프로젝트
		</p>
		
		<c:forEach var="i" begin="1" end="4" step="1">
			<div class="project">
				<img src="${pageContext.request.contextPath }/resources/images/projects/example (${i }).jpg" />
				<div class="summary">
					<p>코타키나발루에 다녀왓어요 겁나 조아요 또 가고 싶어요</p>
					<p>소민</p>
					<div class="progress">
						<div class="progress-bar bg-danger" role="progressbar" style="width: ${i*25}%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<br />
					<div class="days">
						<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>
						${(i*12)-(i*3) }일 남음
					</div>
					<div class="support">
						<img src="${pageContext.request.contextPath }/resources/images/money.png"/>
						<fmt:formatNumber>${i*10000000 }</fmt:formatNumber>
						(${i*25}%)
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- 새로운 프로젝트 12개 -->
	<div class="index-project" id="newProjects">
		<p class="title">
			새로운 프로젝트
		</p>
	</div>
	
	<!-- 마감 앞둔 프로젝트 12개 -->
	<div class="index-project" id="deadlineProjects">
		<p class="title">
			마감 앞둔 프로젝트
		</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />