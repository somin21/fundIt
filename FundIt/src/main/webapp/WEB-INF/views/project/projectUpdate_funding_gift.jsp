<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="complete" name="sectionName"/>
</jsp:include>


<style>
/* 선물구성 */
/* 선물구성 - shown div */
div.make-project-content div#gift{
	text-align: center;
}
div.make-project-content div#gift p:nth-of-type(2){
	font-size: 13px;
	color: #616161;
}
div.make-project-content div#gift button#addGiftBtn{
	border: 2px solid #fa6462;
	background: white;
	font-weight: bold;
	font-size: 15px;
	border-radius: 5px;
	color: #fa6462;
	width: 100px;
	height: 35px;
	cursor: pointer;
}
/* 선물구성 - hidden div */
div.make-project-content div#add-gift div:first-of-type{
	padding: 0;
}
div.make-project-content div#add-gift div{
	padding: 30px 0;
}
div.make-project-content div#add-gift p{
	text-align: left!important;
}
div.make-project-content div#add-gift span{
	float: none!important;
}
div.make-project-content div#add-gift div:not(#gift-title) p:first-of-type{
	color: #616161;
	font-size: 15px;
}
/* 선물구성 - 최소후원금액 */
input#min-money::-webkit-outer-spin-button,
input#min-money::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
div#add-gift div#gift-money input#min-money{
	width: 25%;
	font-size: 15px;
}
div#add-gift div#gift-money p:last-of-type span{
	color: black;
	font-size: 15px;
}
/* 선물구성 - 아이템 */
div#add-gift div#item table{
    width: 100%;
    margin: 30px auto;
    background: white;
    font-size: 15px;
}
div#add-gift div#item table thead{
	background: #e8e8e8;
}
div#add-gift div#item table tr{
	border-bottom: 1px solid #e8e8e8;
	height: 45px;
}
div#add-gift div#item table tr:last-of-type{
	border-bottom: 0;
}
div#add-gift div#item table td{
	padding: 0 10px;
}
div#add-gift div#item table td:first-of-type{
    width: 10%;
    text-align: center;
}
div#add-gift div#item table td:last-of-type{
	width: 20%;
	text-align: center;
}
div#add-gift div#item table img{
	width: 20px;
	height: 20px;
	cursor: pointer;
}
div#add-gift div#item p:nth-of-type(3){
	text-align: right;
}
div#add-gift div#item button#addItenBtn{
    width: 20%;
    height: 45px;
    padding: 10px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: bold;
    box-sizing: border-box;
    cursor: pointer;
    border: 0;
    background: #3a6ff2;
	color: #DBDBDB;
}
div#add-gift div#item button#addItenBtn:focus{
	box-shadow: 0 0;
}
div#add-gift div#item button#addItenBtn:hover{
	background: #1859fb;
	border: 0;
}
/* 선물구성 - 선물설정 */
div#add-gift div#gift-delivery input{
	width: 15px;
}
div#add-gift div#gift-delivery label{
	color: black;
	font-size: 14px;
	position: relative;
	top: -11px;
	margin-right: 30px;
}
/* 선물구성 - 닫기저장 버튼 */
div#add-gift div#btnCloseSave{
    padding: 0 0 30px;
    text-align: right;
}
div#add-gift div#btnCloseSave button{
	width: 100px;
	height: 35px;
	font-size: 13px;
	font-weight: bold;
	border: 0;
	border-radius: 5px;
}
div#add-gift div#btnCloseSave button:first-of-type{
	background: #e0e1e2;
	color: #5a5a5a;
}
div#add-gift div#btnCloseSave button:first-of-type:hover{
	border: 2px solid #cacbcd;
	background: #cacbcd;
	color: #282929;
	cursor: pointer;
}
div#add-gift div#btnCloseSave button:last-of-type{
	background: #f4b4b8;
	color: #f7faff;
}
div#add-gift div#btnCloseSave button:last-of-type:hover{
	background: #fa6462;
	color: white;
	cursor: pointer;
	border: 0;
}
/* 선물리스트 */
div#checkedGift{
	padding: 0;
	min-height: 20px;
}
div#checkedGift div.giftList{
	border-bottom: 1px solid lightgray;
}
div#checkedGift div.giftList div{
	border-bottom: 0;
}
div#checkedGift div.giftList div:first-of-type{
    font-size: 18px;
    font-weight: bold;
}
div#checkedGift div.giftList div span.deleteGift{
    font-size: 13px;
    font-weight: normal;
    float: right;
    cursor: pointer;
}
div#checkedGift div.giftList div:nth-of-type(2){
	padding: 10px 0 0 25px;
}
div#checkedGift div.giftList div:nth-of-type(2) ul{
	line-height: 35px;
    list-style-type: square;
}
div#checkedGift div.giftList div:last-of-type{
    padding: 0 30px 25px 35px;
    font-size: 15px;
    color: #848484;
}
div#checkedGift div.giftList div:last-of-type span#successDelivery{
    float: right;
    color: black;
}
</style>

