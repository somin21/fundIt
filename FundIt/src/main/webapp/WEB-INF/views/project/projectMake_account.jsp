<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="account" name="sectionName"/>
</jsp:include>
<style>
input#authentication{
	width: 80%; 
	display: inline-block;
}
</style>
<script>
//인증번호시작
function fn_emailAtion(){
	var email = $("#confirmEmail").val();
	var emailId= 'asd@co.kr';
		/* '${memberLoggedIn.email }'; */
	console.log(email);
	console.log(email.length);
	if(email.length==0){
		alert("이메일을 입력하세요!");
	}else{
		jQuery.ajax({
			url: "/fundit/project/emailAuthentication.do", //이메일인증
			type: 'POST',
			dataType: 'json',
			data: {
				email : email,				//이메일
				emailId : emailId			//fundit이메일
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패",jqxhr,textStatus,errorThrown);
			}
		}).done(function(data){
			
		});
	}
}
//인증번호끝
</script>
<form action="${pageContext.request.contextPath }/project/makeProject/end" onsubmit="return project_validate('#account');" method="post" >
	
	<input type="hidden" name="projectNo" value="${projectNo }" />
	
	<!-- 연락처 인증 -->
	<div class="make-project-section">
		<p class="title">연락처 인증</p>
		<div class="make-project-content">
			
			<!-- 이메일 주소 -->
			<div class="shown">
				<p>
					이메일 주소
					<span class="choice">인증 필요</span>
				</p>
				<p>
					<span style="font-size:20px">
						${memberLoggedIn.email }
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>수정하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>이메일 주소</p>
				<p>
					진행자님이 연락받으실 수 있는 이메일을 입력해 주세요. <br />
					프로젝트 관련 중요 안내사항이 모두 이메일로 전달되므로 평소 자주 확인하는 이메일을 입력하시는 것이 좋습니다.
				</p>
				<p>
					<input type="text" id="confirmEmail" name="confirmEmail" value="${memberLoggedIn.email }" />
				</p>
				<p>
					<label for="">인증번호:</label>
					<input type="text" id="authentication" name="confirmAuthentication" /><button type="button" class="Authentication" onclick="fn_emailAtion();">확인</button>
				</p>
				<p>
					<button type="button" class="closeBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="saveBtn" id="confirmEmailBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						인증
					</button>
				</p>
			</div>
			
			<!-- 휴대폰 번호 -->
			<div class="shown">
				<p>휴대폰 번호</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						연락을 위한 휴대폰 번호를 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>휴대폰 번호</p>
				<p>
					진행자님이 연락받으실 수 있는 휴대폰 연락처를 입력해 주세요. <br />
					프로젝트 진행과 관련된 긴급한 사항 전달에만 사용됩니다.
				</p>
				<p>
					<input type="number" id="phone" name="phone" placeholder="01012345678" />
				</p>
				<p>
					<button type="button" class="closeBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="saveBtn" id="confirmEmailBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 입금 계좌 -->
	<div class="make-project-section">
		<p class="title">입금 계좌</p>
		<div class="make-project-content">
			
			<div class="shown">
				<p>입금 계좌</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						후원금을 수령할 은행 계좌를 등록해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>등록하기</span>
					</span>
				</p>
			</div>
			<div class="hidden" id="account">
				<div id="account-title">
					<p>입금 계좌</p>
					<p style="text-align:left">
						후원금을 수령할 은행 계좌 정보를 입력해주세요
					</p>
				</div>
				<div id="account-bank">
					<p>거래 은행</p>
					<p>
						모금에 성공할 경우 350원(VAT별도)의 송금 수수료가 발생합니다.
					</p>
					<p>
						<select name="bankCode" id="accountBank">
							<option selected disabled value="">은행을 선택하세요</option>
							<option value="B1">KDB산업은행</option>
							<option value="B2">BOA</option>
							<option value="B3">IBK기업은행</option>
							<option value="B4">KB국민은행</option>
							<option value="B5">NH농협</option>
							<option value="B6">NH투자증권</option>
							<option value="B7">SC은행</option>
							<option value="B8">경남은행</option>
							<option value="B9">광주은행</option>
							<option value="B10">대구은행</option>
							<option value="B11">대신증권</option>
							<option value="B12">미래에셋</option>
							<option value="B13">부산은행</option>
							<option value="B14">삼성증권</option>
							<option value="B15">새마을은행</option>
							<option value="B16">수협은행</option>
							<option value="B17">신한은행</option>
							<option value="B18">신협은행</option>
							<option value="B19">씨티은행</option>
							<option value="B20">외환은행</option>
							<option value="B21">우리은행</option>
							<option value="B22">우체국</option>
							<option value="B23">유안타증권</option>
							<option value="B24">전북은행</option>
							<option value="B25">제주은행</option>
							<option value="B26">하나은행</option>
							<option value="B27">한화투자증권</option>
						</select>
					</p>
				</div>
				<div id="account-name">
					<p>예금주명</p>
					<p>
						계좌에 등록된 예금주명과 일치해야 합니다.
					</p>
					<p>
						<input type="text" name="accountName" id="accountName"/>
					</p>
				</div>
				<div id="account-number">
					<p>계좌 번호</p>
					<p>
						숫자로만 입력해주세요
					</p>
					<p>
						<input type="number" name="accountNumber" id="accountNumber"/>
						<span id="account-number-cnt">최소 <span id="min-cnt">11</span>자 / <span id="max-cnt" style="float:none">16</span>자 남았습니다</span>
					</p>
				</div>
				<div id="account-type">
					<p>계좌 종류</p>
					<p></p>
					<p style="position: relative;text-align:left">
						<input type="radio" name="accountType" id="individual" value="개인" checked/>
						<label for="individual"><b>개인</b></label>
						<input type="radio" name="accountType" id="licensee" value="사업자"/>
						<label for="licensee"><b>사업자</b>(개인사업자 포함)</label>
					</p>
				</div>
				<div id="btnAccountCloseSave">
					<button type="button" class="accountSaveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</div>
			</div>
		</div>
	</div>

