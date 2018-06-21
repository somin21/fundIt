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
.pwd{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
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
#changePwdBtn{
width : 280px;
height : 50px;
font-weight : bolder;
margin-left : -5px;
}
</style>

	<br /><br />
	<div>
	<form action="${pageContext.request.contextPath}/member/changePwdEnd.do" method = "post">
	<table id="login-table">
	<tr>
		<th>
			<span style = "font-size : 25px; text-align:center;">${email}<br />님의 비밀번호 변경</span>
			<hr />	
		</th>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="email" value = "${email}" />
			<input type="password" name="password" class = "pwd" id="password" placeholder = "새 비밀번호" required /> <br />
			<input type="password" class = "pwd"  id="password_chk" placeholder = "새 비밀번호 확인" required/>
		</td>
	</tr>
	<tr>
		<td><input type="submit" value="비밀번호 변경" id="changePwdBtn" class = "btn btn-success" onclick = "return validate();"/></td>
	</tr>
	</table>
	</form>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
function validate(){
	 var password = $("#password").val();
	 var password_chk = $("#password_chk").val();
	
	if(password != password_chk){
		alert("비밀번호를 확인해주세요");
		$("#password_chk").focus();
		return false;
	}
	return true;
}
</script>