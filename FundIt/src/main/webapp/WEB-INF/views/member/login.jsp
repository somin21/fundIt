<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>

#login-table{
border: 0.5px dashed ;

margin: 50px auto 0  ;
width:350px;
height: 500px;
}
table#login-table input#email{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
}
#login-table td{
text-align: center;
}
#pwd{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
}

table#login-table button#naver{

width:300px;
height:40px;
}
table#login-table button#login{
width:300px;
height:40px;
}
table#login-table a#join{
color: red;
}
table#login-table a#pwd-find{
color:red;
}
</style>
	<br /><br />
	<div>
	<table id="login-table">
	<tr>
		<td>
			<input type="email" id="email" placeholder="이메일 주소 입력" /> 
			<input type="password" id="pwd" placeholder="비밀번호 입력 주소 입력" />
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="login" class="btn btn-danger">로그인</button>
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="naver" class="btn btn-success">N  네이버 아이디로 로그인</button>
		</td>
	</tr>
	<tr>
		<td>아직 계정이 없으신가요?<a href="${pageContext.request.contextPath }/member/join.do" id="join">FundIt 가입하기</a></td>
	</tr>
	<tr>
		<td><a href="" id="pwd-find">혹시 비밀번호를 잊으셨나요?</a></td>
	</tr>
	</table>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>