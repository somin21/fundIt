<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script>
var projectYetPage = 1;
var projectYesPage = 1;
var projectNoPage = 1;
var projectIPage = 1;


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
		url : "${pageContext.request.contextPath}/project/selectMyProjectYet",
		data :  {email : email},
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectYet");
			
	    	for(var i = 0; i < data.length; i++){
	    		if(data.length >= 1 && data.length <8){
	    			$("#moreViewYet").prop("disabled",true);
	    		}
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		$("#moreViewYet").prop("disabled",true);
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	 /* 마감 앞둔 순  내가만든 프로젝트 진행중  */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectYes",
		data :  {email : email},
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectYes");
			
	    	for(var i = 0; i < data.length; i++){
	    		if(data.length >= 1 && data.length <8){
	    			$("#moreViewYes").prop("disabled",true);
	    		}
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		$("#moreViewYes").prop("disabled",true);
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	 
	 /* 마감 앞둔 순  내가만든 프로젝트 거부됨 */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectNo",
		data :  {email : email},
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectNo");
			
	    	for(var i = 0; i < data.length; i++){
	    		if(data.length >= 1 && data.length <8){
	    			$("#moreViewNo").prop("disabled",true);
	    		}
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		$("#moreViewNo").prop("disabled",true);
	    		htmlAppendNone(data.length+1, div_name);
	    	}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	 
	 /* 마감 앞둔 순  내가만든 프로젝트 컨펌 요청전 */
	 $.ajax({
		url : "${pageContext.request.contextPath}/project/selectMyProjectI",
		data :  {email : email},
		success : function(data){
			console.log(data);
			
	    	var div_name = $("#myProjectI");
			
	    	for(var i = 0; i < data.length; i++){
	    		if(data.length >= 1 && data.length <8){
	    			$("#moreViewI").prop("disabled",true);
	    		}
	    		htmlAppend(data[i], div_name);

			}
	    	
	    	if(data.length < 1){
	    		$("#moreViewI").prop("disabled",true);
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
	
	
	html += '<div class="project" style = "max-height : 400px; ">';
	html += '<input type="hidden" id="confirmYn" value = '+project.confirmYn+'>';
	html += '<div class="context-container" style=" height : 330px;" onclick = "fn_gotoProjectView(this,event, '+project.projectNo+')">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/projects/'+project.projectImage+'" />';
	if(project.deadlineDay > 0 && project.supportPercent >= 100){
	html +=	'<p style="color:tomato; font-size : 15px;  height:25px; font-weight: bolder; margin-left:15px; margin-top:-23px; margin-bottom:-2px;">성공</p>'
	}else{
	html += '';
	}
	html += '<div class="summary">';
	
	html += '<p>'+project.projectTitle+' : '+project.name+'</p>';
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
	if(project.confirmYn == "I"){
	html += '<input type="button" value="프로젝트 삭제" style = "width : 150px; margin-top : -50px; margin-left: 16%; position : relative;" class = "btn btn-danger" onclick = "fn_delete(event,'+project.projectNo+');"/>';
	}
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

function toNextAjax(urlMapping, email, pageName, div_name){
	
	var page;
	
	if(pageName == 'myProjectYet'){
		page = projectYetPage;
	} else if(pageName == 'myProjectYes'){
		page = projectYesPage;
	} else if(pageName == 'myProjectNo'){
		page = projectNoPage;
	} else if(pageName == 'myProjectI'){
		page = projectIPage;
	}
	
	console.log(pageName +" : "+ page);
	
	if( page >= 1){

		if(pageName == 'myProjectYet'){
			page = projectYetPage+1;
			projectYetPage = page;
		} else if(pageName == 'myProjectYes'){
			page = projectYesPage+1;
			projectYesPage = page;
		} else if(pageName == 'myProjectNo'){
			page = projectNoPage+1;
			projectNoPage = page;
		} else if(pageName == 'myProjectI'){
			page = projectNoPage+1;
			projectNoPage = page;
		}

		console.log(page);
		$.ajax({
			url : urlMapping,
			data : {page : page, email : email},
			success : function(data){
				console.log(data);
				
		    	var appendDiv = $("#"+div_name);
		    	
				
		    	for(var i = 0; i < data.length; i++){
		    		if(data.length>=1 && data.length<8 && pageName == "myProjectYet"){
		    			$("#moreViewYet").prop("disabled",true);
		    		}else if(data.length>=1 && data.length<8 && pageName == "myProjectYes"){
		    			$("#moreViewYes").prop("disabled",true);
		    		}else if(data.length>=1 && data.length<8 && pageName == "myProjectNo"){
		    			$("#moreViewNo").prop("disabled",true);
		    		}else if(data.length>=1 && data.length<8 && pageName == "myProjectI"){
		    			$("#moreViewI").prop("disabled",true);
		    		}
		    		htmlAppend(data[i], appendDiv);
				}
		    	
		    	if(data.length < 1){
		    		if(pageName == "myProjectYet"){
		    			$("#moreViewYet").prop("disabled",true);
		    		}else if(pageName == "myProjectYes"){
		    			$("#moreViewYes").prop("disabled",true);
		    		}else if(pageName == "myProjectNo"){
		    			$("#moreViewNo").prop("disabled",true);
		    		}else if(pageName == "myProjectI"){
		    			$("#moreViewI").prop("disabled",true);
		    		}
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
<style>
div.myProfile-container{
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

div#myProjectList-container{
width: 70%;
min-height: 50%;
margin : auto;
line-height : 100px;


}
 
p.title{
font-size:25px; 
font-weight : bolder;
}
</style>


<div class="myProfile-container">
	<div id = "changable-content">
	<div id="img-container">
	
	</div>
	<h1><a href="${pageContext.request.contextPath}/member/profileView.do?email=${memberLoggedIn.email}">${memberLoggedIn.email}</a></h1>
	<input type="hidden" id ="email" value="${memberLoggedIn.email}" />
	</div> 	
	
</div>
	


<div id="myProjectList-container">
<div id="selectBtn-container">
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchAll');">모두보기</button>
&nbsp;
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchYet');">승인대기중</button>
&nbsp;
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchYes');">진행중</button>
&nbsp;
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchNo');">승인 거절</button> 
&nbsp;
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchI');">승인 요청 대기중</button> 
&nbsp;
</div>
<hr />

	<p class="title">
			내가만든 프로젝트 <span id="cnt" style="color:tomato;"></span> 개 
	</p>
	<div id="searchYet">	
	<!-- 내가 만든 프로젝트(컨펌받은 전) -->
	<p class="title" style = "margin-bottom : 20px;">
			승인대기중 
	</p>
	<div class="index-project" id="myProjectYet" style = "min-height: 100%;">
		
		
	</div>
	<input type="button" value="더보기" class = "btn btn-success" id="moreViewYet" style = "width:1024px; margin: auto;"  onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectYet','${memberLoggedIn.email}','myProjectYet','myProjectYet');" />
	<hr />
	</div>
	<!-- 내가 만드 프로젝트(진행중) -->
	<div id="searchYes">
	<p class="title" >
			진행 중
		</p>
	<div class="index-project" id="myProjectYes" style = "min-height: 100%;">
		
		
		
		
	</div>
	<input type="button" class = "btn btn-success" id="moreViewYes"  style = "width:1024px; margin: auto;" value="더보기" onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectYes','${memberLoggedIn.email}','myProjectYes','myProjectYes');" />
	<hr />
	</div>
	<!-- 내가 만드 프로젝트(컨펌거부) --> 
	<div id="searchNo">
	<p class="title">
			승인 거절 
	</p>
	<div class="index-project" id="myProjectNo" style = "min-height: 100%;">
		
		
	</div>
	<input type="button" value="더보기" class = "btn btn-success" id="moreViewNo" style = "width:1024px; margin: auto;"  onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectI',${memberLoggedIn.email}','myProjectNo','myProjectNo');" />
	<hr />
	</div>
	<div id="searchI">
	<!-- 내가 만드 프로젝트(컨펌승인 요청 전) --> 
	<p class="title">
			승인요청전
	</p>
	<div class="index-project" id="myProjectI" style = "min-height: 100%;">
		
		
	</div>
	<input type="button" value="더보기" class = "btn btn-success" id="moreViewI" style = "width:1024px; margin: auto;" onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectI',${memberLoggedIn.email}','myProjectI','myProjectI');" />
	<hr />
	</div>
	
</div>

<script>
	function fn_search(searchTypeStr){
	
	 var searchType = searchTypeStr.trim();
		console.log(searchType);
		if(searchType == "searchAll"){
			$("#searchYet").css("display","block");
			$("#searchYes").css("display","block");
			$("#searchNo").css("display","block");
			$("#searchI").css("display","block");
		}
		else if(searchType =="searchYet"){
			$("#searchYet").css("display","block");
			$("#searchYes").css("display","none");
			$("#searchNo").css("display","none");
			$("#searchI").css("display","none");
			
		}
		else if(searchType == "searchYes"){
			$("#searchYet").css("display","none");
			$("#searchYes").css("display","block");
			$("#searchNo").css("display","none");
			$("#searchI").css("display","none");
			
		}
		else if(searchType == "searchNo"){
			$("#searchYet").css("display","none");
			$("#searchYes").css("display","none");
			$("#searchNo").css("display","block");
			$("#searchI").css("display","none");
			
		}
		else if(searchType =="searchI"){
			$("#searchYet").css("display","none");
			$("#searchYes").css("display","none");
			$("#searchNo").css("display","none");
			$("#searchI").css("display","block");
			
		}
	}
	
	function fn_delete(event, projectNo, projectWriter){
	
	console.log("fn_delete");
	var event = event || window.event;
	var memberLoggedIn =  $("#email").val().trim();
	//ie를 제외한 브라우져
     event.stopPropagation();
     //ie8이하 브라우져
     event.cancelBubble = true;
     console.log(projectNo);
     console.log(memberLoggedIn);
     
     
     $.ajax({
    	 url :  "${pageContext.request.contextPath}/project/deleteProject.do",
    	 data : {projectNo : projectNo, memberLoggedIn : memberLoggedIn},
    	 type : "POST",
    	 success : function(data){
    		if(data > 0){
    			alert("프로젝트 삭제 성공");
    			location.reload();
    		}else{
    			alert("project 삭제 실패");
    		}
    	 },
    	 error : function (jqxhr,textStatus,errorThrown){
    		 console.log("ajax 실패");
    	 }
    	 
    	 
    	 
     })
     
     
	}

	function fn_gotoProjectView(el,event, projectNo){
		console.log($(this));
		var event = event || window.event;
		var email = $("#email").val().trim();
		var confirmYn = $(el).prev("#confirmYn").val();
		
		//ie를 제외한 브라우져
	     event.stopPropagation();
	     //ie8이하 브라우져
	     event.cancelBubble = true;
		 console.log(projectNo);
		 console.log(confirmYn);
	        if(projectNo == null){
	           return false;
	        }
	        if(confirmYn =="Y"){
	        console.log(projectNo);
	        location.href="${pageContext.request.contextPath}/project/projectView.do?projectNo="+projectNo+"&email="+email;
	        }else if(confirmYn == "I"){
	        console.log(projectNo);
		    location.href="${pageContext.request.contextPath}/project/updateProject/outline?projectNo="+projectNo;	
	        } else if(confirmYn == "F" || confirmYn == "N"){
	        console.log(projectNo)
	        location.href="${pageContext.request.contextPath}/project/projectPreview?projectNo="+projectNo;
	        }
	}
	
	


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />