<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Sunflower:300" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div#postcodify{
text-align : center;

}

div#postcodify input{
width : 60%;
height : 40px;
border-radius : 5px;
margin-right : 20px;
border : 1px solid skyblue;
font-size : 20px;
font-famaly : 'Sunflower', sans-serif;

}
div#postcodify input:focus{
width : 60%;
height : 40px;
border-radius : 15px;
margin-right : 20px;
border : 3px solid skyblue;
outline : none;
}
div#postcodify button{
    width: 100px;
	height: 50px;
	font-size: 13px;
	font-weight: bold;
	border: 0;
	border-radius: 5px;
	background: lightblue;
	cursor: pointer;
	margin-top : -76px;
 
}
div#postcodify button:hover{
    border: 2px solid #cacbcd;
	background: #cacbcd;
	color: #282929;
	cursor: pointer;
}
div#postcodify button:focus{
outline : none;
}
body {
text-align : center;
background : #f0f5f3;

}
.table th{
border-top : 1px solid darkgray;
border-bottom : 1px solid darkgray;
}
.table td{
border-top : 1px solid lightgray;
border-bottom : 1px solid lightgray;
}


</style>
</head>
<body>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<input type="hidden"  id="idNum" value = "${idNum}"/><br />
<div id="postcodify"></div>
<hr style = "border : 1px solid darkgray"/>


<input type="hidden" name="" id="postcode" /><br />
<input type="hidden" name="" id="address"  /><br />
<input type="hidden" name="" id="details"  /><br />
<input type="hidden" name="" id="extra_info"  /><br />

<div class="panel panel-default" style = "width : 80%; margin : auto; margin-top : 0px; margin-bottom : 50px;">

<div class="panel-heading"><h4>우편번호 검색 요령</h4></div>
<br />

<table class = "table" >
	<tbody>
	<tr>
		<th>구분</th>
		<th>사용할 검색어</th>
		<th>검색 예</th>
	</tr>
	<tr>
		<td>도로명주소</td>
		<td>도로명 + 번호</td>
		<td>세종대로 110</td>
	</tr>
	<tr>
		<td>지번주소</td>
		<td>동·리 + 번지</td>
		<td>부산 연산동 1000</td>
	</tr>
	<tr class="postcodify_building_search">
		<td>건물명</td>
		<td>빌딩 또는 아파트단지명</td>
		<td>수곡동 주공3차</td>
	</tr>
	<tr>
		<td>사서함</td>
		<td>사서함명 + 번호</td>
		<td>광화문우체국사서함 123-4</td>
	</tr>
	<tr>
		<td colspan = "3" style="text-align :center; color : tomato;">주소 클릭 후 확인버튼을 클릭하세요</td>
	</tr>
	</tbody>
</table>
</div>
	


<input type="button" value="확인" class="btn btn-info" style = "width : 80%; height : 40px; margin-bottom : 50px;" onclick = "sendToParent();"/>
</body>
<script>
$(function() { 
	
	
	$("#postcodify").postcodify({
		 insertPostcode5 : "#postcode",
	     insertAddress : "#address",
	     insertDetails : "#details",
	     insertExtraInfo : "#extra_info",
	     hideOldAddresses : false
	});
});

function sendToParent(){
	
	var postcode = $("#postcode").val();
	var address = $("#address").val();
	var details = $("#details").val();
	var idNum = $("#idNum").val();
	
	opener.document.getElementById("postNum"+idNum).value = postcode;
	opener.document.getElementById("address"+idNum).value = address;
	opener.document.getElementById("details"+idNum).value = details;
	
	self.close();
}





</script>
</html>