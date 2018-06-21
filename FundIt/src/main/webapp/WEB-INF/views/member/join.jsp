<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>

#join-table{
border: 0.5px dashed ;

margin: 50px auto 0  ;
width:350px;
height: 300px;
}
table#join-table input#email{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
}
#join-table td{
text-align: center;
}


table#join-table button#naver-join{

width:300px;
height:40px;
}
table#join-table button#email-join{
width:300px;
height:40px;
}
table#join-table a#join{
color: red;
}

</style>
	<br /><br />
	<div>
	<table id="join-table">
	<tr>
		<td>
			<button type="button" id="email-join" class="btn btn-danger" onclick="location='emailjoin.do'">이메일로 가입하기</button>
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="naver-join" class="btn btn-success" >N 네이버 아이디로 가입하기</button>
		</td>
	</tr>
	<tr>
		<td>이미 계정이 있으신가요? <br/><a href="${pageContext.request.contextPath }/login.do" id="login">기존 계정으로 로그인하기</a></td>
	</tr>
	
	</table>
	</div>
	<script>
	
	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>