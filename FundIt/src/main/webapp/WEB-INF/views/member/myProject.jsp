<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script>
$(function(){
	var email = $("#email").val().trim();
	console.log(email);
	/* profileImgage */
	$.ajax({
		url : "${pageContext.request.contextPath}/member/selectProfileImg?email="+email,
		success : function(data){
			console.log(data);
				var html = '';
				if(data == ""){
					html += '<img class="profileImage" src="${pageContext.request.contextPath }/resources/images/profile.png" />';
				}else{
					html += '<img class="profileImage" src="${pageContext.request.contextPath }/resources/upload/profileImg/'+data+'" />';	
				}
			    
			    $("#img-container").append(html);
			
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	/* 내가 만든 프로젝트 개수  */
	$.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectCnt?email="+email,
		success : function(data){
			console.log(data);
			var html = '';
			html+= data ;
			$("#cnt").append(html);
		},error: function(){
			console.log("ajax 실패");
		}
		
		
		
	});
	
	/* 마감 앞둔 순  내가만든 프로젝트 컨펌전  */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectYet?email="+email,
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectYet");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	 /* 마감 앞둔 순  내가만든 프로젝트 진행중  */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectYes?email="+email,
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectYes");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	 
	 /* 마감 앞둔 순  내가만든 프로젝트 거부됨 */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectNo?email="+email,
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectNo");
			
	    	for(var i = 0; i < data.length; i++){
	    		
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	 
	 $(".project").click(function(){
         var projectNo = $(this).children("#projectNo").val();
         console.log(projectNo);
         location.href="${pageContext.request.contextPath}/project/projectView.do?projectNo="+projectNo;
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
	html += '<input type="hidden" name="projectNo" id ="projectNo" value="${project.projectNo}" />';
	 
	var supportMoney = numberWithCommas(project.supportMoney);
	html += '&nbsp;'+supportMoney+'&nbsp;('+project.supportPercent+'%)';
	
	html += '</div>';
	html += '</div>';
	html += '</div>';
    
    div_name.append(html);
}

function htmlAppendNone(startIndex, div_name){
		
		var html = '<div class="project">';
		html += '<div class="project-img">';
		html += '<img src="${pageContext.request.contextPath }/resources/images/empty.png" />';
		html += '</div>';
		html += '<div class="summary">';
		html += '<p>';
		html += '<span class="no-project">';
		html += '&nbsp;&nbsp;';
		html += '등록하신 프로젝트가 없습니다';
		html += '</span>';
		html += '</p>';
		html += '</div>'; 
		html += '</div>';
		
		div_name.append(html);	
	
}

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}



</script>
<style>
div#myProfile-container{
width : 100%;
height : 500px;
background-color : #ebeae5;
border : 1.2px solid #efeded; 
padding-bottom : 80px;

}
div#changable-content{
width : 500px;
height : 60%;
margin: auto;
margin-bottom : 40px;
text-align:center;
line-height: 200px;
padding-top : 100px;
}
.profileImage{
	width:150px;
	height:150px;
	margin:auto;
	border-radius : 100px;
	border : 5px solid white;
	
}

div#index-container{
width: 70%;
min-height: 50%;
margin : auto;
line-height : 100px;


}
</style>


<div id="myProfile-container">
	<div id = "changable-content">
	<div id="img-container">
	
	</div>
	<h1><a href="${pageContext.request.contextPath}/member/profileView.do?email=${memberLoggedIn.email}">${memberLoggedIn.email}</a></h1>
	<input type="hidden" id ="email" value="${memberLoggedIn.email}" />
	</div> 	
	
</div>
	


<div id="index-container">
		<p class="title" style="font-size:25px;">
			내가만든 프로젝트 <span id="cnt" style="color:tomato;"></span> 개 
		</p>
		
	<!-- 내가 만든 프로젝트(컨펌받은 프로젝트) -->
	<div class="index-project" id="myProjectYet">
		<p class="title">
			승인대기중 
		</p>
		
	</div>
	
	<!-- 내가 만드 프로젝트(컨펌받은 프로젝트) -->
	<div class="index-project" id="myProjectYes">
		<p class="title">
			진행 중
		</p>
		
	</div>
	
	<!-- 내가 만드 프로젝트(컨펌받은 프로젝트) -->
	<div class="index-project" id="myProjectNo">
		<p class="title">
			승인 거절 
		</p>
		
	</div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />