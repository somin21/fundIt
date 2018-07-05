<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>		
</jsp:include> 	

<style>
body {
    background-color: #F7F7F7;
    color:  #191919;
    font-family: Helvetica, Arial, sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
}

h1, h2, h3, h4, h5, h6 {
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    margin-top: 0;
}

h1 {
    font-size: 32px;
}

h2 {
    font-size: 22px;
}

h3 {
    font-size: 18px;
    font-weight: 600;
}

h4 {
    font-size: 16px;
}


.container-divider {
    border-top: 1px solid #ddd;
    margin-bottom: 20px;
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1160px;
    margin: 0 auto;
    padding: 0 5%;
}

.sub {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin-bottom: 30px;
  min-height: 50px;
  padding-bottom: 15px;
}

#label {
  position: relative;
}

#label {
   width: 400px;
   height: 48px;
   padding-left: 30px;
   font-size: 18px;
   color: #006fff;
   border: 1px solid #d2e0fc;
   border-radius: 8px;
   -webkit-appearance: none; 
   appearance: none;
   background: #d2e0fc;   
   cursor:pointer;   
}

#label:hover, #label:focus, #label:active {
  z-index: 10;
  border: 1px solid #006fff;
}

select option:checked, select option:hover {    
    background: #0099ff; 
     box-shadow: 0 0 10px 100px #0099ff inset;  
    color: #fff;
}

.crumbs {
  margin: 0 0 15px 0;
  padding: 0;
}

.crumbs li {
  color: #666;
  display: inline;
  font-weight: 400;
  font-size: 13px;
  max-width: 450px;
  overflow: hidden;
  text-overflow: ellipsis;
}

.crumbs li + li::before {
  content: ">";
  margin: 0 4px;
  color: #cccccc;
}

.crumbs li a {
  color: #757575;
  font-weight: bold;
}

.warning {
  display: block;
  padding: 1em 1.5em;
  margin: 1em 0;
  border-radius: 8px;
  font-size: 14px;
  color: #4473e9;
  background-color: #d2e0fc;
}

#textarea {
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #afafaf;
    transition: 0.5s;
    outline: none;
}

#textarea:focus {
    border: 1px solid #3242d1;
}

.inp {
  background-color: #6279fa;
  border: 0;
  border-radius: 5px;
  color: #ffffff;
  font-size: 18px;
  font-weight: bold;
  padding: 1.0em 3.5em 1.0em 3.5em ;
  transition: background-color .20s ease-in-out;
}

.inp:hover, .inp:active, .inp:focus {
  background-color: #0024f3;
  color: #ffffff;
  text-decoration: none;
}

.form {
  max-width: 650px;
}

.form p {
  color: #666;
  font-size: 12px;
  margin: 5px 0;
}

</style>

<body class="">

    <main role="main">
    <div class="container-divider"></div>
   
    <div class="container">
    <nav class="sub">
    <ol class="crumbs">
        <li title="펀드잇 헬프 센터">
            <a href="${pageContext.request.contextPath }/help/helpView.do">펀드잇 헬프 센터</a>
        </li>
        <li title="문의 등록">
                  문의 등록
        </li>
    </ol>
    
    <select name="label" id="label" onchange="location.href= this.value">
	   <option value="">원하시는 내용을 선택하세요</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">재결제</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">펀딩과 후원</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">결제 수단 변경</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">아이템 제약</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">홍보기준</option>
       <option value="${pageContext.request.contextPath}/help/helpView.do">모금액 정산</option>      
    </select>
    </nav>
    
    
    <h1><펀드잇에 문의하기></h1>
    <br />
    <p>
        펀드잇에 가입하신 이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 최대 2일 내에 답변을 드리겠습니다. 
    </p>
    
    <div class="warning">
        특정 프로젝트와 관련한 질문은 해당 프로젝트 페이지의 <b>창작자에게 문의하기</b> 기능을 이용해주세요.<br>
        후원 결제에 대한 문의는 <b>후원번호</b>를 문의와 함께 알려주시면 빠른 안내가 가능합니다. 후원번호는<b>내 후원 현황</b>에서 확인하실 수 있습니다.<br>
        텀블벅 서비스와의 제휴/협력 제안은 <b>xxxx@fundit.com</b>으로 보내주시기 바랍니다.
    </div>
	<br />
	
    <div class="form">
        <p class="a1">*문의하실 내용을 알려주세요.*</p>
        <form action="${pageContext.request.contextPath}/help/helpRequestEnd.do">
        	<input type="hidden" name="userId" value="${memberLoggedIn.email }"/>
        	<input type="hidden" name="reciver" value="hoyjung34@naver.com"/>
	        <p><span id="counter">0</span>/700</p>
	        <textarea id="textarea" name="context" rows="10" style="width:100%;" placeholder = "700자 이하로  입력하시오..."></textarea>
	        <input class="inp" type="submit" value="제출"/>
	 	 </form>
        </div>
        
        <br><br>
        <p> 영업일 기준 최대 2일 내에 답변을 드리겠습니다. 조금만 기다려주세요! </p>
      </div>

    </main>
    
<script>
$("textarea").keydown(function(){
    var input = $(this).val().length;
    $("#counter").html(input);
    var remain = 700 - input;
    $("#counter").css("color", "black");
});

$(document).ready(function() {
	var textCountLimit = 700;
    $('textarea[name=context]').keyup(function() {
        var textLength = $(this).val().length;
 
        $('#textCount').text(textLength);
         
        if (textLength > textCountLimit) {
            $(this).val($(this).val().substr(0, textCountLimit));
        }
    });
});
</script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	