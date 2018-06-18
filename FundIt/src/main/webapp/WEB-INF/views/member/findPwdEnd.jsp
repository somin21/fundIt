<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
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
p#pwdDes{
text-align : left;
 margin-left : 20px;
 margin-top : -40px;
 color : gray;	
}
#findPwdBtn{
width : 280px;
height : 50px;
font-weight : bolder;
margin-left : -5px;
}
</style>

	<br /><br />
	<div>
	<form action="${pageContext.request.contextPath}/member/findPwdSendLink.do" method = "post">
	<table id="login-table">
	<tr>
		<th>
			<span style = "font-size : 30px; margin-left : 20px;">비밀번호 찾기</span> <br />
			<hr />	
		</th>
	</tr>
	<tr>
		<td> 
		<p id="pwdDes">
		 	펀드잇 가입시 사용하신 이메일을 <br />
			입력하시면 새 비밀번호를 생성할 수 있는 <br />
			링크를 보내드립니다. <br /><br />
			페이스북/네이버로 가입하신 경우<br />
			페이스북/네이버 계정에 쓰이는 이메일을 <br />
			입력해 주세요.	
		</p>
		</td>
	</tr>
	<tr>
		<td>
			<input type="email" name="email" id="email" placeholder="가입하신 이메일 주소" /> <br />
			<input type="submit" class = "btn btn-danger" id="findPwdBtn" value = "비밀번호 설정 링크받기" onclick = "return validate();"/>
		</td>
	</tr>
	</table>
	</form>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
function validate(){
	 var email = $("#email").val();
	console.log(email);
	if(email.length == 0){
		alert("이메일을 입력해주세요");
		return false;
	}
	return true;
}
</script>