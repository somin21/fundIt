<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
div#acc-container1{
	width:100%;
	border: 1px solid red;
	height:140px;
	margin-bottom: 50px;
	background-color: lightgray;
	opacity:0.8;
	margin-top:40px;
}
div#acc-container1-inner{
	width:60%;
	/* margin:0 auto; */
	padding-bottom : 2em; 
	margin-top: 10px;
}
div#acc-container2{
   width:50%;
   margin:auto;
   border-radius:60px;
   padding:3%;
}
div#account-menu1 div#acc-acc1 a#atag1{
	font-size: 13px;
	/* margin-right:10px; */
	text-decoration: none;
	color:black;
}
#textSizing{font-size: 12px;}
#laNew{font-size:12px;}
hr#middle-line1{
	width:80%;
	margin-left: 0;
}
div.col-lg-2{
	padding-left:0px;
}
div#acc-out-container2{
	width: 100%;
	margin: 0 auto;
}
div#around1{
	height: 400px;
	border: 2px dashed lightgray;
	padding: 6%;
	border-radius: 40px;
}
</style>
<!-- 계정설정 타이틀 div  -->
		
<!-- 이메일,,,, 설정 div -->
<div id="acc-out-container2">
	<div id="acc-container2">
		<div class="row clearfix row align-items-center" id="acc-container1-inner">
			<h4 id="h2account" class="font-weight-bold">계정설정</h4>
		</div>
		<form action="memberUpdate.do" method="post">
		<div id="around1">
		  	<div class="form-group row" id="emailDiv111">
		    	<div class="col-lg-8">
		      		<input type="email" class="form-control" id="accEmail" name="email" value="${member.email}" <%-- value="${member.email }" --%>> 
				</div>
		  	</div>
		  	<hr id="middle-line1"/>
		  	<!-- 비밀번호 -->
		  	<div class="form-group row">
		    	<div class="col-sm-8"> 
		    		<button type="button" class="btn btn-outline-danger btn-md" onclick="location.href='${pageContext.request.contextPath}/member/findPwdSendLink.do?email=${member.email }'">비밀번호 변경</button>
	      		<p id="textSizing">새로운 비밀번호를 설정 할 수 있는 링크를 이메일로 보내드립니다.</p>
	      		</div>
		  	</div>
		  	<hr id="middle-line1"/>
		  	<!-- 뉴스레터 구독설정 -->
		  	<div class="form-group row">
		    	<div class="col-sm-8">
		      		<input type="checkbox" class="col-1" id="news" name="newsyn" ${member.newsyn eq "Y" ? "checked":""} >
			    	<label for="news" class="col-form-label" id="laNew">뉴스레터를 구독합니다.</label>
		    	</div>
		  	</div>
		  	<hr id="middle-line1"/>
		  	
			<div class="col align-self-center">
				<input type="submit" value="수정하기" class="btn btn-danger btn-lg">
			</div>
		</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#news").click(function(){
		if($("#news").is(":checked")==true){
			$(this).val("Y");
		}else{
			$(this).val("N");
		}
		console.log($(this).val());
	});
});
</script>