<script>
$(function(){
	$(".accountSaveBtn").on("click",function(){
		
		var isEmpty = false;
		var place = $(this).parents(".hidden").prev(".shown").children("p").last();
		
		$(this).parents(".hidden").find("input").each(function(){
			
			if($(this).val().trim() == ""){
				isEmpty = true;
			}
			
			if($(this).attr("id") == "accountNumber"){

				if($(this).val() < 11){
					isEmpty = true;
				}
			}
			
		});
		
		if($(this).parents(".hidden").find("select").val() == ""){
			isEmpty = true;
		}
		
		if(!isEmpty){
			
			var accountName = $(this).parents(".hidden").find("#accountName").val();
			var bankName = $(this).parents(".hidden").find("#accountBank option:selected").text();
			
			var html = "<span style='font-weight:bold;font-size:20px;color:black;'>"+bankName+"&nbsp;"+accountName+"</span><span></span>";
			var rightHTML = '<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />&nbsp;<span>수정하기</span>';
			
			place.html(html);
			place.children("span").last().html(rightHTML);
			
			$(this).parents(".hidden").slideUp(500);
			$(this).parents(".hidden").prev(".shown").slideDown(500);
			
		} else {
			
			alert("모든 항목을 입력하여야 저장 가능합니다.");
			
		}
	});
	
	
})
</script>

<style>
div.make-project-content div#account div:first-of-type{
	padding: 0;
}
div.make-project-content div#account div{
	padding: 30px 0;
}
div.make-project-content div#account p{
	text-align: left;
}
div.make-project-content div#account span{
	float: none;
}
div.make-project-content div#account div:not(#account-title) p:first-of-type{
	color: #616161;
	font-size: 15px;
}
div#account div#account-type input{
	width: 15px;
}
div#account div#account-type label{
	color: black;
	font-size: 15px;
	position: relative;
	top: -11px;
	margin-right: 30px;
}
input#accountNumber::-webkit-outer-spin-button,
input#accountNumber::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
div#account div#account-number span#account-number-cnt{
	display: block;
    font-size: 13px;
    color: darkgray;
    text-align: right;
}
div#account div#btnAccountCloseSave{
    padding: 0 0 30px;
    text-align: right;
}
div#account div#btnAccountCloseSave button{
	width: 100px;
	height: 35px;
	font-size: 13px;
	font-weight: bold;
	border: 0;
	border-radius: 5px;
}
div#account div#btnAccountCloseSave button:first-of-type{
	background: #e0e1e2;
	color: #5a5a5a;
}
div#account div#btnAccountCloseSave button:first-of-type:hover{
	border: 2px solid #cacbcd;
	background: #cacbcd;
	color: #282929;
	cursor: pointer;
}
div#account div#btnAccountCloseSave button:last-of-type{
	background: #f4b4b8;
	color: #f7faff;
}
div#account div#btnAccountCloseSave button:last-of-type:hover{
	background: #fa6462;
	color: white;
	cursor: pointer;
	border: 0;
}
</style>

<jsp:include page="/WEB-INF/views/project/projectMake_footer.jsp" >
	<jsp:param value="account" name="sectionName"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />