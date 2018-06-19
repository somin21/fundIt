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
table#login-table input#join-email_{
margin-bottom :10px;
width:280px;
height:40px;
padding: 20px;
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
table#login-table input#join-pwd_{
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

table#login-table span.guide{
display:none;
font-size:15px;
color:red;


}
</style>
<script>

	$(function(){

		
		$(".check-pwd").blur(function(){
			var p1 = $("#join-pwd_").val();
			var p2 = $("#join-pwd").val();
			
			if(p1 != p2){
				$(".guide.pwdError").show();
			
			}else{
				$(".guide.pwdError").hide();
			}
			
		});
	

	 
	$(".check").on("keyup",function(){
		
		var Email2= $("#join-email_").val();
		var Email = $("#join-email").val();
	console.log(Email);
	console.log(Email2);
	
			
		
		
		$.ajax({
			url : "checkEmailDuplicate.do",
			data:{Email:Email},
			dataType:"json",
			success:function(data){
				console.log(data);
				if(data.isUsable==true && Email == Email2){
					 $(".guide.error").hide();
						$(".guide.ok2").hide();
					$(".guide.ok").show();
					$("EmailDuplicateCheck").val(1); 
				}
				else if(data.isUsable==true && Email != Email2){
					 $(".guide.error").hide();
					 $(".guide.ok2").show();
					 $(".guide.ok").hide();
					 $("EmailDuplicateCheck").val(0); 
				}
				else if(data.isUsable==false && Email != Email2){
					$(".guide.error").hide();
					$(".guide.ok2").show();
					$(".guide.ok").hide();
					$("EmailDuplicateCheck").val(0);
				}
				else{
					$(".guide.error").show();
					$(".guide.ok2").hide();
					$(".guide.ok").hide();
					$("EmailDuplicateCheck").val(0);
				}
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패",jqxhr,textStatus,errorThrown);
			}
		});
	});
});

</script>

	<br /><br />
	<div>
	<form action="emailjoinEnd.do" method="post" onsubmit="return validate();">
	<table id="login-table">
	
		<tr>
		<td>
			<button type="button" id="naver" class="btn btn-success">N  네이버 아이디로 가입하기</button>
		</td>
	</tr>
	<tr>
	<td>
		<p>이름</p>
			<input type="text" id="join-name" name="Name" placeholder="이름을 입력하세요" required /> <br />
		</td>
	</tr>
	
	<tr>
		<td>
		<p>이메일</p>
			<input type="email" class="check" id="join-email_" name="Email" placeholder="이메일 주소를 입력해주세요" required /> <br /> 
			<input type="email" class="check"  id="join-email" placeholder="이메일 주소를 확인합니다" required /> <br />
			<span class="guide ok">이 이메일는 사용 가능합니다.</span> <br />
		<span class="guide error">이 이메일는 사용중 입니다..</span><br />
		<span class="guide ok2">이메일이 일치하지 않습니다.</span> <br />
		<input type="hidden" id="EmailDuplicateCheck" value="0" />
		</td>
		
	</tr>
	
	
	<tr>
		<td>
		<p>비밀번호</p>
			<input type="password" id="join-pwd_"  class="check-pwd" name="Password" placeholder="비밀번호를 입력해주세요" required /> <br />
			<input type="password" id="join-pwd" class="check-pwd" placeholder="비밀번호를 확인합니다" required /> <br />
			<span class="guide pwdError">패스워드가 일치하지 않습니다.</span> <br />
		</td>
		
	</tr>
	<tr>
		<td>
			<input type="submit" class="btn btn-danger" id="email-join" value="이메일로 가입하기" />	
		</td>
	</tr>
	<tr>
		<td>이미 계정이 있으신가요? <br /><a href="${pageContext.request.contextPath }/member/login.do" id="join">기존 계정으로 로그인하기</a></td>
	</tr>

	</table>
	</div>
	</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>