<script>
$(function(){
	
	/* CSS 수정 */
	$("#funding-money").parent("p").css("text-align","left");
	$("#funding-money").css("width","25%");
	$("#deadline-date").parent("p").css("text-align","left");
	$("#deadline-date").css({"width":"30%","margin-right":"10px"});
	
	
	/* 목표 금액 */
	$("#funding-money").focus(function(){
		if($(this).val() == "0"){
			$(this).val("");
		}
	});
	
	$("#funding-money").keyup(function(){
		if($(this).val() < 5000){
			
			$("#money-warning").css("display","inline");
			$(this).css("border-color","red");
			
			$(this).parent().next().children(".saveBtn").attr("disabled","disabled");
			
		} else {
			$("#money-warning").css("display","none");
			$(this).css("border-color","#ccdafc");
			$(this).parent().next().children(".saveBtn").removeAttr("disabled");
		}	
	});
	
	$("#funding-money").blur(function(){
		
		var regExp = /^[1-9][0-9]{3,}$/;
		if(!regExp.test($(this).val())){
			var change = $(this).val().replace(/^0{1,}/, "");
			$(this).val(change);
		}	
	});
	
	/* 선물 구성 - 최소 후원금액 */
	$("#min-money").keyup(function(){
		
		if($(this).val() < 1000){
			
			$("#minMoney-warning").css("display","inline");
			$(this).css("border-color","red");
			$(this).parent().next().children(".giftSaveBtn").attr("disabled","disabled");
			
		} else {
			
			$("#minMoney-warning").css("display","none");
			$(this).css("border-color","#ccdafc");
			$(this).parent().next().children(".giftSaveBtn").removeAttr("disabled");
		}
	});
	
	/* 마감일 */
	var tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate()+1);
	
	var day = tomorrow.getDate();
	var month = tomorrow.getMonth()+1;
	var year = tomorrow.getFullYear();
	
	if(day<10){
		day = "0"+day;
	}
	if(month<10){
		month = "0"+month;
	}
	
	$("#deadline-date").val(year+"-"+month+"-"+day);
	
	var fDate = new Date();
	fDate.setDate(fDate.getDate()+60);
	
	var fDay = fDate.getDate();
	var fMonth = fDate.getMonth()+1;
	var fYear = fDate.getFullYear();
	
	if(fDay<10){
		fDay = "0"+fDay;
	}
	if(fMonth<10){
		fMonth = "0"+fMonth;
	}
	
	$("#deadline-date").change(function(){
			
		var value = $(this).val() + "";
		
		var vYear = value.substring(0,4);
		var vMonth = value.substring(5,7);
		var vDay = value.substring(8,10);
		
		var val_date = new Date();
		val_date.setFullYear(vYear);
		val_date.setMonth(vMonth-1);
		val_date.setDate(vDay);
		
		if(val_date < tomorrow || val_date > fDate){
			
			$("#date-warning").text("펀딩 마감일은 내일 날짜 ( "+year+"-"+month+"-"+day+" )부터 60일 후의 날짜 ( "+fYear+"-"+fMonth+"-"+fDay+" )전 날까지 선택 가능합니다.");
			$(this).parent().next().children(".saveBtn").attr("disabled","disabled");
			
		} else {
			
			$("#date-warning").text("");
			$(this).parent().next().children(".saveBtn").removeAttr("disabled");
			
		}
		console.log(val_date);
		
	});
	
	$("#tbl_item").on("click",".checkItem",function(){
		
		if($(this).attr("src") == "${pageContext.request.contextPath }/resources/images/makeProject/checked_black.png"){
			
			$(this).parents("tr").css("background","white");
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/makeProject/checked_gray.png");
			$(this).parents("tr").find(".minusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/minus_gray.png");
			$(this).parents("tr").find(".plusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/plus_gray.png");
			$(this).parents("tr").find(".gift-number").text("0");
			$(this).parents("tr").find("#itemnumber").val("0");
			
		} else{
			
			$(this).parents("tr").css("background","#f2eeff");
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/makeProject/checked_black.png");
			$(this).parents("tr").find(".minusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/minus_black.png");
			$(this).parents("tr").find(".plusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/plus_black.png");
			$(this).parents("tr").find(".gift-number").text("1");
			$(this).parents("tr").find("#itemnumber").val("1");
		}
		
	});
	
	$("#tbl_item").on("click",".minusItem",function(){
		
		var itemNumber = parseInt($(this).siblings(".gift-number").text());
		
		if(itemNumber == 0){
			
			return;
			
		} else if(itemNumber-1 == 0){
			
			$(this).parents("tr").css("background","white");
			$(this).parents("tr").find(".checkItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/checked_gray.png");
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/makeProject/minus_gray.png");
			$(this).siblings(".plusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/plus_gray.png");
			$(this).siblings(".gift-number").text("0");
			$(this).siblings("#itemnumber").val("0");
			
		} else{

			$(this).siblings(".gift-number").text(itemNumber-1);
			$(this).siblings("#itemnumber").val(itemNumber-1);	
		}
		
	});
	
	$("#tbl_item").on("click",".plusItem",function(){
		
		var itemNumber = parseInt($(this).siblings(".gift-number").text());
		
		if(itemNumber == 0){
			
			$(this).parents("tr").css("background","#f2eeff");
			$(this).parents("tr").find(".checkItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/checked_black.png");
			$(this).siblings(".minusItem").attr("src","${pageContext.request.contextPath }/resources/images/makeProject/minus_black.png");
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/makeProject/plus_black.png");
			$(this).siblings(".gift-number").text("1");
			$(this).siblings("#itemnumber").val("1");
			
		} else {
			
			$(this).siblings(".gift-number").text(itemNumber+1);
			$(this).siblings("#itemnumber").val(itemNumber+1);
		}
		
	});
	
	$(".giftSaveBtn").click(function(){

		var projectNo = $("#projectNo").val();
		var minMoney = $("#min-money").val();
		var regExp = /^[1-9][0-9]{3,}$/;
		if(!regExp.test(minMoney)){
			minMoney = minMoney.replace(/^0{1,}/, "");
		}
		var giftExplain = $("#giftexplain").val().trim();
		var deliveryYN =$("[name=deliveryYN]:checked").val();
		var isFirst = false;
		var isValidate = true;
		
		/* 처음인지 체크 */
		if(!$(".giftList").length){
			isFirst = true;
		}
		
		/* minMoney중복체크 */
		$(".successMinMoney").each(function(){
			var text = $(this).text().replace(/,/g,"");
			if(text == minMoney){
				alert("이미 존재하는 최소 후원금액입니다.");
				isValidate = false;
			}
		});
		
		if(isValidate && (minMoney == "" || minMoney == "0")){
			
			alert("최소 후원금액을 입력해주세요");
			isValidate = false;
		}
		
		if(isValidate && minMoney < 1000){
			
			alert("최소 후원금액은 1000원 이상입니다");
			isValidate = false;
		}
		
		if(isValidate){
			$("#tbl_item").find("tbody").children("tr").first().find("td").each(function(){
				
				if($(this).text().trim() == "아이템을 만들어주세요"){
					alert("아이템을 만들어주세요");
					isValidate = false;
				}
			});
		}
		
		if(isValidate){
			
			var isSeleteItem = false;
			$("#tbl_item").find("tbody").children("tr").each(function(){
				
				if($(this).find("td").first().find("img").attr("src") == "${pageContext.request.contextPath}/resources/images/makeProject/checked_black.png"){
					isSeleteItem = true;
					console.log(isSeleteItem);
				}
			});
		
			console.log(isSeleteItem);
			if(!isSeleteItem){
				alert("아이템을 선택해주세요");
				isValidate = false;
			}
		}
		
		if(isValidate){
			var over_explain = $("#giftexplain").next(".letter-cnt").text();
			over_explain = over_explain.replace(/[0-9]/g,"");
			
			if(over_explain == "자 초과하였습니다"){
	
				alert("선물 설명을 초과 입력하셨습니다");
				isValidate = false;
			}
		}
		
		if(isValidate){
			$("#tbl_item").find("tbody").children("tr").each(function(){
				
				var itemno = $(this).find("#itemno").val();
				var itemnumber = $(this).find("#itemnumber").val();
				var itemName = $(this).find("#itemno").parent().text();
				
				if(itemnumber != 0){
					
					$.ajax({
						url : "insertGift",
						data : {isFirst : isFirst, projectNo : projectNo, minMoney : minMoney, giftexplain : giftExplain, deliveryYN : deliveryYN, itemno : itemno, itemnumber : itemnumber},			
						success : function(data){
							
							console.log(data);
							
							var check_el = "#"+minMoney;
							if($(check_el).length){
								
								$(check_el).find(".giftItemList").find("ul").append('<li>'+data.itemName+'&nbsp;( X '+data.itemnumber+' )</li>');
								
							} else {
								
								var html = '<div class="giftList" id="'+data.minMoney+'">';
								html += '<div>';
								html += '<span class="successMinMoney">'+numberWithCommas(data.minMoney)+'</span>원 이상 밀어주시는 분께';
								html += '<span class="deleteGift">삭제하기</span>';
								html += '</div>';
								html += '<div class="giftItemList">';
								html += '<ul>';
								html += '<li>'+data.itemName+'&nbsp;( X '+data.itemnumber+' )</li>';				
								html += '</ul>';
								html += '</div>';
								html += '<div class="successDeliveryYN">';
								if(data.giftexplain != null){
									html += data.giftexplain;
								}
								if(data.deliveryYN == "Y"){
									html += '<span class="choice" id="successDelivery">배송 필요</span>';
								}
								html += '</div>';
								html += '</div>';
																				
								$("#checkedGift").append(html);
							}
							
							$("#add-gift").slideUp(500);
							$("#gift").slideDown(500);
							
							
						},
						error : function(jqxhr,textStatus,errorThrown){
							console.log("ajax실패");
						}
					});
				}
			
			});
		}
	});
	
	$("#checkedGift").on("click",".deleteGift",function(){

		var projectNo = $("#projectNo").val();
		var minMoney = $(this).siblings(".successMinMoney").text();
		minMoney = minMoney.replace(/,/g,"");
		console.log(minMoney);
		
		$.ajax({
			url : "deleteGift",
			data : {projectNo : parseInt(projectNo), minMoney : parseInt(minMoney)},			
			success : function(data){
				
				var removeEl = "#"+minMoney;
				$("#checkedGift").find(removeEl).remove();
				
				
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	});
	
})
</script>

<script>
function funding_validate(){
	
	if($("#funding-money").val().trim() == "" || $("#funding-money").val().trim() == "0"){
		
		alert("모든 항목이 필수 항목입니다 \n목표 금액을 입력해주세요");
		return false;
	}
	
	if($("#funding-money").val() < 5000){
		
		alert("목표 금액은 5,000원 이상입니다");
		return false;
	}
	
	if($("#date-warning").text() != ""){
		
		alert("프로젝트 마감일은 내일부터 60일 후의 날짜 중 선택 가능합니다");
		return false;
	}
	
	if(!$("[name=calculateDueDate]").length){
		
		alert("프로젝트 마감일을 선택해주세요");
		return false;
	}
	
	if($("#checkedGift").html().trim() == ""){
		
		alert("모든 항목이 필수 항목입니다 \n선물을 추가해주세요");
		return false;
	}
	
	if($("#refund").val().trim() == ""){
	
		alert("모든 항목이 필수 항목입니다 \n환불 및 교환 정책을 입력해주세요");
		return false;
	}
	
	var over_refund = $("#refund").next(".letter-cnt").text();
	over_refund = over_refund.replace(/[0-9]/g,"");
	
	if(over_refund == "자 초과하였습니다"){
	
		alert("환불 및 교환 정책을 초과 입력하셨습니다");
		return false;
	}
	
	
	return true;
}
</script>

<style>
span.dotdotdot{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>


<form action="${pageContext.request.contextPath }/project/updateProject/story" onsubmit="return funding_validate();" method="post" >

	<input type="hidden" id="projectNo" name="projectNo" value="${projectNo }" />
	
	<!-- 펀딩 목표 설정 -->
	<div class="make-project-section">
		<p class="title">펀딩 목표 설정</p>
		<div class="make-project-content">
			
			<!-- 목표 금액 START -->
			<div class="shown">
				<p>목표 금액</p>
				<p>
					<span style="font-weight:bold;font-size:20px;color:black;">${funding.supportGoal }</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>수정하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>목표 금액</p>
				<p>
					이번 프로젝트를 통해 모으고자 하는 펀딩 목표 금액을 입력해 주세요. <br>
					마감일 자정까지 목표 금액을 100% 이상 달성하셔야만 모인 후원금이 결제됩니다. <br>
					마지막에 후원을 취소하는 후원자들을 감안해 10% 이상 초과 달성을 목표로 하시는게 안전합니다. <br>
					(목표 금액은 제작비, 선물 배송비, 진행자의 인건비, 예비 비용 등을 고려하시기 바랍니다.) <br>
					<span class="red-font" id="money-warning">** 목표 금액은 5,000원 이상입니다.</span>
				</p>
				<p>
					<input type="number" id="funding-money" name="supportGoal" value="${funding.supportGoal }" min="5000"/> 
					<span class="bold-font">원</span>
					<!-- 수수료 -->
				</p>
				<p>
					<button type="button" class="closeBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			<!-- 목표 금액 END -->
			
			<!-- 프로젝트 마감일 START -->
			<div class="shown">
				<p>프로젝트 마감일</p>
				<p>
					<span style="font-weight:bold;font-size:20px;color:black;"><fmt:parseDate var="dateString" value="${funding.deadlineDate}" pattern="yyyy-MM-dd" /></span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>수정하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>프로젝트 마감일</p>
				<p>
					펀딩이 끝나는 마감일을 정해주세요. <br />
					펀딩 마감일은 오늘로부터 60일 이내의 날짜 중에 고르실 수 있습니다. <br>
					이미 선물을 만드셨다면, 선물 실행일 중에 마감일보다 이른 날짜가 있지는 않은지 꼭 확인해주세요. <br>
					<span class="red-font" id="date-warning"></span>
				</p>
				<p>
					<input type="date" id="deadline-date" name="deadlineDate" value="${funding.deadlineDate}"/>
					<span class="bold-font">에 펀딩을 마감합니다.</span>
				</p>
				<p>
					<button type="button" class="closeBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			<!-- 프로젝트 마감일 END -->
			
		</div>
	</div>
	
	<br /><br />

	<!-- 예상 정산일 -->
	<div class="make-project-section">
		<p class="title">예상 정산일</p>
		<div class="make-project-content">
			
			<!-- 예상 정산일 START -->
			<div id="fund-duedate">
				펀딩에 성공할 경우, 마감일 다음날부터 7일간 결제가 진행됩니다.<br>
				결제 종료일로부터 추가로 7일 후인 <fmt:parseDate var="dateString" value="${funding.calculateDueDate}" pattern="yyyy년 MM월 dd일" />에 모금액이 창작자님의 계좌로 입금됩니다.
			</div>
			<!-- 예상 정산일 END -->
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 선물 구성 -->
	<div class="make-project-section">
		<p class="title">선물 구성</p>
		<div class="make-project-content">
			
			<div id="checkedGift">
				<c:forEach var="money" items="mList">
				<div class="giftList" id="${money }">
					<div>
						<span class="successMinMoney"><fmt:formatNumber>${money }</fmt:formatNumber></span>원 이상 밀어주시는 분께
						<span class="deleteGift">삭제하기</span>
					</div>
					<div class="giftItemList">
						<ul>
							<c:forEach var="gift" items="gList">
								<c:if test="${gift.minMoney eq money }">
			        				<li>${gift.itemName } (X ${gift.itemnumber })</li>
			        			</c:if>
							</c:forEach>				
						</ul>
					</div>
					<div class="successDeliveryYN">
						<c:forEach var="e" items="${explainMap }">
							<c:if test="${e.key eq money }">${e.value ne null?e.value:"" }</c:if>
						</c:forEach>
						<c:forEach var="d" items="${deliveryMap }">
							<c:if test="${d.key eq money && d.value eq 'Y'}">
								<span class="choice" id="successDelivery">배송 필요</span>
							</c:if>
						</c:forEach>
					</div>
				</div>
				</c:forEach>
			</div>
			
			<!-- 선물 추가하기 START -->
			<div class="shown" id="gift">
				<p>선물 추가하기</p>
				<p>
					<span>후원자분들에게 드릴 새로운 선물을 만듭니다.</span>
				</p>
				<p>
					<button type="button" id="addGiftBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/addGift.png" />
						추가하기
					</button>
				</p>
			</div>
			
			<div class="hidden" id="add-gift">
				<div id="gift-title">
					<p>선물 추가하기</p>
					<p>
						후원자 분들에게 드릴 선물 내용을 입력해주세요.
					</p> 
				</div>
				<div id="gift-money">
					<p>최소 후원금액</p>
					<p>
						인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다. <br />
						배송이 필요한 선물의 경우, <span class="bold-font">배송비 포함</span>된 금액으로 작성해주세요. <br />
						<span id="minMoney-warning" class="red-font" style="display:none">** 최소 후원금액은 1,000원입니다.</span>
					</p>
					<p>
						<input type="number" id="min-money" name="minMoney" value="0" min="1000" />
						<span class="bold-font">원 이상 밀어주시는 분께 드리는 선물입니다.</span>
					</p>
				</div>
				<div id="item">
					<p>선물에 포함된 아이템</p>
					<p>
						아이템은 <span class="bold-font">선물에 포함되는 구성 품목</span>을 말합니다. <br />
						이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을 전달하실지 선택해주세요.
					</p>
					<table id="tbl_item">
						<thead>
							<tr>
								<td>포함</td>
								<td>아이템 이름</td>
								<td>수량 설정</td>
							</tr>
						</thead>
						<tbody>
														
							<c:forEach var="item" items="${iList }">
								<tr>
									<td>
										<img src="${pageContext.request.contextPath }/resources/images/makeProject/checked_gray.png" class="checkItem"/>
									</td>
									<td>
										<input type="hidden" id="itemno" name="itemno" value="${item.itemNo }"/>
										${item.itemName }
									</td>
									<td>
										<img src="${pageContext.request.contextPath }/resources/images/makeProject/minus_gray.png" class="minusItem" />
										&nbsp;&nbsp;
										<span class="gift-number">0</span>
										<input type="hidden" id="itemnumber" name="itemnumber" value="0"/>
										&nbsp;&nbsp;
										<img src="${pageContext.request.contextPath }/resources/images/makeProject/plus_gray.png" class="plusItem" />
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<p>
						<button type="button" id="addItenBtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/addItem.png" />
							아이템 만들기
						</button>
						<jsp:include page="/WEB-INF/views/project/projectMake_item.jsp" />
					</p>
				</div>
				<div id="gift-explain">
					<p>
						선물 설명
						<span class="choice">선택 항목</span>
					</p>
					<p>
						구성된 선물에 대해 추가적으로 알리고 싶은 내용을 적어주세요.
					</p>
					<p>
						<input type="text" id="gift-explain" name="giftexplain" placeholder="예) 배송비 포함, &lt선물세트A> 등" />
						<span class="letter-cnt"><span class="total-letter">50</span>자 남았습니다</span>
					</p>
				</div>
				<div id="gift-delivery">
					<p>선물 설정</p>
					<p>
						배송이 필요한 선물인 경우 후원자에게 주소지를 요청합니다.
					</p>
					<p style="position: relative">
						<input type="radio" name="deliveryYN" id="giftDeliveryYES" value="Y" checked/>
						<label for="giftDeliveryYES">배송이 필요한 선물입니다</label>
						<input type="radio" name="deliveryYN" id="giftDeliveryNO" value="N"/>
						<label for="giftDeliveryNO">배송이 필요하지 않은 선물입니다</label>
					</p>
				</div>
				<div id="btnCloseSave">
					<button type="button" class="giftCloseBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="giftSaveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</div>
			</div>
			<!-- 선물 추가하기 END -->
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 정책 설정 -->
	<div class="make-project-section">
		<p class="title">정책 설정</p>
		<div class="make-project-content">
			
			<!-- 환불 및 교환 정책 START -->
			<div class="shown">
				<p>환불 및 교환 정책</p>
				<p>
					<span class="dotdotdot" style="font-weight:bold;font-size:20px;color:black;">${funding.refund }</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</P>
			</div>
			<div class="hidden">
				<p>환불 및 교환 정책</p>
				<p>
					마감일 다음날 결제가 일괄 진행되며 결제된 금액은 자동으로 진행자에게 전달되므로, 그후의 환불 및  교환 요청은 전적으로 진행자가 약속하는 정책을 따릅니다. <br />
					이 프로젝트에 꼭 맞는 환불 및 교환 정책을 신중하게 작성해주세요.
				</p>
				<p>
					<textarea name="refund" id="refund" cols="30" rows="10" placeholder="환불 및 교환 정책을 입력해주세요">${funding.refund }</textarea>
					<span class="letter-cnt"><span class="total-letter">1000</span>자 남았습니다</span>
				</p>
				<p>
					<button type="button" class="closeBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						닫기
					</button>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			<!-- 환불 및 교환 정책 END -->
			
		</div>
	</div>

<jsp:include page="/WEB-INF/views/project/projectMake_footer.jsp" >
	<jsp:param value="funding-gift" name="sectionName"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />