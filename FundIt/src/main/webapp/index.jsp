<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>

var popularPage = 1;
var newPage = 1;
var deadlinePage = 1;

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
	
	/* 분야별 인기 프로젝트 12개 */
	$.ajax({
		url : "selectIndexPopularProject",
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#popularProjects");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 4){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	/* 새로운 프로젝트 12개 */
	$.ajax({
		url : "selectIndexNewProject",
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#newProjects");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 4){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	/* 마감 앞둔 프로젝트 12개 */
	$.ajax({
		url : "selectIndexDeadlineProject",
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#deadlineProjects");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 4){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
});

function htmlAppend(project, div_name){
	var html = '';
	
	html += '<div class="project">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/projects/'+project.projectImage+'" />';
	html += '<div class="summary">';
	html += '<p>'+project.projectTitle+'</p>';
	html += '<p>'+project.name+'</p>';
	html += '<div class="progress">';
	
	if(project.supportPercent < 100){
		html += '<div class="progress-bar bg-danger" role="progressbar" style="width: '+project.supportPercent+'%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
	} else {
		html += '<div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>';
	}
	
	html += '</div>';
	html += '<br />';
	html += '<div class="days">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>';
	html += '&nbsp;'+project.deadlineDay+'일 남음';
	html += '</div>';
	html += '<div class="support">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/money.png"/>';
	
	var supportMoney = numberWithCommas(project.supportMoney);
	html += '&nbsp;'+supportMoney+'&nbsp;('+project.supportPercent+'%)';
	
	html += '</div>';
	html += '</div>';
	html += '</div>';
    
    div_name.append(html);
}

function htmlAppendNone(startIndex, div_name){
	for(var i = startIndex; i <= 4; i++){
		
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
		
		div_name.append(html);	
	}
}

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}
</script>


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
	
<script>

function toPrevAjax(urlMapping, pageName, div_name){
	
	var page;
	
	if(pageName == 'popularPage'){
		page = popularPage;
	} else if(pageName == 'newPage'){
		page = newPage;
	} else if(pageName == 'deadlinePage'){
		page = deadlinePage;
	}

	console.log(pageName +" : "+ page);
	
	if(page > 1 && page <= 3){

		if(pageName == 'popularPage'){
			page = popularPage-1;
			popularPage = page;
		} else if(pageName == 'newPage'){
			page = newPage-1;
			newPage = page;
		} else if(pageName == 'deadlinePage'){
			page = deadlinePage-1;
			deadlinePage = page;
		}

		console.log(page);
		
		$.ajax({
			url : urlMapping,
			data : {page : page},
			success : function(data){
				console.log(data);
				
		    	var appendDiv = $("#"+div_name);
		    	appendDiv.html("");
				
		    	for(var i = 0; i < data.length; i++){	    		
		    		htmlAppend(data[i], appendDiv);
				}
		    	
		    	if(data.length < 4){
		    		htmlAppendNone(data.length+1, appendDiv);
		    	}
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	}
}

function toNextAjax(urlMapping, pageName, div_name){
	
	var page;
	
	if(pageName == 'popularPage'){
		page = popularPage;
	} else if(pageName == 'newPage'){
		page = newPage;
	} else if(pageName == 'deadlinePage'){
		page = deadlinePage;
	}
	
	console.log(pageName +" : "+ page);
	
	if(page >= 1 && page < 3){

		if(pageName == 'popularPage'){
			page = popularPage+1;
			popularPage = page;
		} else if(pageName == 'newPage'){
			page = newPage+1;
			newPage = page;
		} else if(pageName == 'deadlinePage'){
			page = deadlinePage+1;
			deadlinePage = page;
		}

		console.log(page);
		$.ajax({
			url : urlMapping,
			data : {page : page},
			success : function(data){
				console.log(data);
				
		    	var appendDiv = $("#"+div_name);
		    	appendDiv.html("");
				
		    	for(var i = 0; i < data.length; i++){	    		
		    		htmlAppend(data[i], appendDiv);
				}
		    	
		    	if(data.length < 4){
		    		htmlAppendNone(data.length+1, appendDiv);
		    	}
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	}
}
</script>

<div id="index-container">
	
	<!-- 카테고리별 인기 프로젝트 12개 -->
	<div class="index-project">
		<div class="title">
			<img src="${pageContext.request.contextPath }/resources/images/left-arrow.png" onclick="toPrevAjax('selectIndexPopularProject','popularPage','popularProjects');" />
			&nbsp;&nbsp;&nbsp;&nbsp;분야별 인기 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath }/resources/images/right-arrow.png" onclick="toNextAjax('selectIndexPopularProject','popularPage','popularProjects');" />
		</div>
		<div class="project-group" id="popularProjects"></div>
	</div>
	
	<!-- 새로운 프로젝트 12개 -->
	<div class="index-project">
		<div class="title">
			<img src="${pageContext.request.contextPath }/resources/images/left-arrow.png" onclick="toPrevAjax('selectIndexNewProject','newPage','newProjects');" />
			&nbsp;&nbsp;&nbsp;&nbsp;새로운 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath }/resources/images/right-arrow.png" onclick="toNextAjax('selectIndexNewProject','newPage','newProjects');" />
		</div>
		<div class="project-group" id="newProjects"></div>
	</div>
	
	<!-- 마감 앞둔 프로젝트 12개 -->
	<div class="index-project">
		<div class="title">
			<img src="${pageContext.request.contextPath }/resources/images/left-arrow.png" onclick="toPrevAjax('selectIndexDeadlineProject','deadlinePage','deadlineProjects');" />
			&nbsp;&nbsp;&nbsp;&nbsp;마감 앞둔 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath }/resources/images/right-arrow.png" onclick="toNextAjax('selectIndexDeadlineProject','deadlinePage','deadlineProjects');" />
		</div>
		 <div class="project-group" id="deadlineProjects"></div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />