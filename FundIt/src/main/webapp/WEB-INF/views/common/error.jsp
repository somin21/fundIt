<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>

<style>
body{
	background: #ce3426;
	user-select: none;
}
button:focus{
	outline: 0 !important;
}
div#error-wrapper{
    margin: 15% auto 0;
    width: 100%;
    color: white;
    box-sizing: border-box;
    padding: 0 20%;
}
div#error-wrapper p:first-of-type{
	font-size: 2em;
}
div#error-wrapper p:nth-of-type(2){
    line-height: 50px;
    font-size: 15px;
}
div#error-wrapper p:last-of-type{
	text-align: center;
}
div#error-wrapper p:last-of-type button{
    width: 120px;
    height: 50px;
    border: 0;
    color: white;
    border-radius: 10px;
    background: #e46656;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 30px;
}
div#error-wrapper p:last-of-type button:hover{
    border: 2px solid white;
    background: #ce3426;
}
</style>
</head>

<body>

<div id="error-wrapper">
	<img src="${pageContext.request.contextPath }/resources/images/error.png" />
	<br />
	<p>에러발생</p>
	<p>
		요청 작업 처리 중 에러가 발생하였습니다.
		<br />
		잠시 후 다시 시도해주십시오.
		<br />
		계속 동일한 문제가 발생한다면, 관리자에게 문의하십시오.
	</p>
	<p>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}'">돌아가기</button>
	</p>
</div>

</body>
</html>