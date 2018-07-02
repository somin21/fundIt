<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

<style>
div.title{background:linear-gradient(to right, #0f0051, #320032); padding: 10px 0 10px 0; text-align: center;}
span.titleSp{color:white; font-size: 23px; font-weight: bold;}
div.main{text-align: center;}
div.inputMenu{background:rgb(240, 240, 240); padding: 40px 0 40px 30px; text-align: center; width: 80%; display: inline-block;}
input.form-control{width: 100%; display: inline-block; }
label#a{padding:7px; width: 110px; text-align: right;}
table.inputTable{display: inline-block;}
table td#td{width: 70%}
</style>
<div class="title">
	<span class="titleSp">${title }</span> 
</div>
<br /><br />
<div class="main">
	<div class="inputMenu">
		<div>
		<table class="inputTable">
			<tr>
				<td><label for="itemName" id="a">프로젝트명   : </label></td>
				<td id="td"><input type="text" id="title" class="form-control" value="${title }" readonly/><br /></td>
			</tr>
			<tr>
				<td><label for="itemName" id="a">아이템명   : </label></td>
				<td id="td"><input type="text" id="title" class="form-control" value="${itemName }" readonly/><br /></td>
			</tr>
			<tr>
				<td><label for="amount" id="a">후원금액 : </label></td>
				<td id="td"><input type="number" id="amount" class="form-control" value="${num }" readonly/><br /></td>
			</tr>
			<tr>
				<td><label for="buyer_id" id="a">결 재 ID  : </label></td>
				<td id="td"><input type="text" id="buyer_id" class="form-control" value="${memberLoggedIn.email }" readonly /><br /></td>
			</tr>
			<tr>
				<td><label for="buyer_name" id="a">구 매 자  : </label></td>
				<td id="td"><input type="text" id="buyer_name" class="form-control" value="${memberLoggedIn.name }"/><br /></td>
			</tr>
			<tr>
				<td><label for="buyer_name" id="a">이 메 일  : </label></td>
				<td id="td"><input type="email" id="buyer_email" class="form-control"/><br /></td>
			</tr>
			<tr>
				<td><label for="buyer_tel" id="a">연 락 처  : </label></td>
				<td id="td"><input type="tel" id="buyer_tel" class="form-control" required placeholder="-없이 입력해주세요"/><br /></td>
			</tr>
			<tr>
				<td><label for="buyer_postcode" id="a">우편번호 : </label></td>
				<td id="td">
					<br />
					<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기" size="30px" />
					<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" > &nbsp;&nbsp;
	                <input type="hidden" name="address" id="address" value="" />
	                <span id="guide" style="color: #999"></span>
                </td>
			</tr>
			<tr>
				<td><label for="buyer_addr" id="a">주   소 : </label></td>
				<td id="td">
					<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소"  /> <br />
					<input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소"  />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button onclick="requestPay();">결재</button>
				</td>
			</tr>
		</table>
		</div>

	</div>

</div>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 결재스크립트 -->
<script>
	function requestPay(){
	//변수값
	var title = $("#title").val();
	var amount = $("#amount").val();
	var buyer_id = $("#buyer_id").val();
	var buyer_name = $("#buyer_name").val();
	var buyer_email = $("#buyer_email").val();
	var buyer_tel = $("#buyer_tel").val();
	var postcode = $("#sample4_postcode").val()
	var address = $("#sample4_roadAddress").val()+" "+$("#sample4_jibunAddress").val();
	var projectNo = ${projectNo};
	var minMoney = ${minMoney==null? '0':minMoney};
	var itemName = '${itemName}';
	var itemNum = '${itemNum}';
	var delivery = '${delivery==null?'N':delivery}';
	
	IMP.init('imp17080880');
	IMP.request_pay({
	    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
	    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
	    name : title,
	    amount : amount,
	    buyer_email : buyer_email,
	    buyer_name : buyer_name,
	    buyer_tel : buyer_tel, //누락되면 이니시스 결제창에서 오류
	    buyer_addr : address,
	    /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
	    /* buyer_postcode : '123-456' */
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "payments.do", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
	    			imp_uid : rsp.imp_uid,				//고유코드
		    		merchant_uid : rsp.merchant_uid,	//고유코드
		    		//기타 필요한 데이터가 있으면 추가 전달
		    		apply_num : rsp.apply_num, 			//카드 승인번호
		    		amount : rsp.paid_amount,	//총결재금액
		    		buyer_id : buyer_id, 		//fundit ID
		    		projectNo : projectNo, 		//프로젝트 NO
		    		title : title, 				//타이틀명
		    		postcode : postcode, 		//우편번호
		    		address : address, 			//주소
		    		minMoney : minMoney, 		//최소금액
		    		itemName : itemName, 		//아이템이름
		    		itemNum : itemNum, 			//아이템갯수
		    		delivery : delivery 		//배송여부
	    		}
	    		,
/* 	    		success:function(data){
	    			console.log("섹스"+data);
	    			jQuery.ajax({		
	    		    	url: m_redirect_url, //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid,				//고유코드
				    		merchant_uid : rsp.merchant_uid,	//고유코드
				    		//기타 필요한 데이터가 있으면 추가 전달
			    	    }
	    			})
	    		}, */
	    		error : function(jqxhr,textStatus,errorThrown){
					console.log("ajax실패",jqxhr,textStatus,errorThrown);
				}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		/* if ( everythings_fine ) { */
	    			console.log("마지막="+data);
	    			console.log("마지막2="+data.isUsable);
	    		if ( data.isUsable==true ) {
	    			var msg = '결제가 완료되었습니다.';
	    			/* msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid; */
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			msg += '\n카드 승인번호 : ' + rsp.apply_num;
	    			msg += '\n후원현황에서 확인하세요!'
	    			
	    			alert(msg);
	    			
	    			location.href ="${pageContext.request.contextPath}/project/projectView.do?projectNo="+projectNo ;
	    	 	} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    			var msg = '결제에 실패하였습니다.';
	    	        msg += '\n상세내용 : ' + rsp.error_msg;
	    	        msg += '\n<긴급>관리자에게 문의하세요!!!'
	    	        
	    	        alert(msg);
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n상세내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
	}
</script>
<!-- 다음API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- 도로명 API -->
<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function sample4_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraRoadAddr !== '') {
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if (fullRoadAddr !== '') {
                     fullRoadAddr += extraRoadAddr;
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                  document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  if (data.autoRoadAddress) {
                     //예상되는 도로명 주소에 조합형 주소를 추가한다.
                     var expRoadAddr = data.autoRoadAddress
                           + extraRoadAddr;
                     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                           + expRoadAddr + ')';

                  } else if (data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                           + expJibunAddr + ')';

                  } else {
                     document.getElementById('guide').innerHTML = '';
                  }
               }
            }).open();
   }
</script>
	