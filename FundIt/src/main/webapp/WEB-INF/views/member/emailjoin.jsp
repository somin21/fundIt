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
table#login-table input#join-email{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
}

table#login-table input#join-pwd{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
}
table#login-table input#join-name{
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
margin-bottom:10px;
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
			<button type="button" id="naver" class="btn btn-success">N  네이버 아이디로 가입하기</button>
		</td>
	</tr>

	<tr>
		<td>
			<input type="text" id="join-name" placeholder="이름을 입력하세요" />
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="email" id="join-email" placeholder="이메일 주소를 입력해주세요" /> 
			<input type="email" id="join-email" placeholder="이메일 주소를 확인합니다" />
		</td>
	</tr>
	
	
	<tr>
		<td>
			<input type="email" id="join-pwd" placeholder="비밀번호를 입력해주세요" /> 
			<input type="email" id="join-pwd" placeholder="비밀번호를 확인합니다" />
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="email-join" class="btn btn-danger" onclick="location='emailjoin.do'">이메일로 가입하기</button>
		</td>
	</tr>
	<tr>
		<td>이미 계정이 있으신가요? <br /><a href="${pageContext.request.contextPath }/member/login.do" id="join">기존 계정으로 로그인하기</a></td>
	</tr>

	</table>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>