<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>
let isEnd = false;
var email = '';
var searchKeyword = "";
var searchType = "";

function fn_search(searchTypeBtn){
	
	$("#supportList-container").html('');
	
	console.log(searchType);
	searchType = searchTypeBtn.trim();
	$("#searchType-hidden").val(searchType);
	console.log("hidden.val = "+$("#searchType-hidden").val());
	email = $("#email").val().trim();
	if(searchType == 'searchComplated'){
		
		searchKeyword = $("#searchKeyword").val().trim();;
		console.log(searchKeyword);
	}
	
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/selectMySupport",
		data : {email : email, searchType : searchType, searchKeyword : searchKeyword},
		success : function(data){
			console.log(data)	
			for(var i = 0; i< data.length; i++){
				
				htmlAppend(data[i], "#supportList-container");
				
			}
			if(data.length < 1){
				htmlAppendNone(data.length+1, "#supportList-container");
				
			}
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
				
		});
	
	
}






$(function(){
	email = $("#email").val().trim();
	
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
			console.log("ajax실패!!");
		}
	});
	
	$.ajax({
	url : "${pageContext.request.contextPath}/member/selectMySupport",
	data : {email : email},
	success : function(data){
		console.log(data)	
		for(var i = 0; i< data.length; i++){
			
			htmlAppend(data[i], "#supportList-container");
			
		}
		if(data.length < 1){
			htmlAppendNone(data.length+1, "#supportList-container");
			
		}
	},
	error : function(jqxhr,textStatus,errorThrown){
		console.log("ajax실패");
	}
			
	});
	
	
	
	
	
});

function htmlAppend(project, div_name){
	var html = '';
	
	html += '<div class="project"  onclick = "fn_gotoProjectView();">';
	html += '<input type="hidden" name="projectNo" id ="projectNo" value="'+project.projectNo+'" />';
	html += '<img src="${pageContext.request.contextPath }/resources/images/projects/'+project.projectImage+'" />';
	html += '<div class="summary" style = "height : 250px;">';
	html += '<p>'+project.projectTitle+' : '+project.projectWriter+'</p>';
	var supportGoal = numberWithCommas(project.supportGoal);
	var mySupportMoney = numberWithCommas(project.mySupportMoney);
	html += '<p>목표금액 - '+supportGoal+'원</p>';
	html += '<p>나의 후원금액 - '+mySupportMoney+'원</p>';
	html += '<p>선물명 - '+project.itemName+'</p>'
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
	html += '&nbsp;'+project.deadlineDate+'일 남음';
	html += '</div>';
	html += '<div class="support">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/money.png"/>';
	html += '&nbsp;('+project.supportPercent+'%)';
	html += '</div>';
	html += '</div>';
	html += '</div>';
    
	$(div_name).append(html);
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
		html += '후원하신 프로젝트가 없습니다';
		html += '</span>';
		html += '</p>';
		html += '</div>'; 
		html += '</div>';
		
		$(div_name).append(html);	
	
}

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
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
div.input-group{
width : 40%;
margin-top : -38px;
margin-left : 230px;
}
div#supportList-container{
width : 100%;
margin-top : 100px;
}
div#mySupport-container{
margin : auto;
margin-top : 150px;
width: 70%;
}
div.project {
width : 250px;
height: 450px;
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

<div id="mySupport-container">

<div id="selectBtn-container">
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchAll');">모두보기</button> <!-- searchAll  -->
&nbsp;
<button type="button" class="btn btn-outline-secondary" onclick = "fn_search('searchOnGoing');">펀딩 진행중</button> <!-- searchOnGoing  -->
&nbsp;
<div class="input-group mb-3">
  <div class="input-group-prepend" >
    <button class="btn btn-outline-secondary" type="button" onclick = "fn_search('searchComplated');">후원 완료</button>
  </div>
  <!-- searchComplated  -->
  <input type="text" id="searchKeyword" class="search" placeholder="프로젝트/선물/창작자를 검색하세요" size=40 min="3" max="40" aria-describedby="basic-addon1">
</div>

</div>
<hr />

  <input type="hidden" id = "searchType-hidden" />
	<div id="supportList-container">
	




	</div>
</div>

<script>
	function fn_gotoProjectView(){
		var email = $("#email").val().trim();
		console.log(email);
		$(".project").click(function(){
	        var projectNo = $(this).children("#projectNo").val();
	        console.log(projectNo)
	        if(projectNo == null){
	           return false;
	        }
	        console.log(projectNo);
	        location.href="${pageContext.request.contextPath}/project/projectView.do?projectNo="+projectNo+"&email="+email;
	     });
	}


</script>






<jsp:include page="/WEB-INF/views/common/footer.jsp" />