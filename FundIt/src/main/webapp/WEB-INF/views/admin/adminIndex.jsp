<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />
<style>
div#out1{
	min-height: 300px;
	text-align: center;
	padding-top: 5%;
	
}

div#out1 div#wrap-a{
	width: 20%;
	height:300px;
	text-align: center;
}

#project-btn {
	width:200px;
	height:65%;
	background-color: black;
	color: white;
	border:0px;
	cursor: pointer;
	border-radius: 30px;
    margin: 14%;
}
#project-inner-btn{
	width:200px;
	height:20%;
	background-color: black;
	color: white;
	border:0px;
	cursor: pointer;
	border-radius: 10px;
    margin: 2%;
}

#project-btn:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
#project-inner-btn:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
#wrap-a1{
	display: none;
	width: 20%;
	height:300px;
	text-align: center;
	padding-top:4%;
}

</style>
<script>
$(function(){
	$(".project1" ).on("click",function(){
		$(this).parent().hide();
		$(this).parent().next().show();
	});
	
});

</script>
	<div class="container" id="out1">
	<h3>- 관리자 페이지입니다 - </h3>
		<div class="row ">
	    	<div class="col-sm align-items-center col " id="wrap-a" >
	    	  	<button id="project-btn" class="project1">프로젝트 관리</button>
	    	</div>
	    	<div class="col-sm align-items-center col" id="wrap-a1">
	    	  	<button id="project-inner-btn" class="" onclick="location.href='${pageContext.request.contextPath}/admin/indexProject.do'">인덱스 프로젝트 관리</button>
	    	  	<button id="project-inner-btn" onclick="location.href='${pageContext.request.contextPath}/admin/projectConfirmList.do'">프로젝트 승인 관리</button>
	    	  	<button id="project-inner-btn" onclick="location.href='${pageContext.request.contextPath}/admin/projectDeadlineList.do'">프로젝트 마감 관리</button>
	    	</div>
	    	<div class="col-sm align-items-center col" id="wrap-a">
		      	<button id="project-btn" onclick="location.href='${pageContext.request.contextPath}/admin/adminMemberList.do'">회원 관리</button>
	    	</div>
	    	<div class="col-sm align-items-center col" id="wrap-a">
		      	<button id="project-btn" onclick="location.href='${pageContext.request.contextPath}/admin/messageList.do'">메세지 관리</button>
	    	</div>
	  	</div>
	</div>
	
<jsp:include page="/WEB-INF/views/admin/footer.jsp" />