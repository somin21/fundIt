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
div#profile-container1{
	margin: 0 auto 0;
	width : 75%;
	padding-top: 40px;
}
div#profile-inner-container1{
	padding: 2%;
	margin: 0 auto 0;
	width : 100%;
	float: left;
}
div#profile-title1{
	margin-bottom: 5%;
}
div#profile-image1{
	
}
div#profile-preview1{
	border: 1px solid green;
	width: 200px;
	height: 150px;
	float: right;
	display: inline-block;
}

div#profile-img1{
	margin: auto 0;
}
div#profile-img1 img{
	width: 70px;
	height: 70px;
}
div#profile-file1{
	margin: auto 0;
}
div#profile-file1 p#img-ex1{
	font-size: 11px;	
}
#file1{
	margin-right: 5px;
	margin-bottom: 5px;
}
div#around2{
	border: 2px dashed lightgray;
	border-radius:50px;
	padding: 6%;
	float: left;
	width: 70%;
}
</style>
<script>
var file;
$(document).ready(function(){
	$("#file1").on("change",handleImgFileSelect);
});
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 파일만!");
			return;
		}
		
		file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#imgpro").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
</script>
<div id="profile-container1">
	<div id="profile-inner-container1">
		<div id="profile-title1">
			<h4>프로필 설정</h4>
		</div>
		<div id="around2">
		<form action="profileUpdate.do" name="proFrm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="email" value="${param.email }" />
		<div id="profile-image1" class="form-group row">
			<label for="profile-img1" class="col-form-label col-sm-3"  >프로필 사진 </label>
			<div id="profile-img1" class="form-group row">
				<img alt="프로필사진선택" id="imgpro" src="${pageContext.request.contextPath }/resources/img/surprised.png">
			</div>
			<div id="profile-file1" class="form-group row col-5">
				<input type="file" id="file1" name="profileImage" class="btn btn-sm">
				<!-- <label for="file1"class="filename">선택된 파일 없음</label> -->
				<p id="img-ex1">사이즈는 가로 200px, 세로 250px에 최적화되어있으며, <br /> jpg, gif, png파일을 지원합니다.</p>
			</div>
		
		</div>
		<hr />
		<div id="profile-name" class="form-group row">
			<label for="name" class="col-form-label col-sm-3">이름</label>
			<input type="text" name="name" id="name" class="col-sm-3 form-control" value="${member.name }"/>
		</div>
		<hr />
		<div id="profile-local" class="form-group row">
			<label for="localCode" class="col-form-label col-sm-3">지역</label>
			 <select class="custom-select col-sm-5" id="localCode" name="localCode">
			    <option selected value="">지역을 고르세요</option>
			    <option value="L1">서울</option>
			    <option value="L2">부산</option>
			    <option value="L3">대구</option>
			    <option value="L4">인천</option>
			    <option value="L5">광주</option>
			    <option value="L6">대전</option>
			    <option value="L7">울산</option>
			    <option value="L8">경기</option>
			    <option value="L9">강원</option>
			    <option value="L10">충북</option>
			    <option value="L11">충남</option>
			    <option value="L12">전북</option>
			    <option value="L13">전남</option>
			    <option value="L14">경북</option>
			    <option value="L16">경남</option>
			    <option value="L17">제주</option>
			  </select>
		</div>
		<hr />
		<div id="profile-local" class="form-group row">
			<label for="introduce" class="col-form-label col-sm-3">소개</label>
		 	<textarea name="profileIntroduce" class="form-control col-6" id="introduce" rows="4"></textarea>
		</div>
		<hr />
		<div id="profile-local" class="form-group row">
			<label for="phoneNum" class="col-form-label col-sm-3">전화번호</label>
			<input type="text" name="phoneNum" id="phoneNum" class="col-sm-5 form-control"/>
		</div>
		
		<hr />
		
			<input type="submit" value="수정하기" class="btn btn-danger btn-lg">
		</form>
		</div>
		<div id="profile-preview1">
		프로필 미리보기
		</div>
		
	</div>
	
</div>
