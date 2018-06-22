<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />
	
<script>

var popularPage = 1;
var newPage = 1;
var deadlinePage = 1;

$(function(){
	
	
	
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
	var loc = "location.href='${pageContext.request.contextPath}/project/projectView.do?projectNo="+project.projectNo+"'";	
	html += '<div class="project" onclick="';
	html += loc+'">';
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

<jsp:include page="/WEB-INF/views/admin/footer.jsp" />