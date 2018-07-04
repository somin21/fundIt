<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="funding-gift" name="sectionName"/>
</jsp:include>

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
		
		var year = value.substring(0,4);
		var month = value.substring(5,7);
		var day = value.substring(8,10);
		
		var val_date = new Date();
		val_date.setFullYear(year);
		val_date.setMonth(month-1);
		val_date.setDate(day);
		
		if(val_date < tomorrow || val_date > fDate){
			
			$("#date-warning").text("펀딩 마감일은 내일 날짜 ( "+year+"-"+month+"-"+day+" )부터 60일 후의 날짜 ( "+fYear+"-"+fMonth+"-"+fDay+" )까지 선택 가능합니다.");
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
		var giftExplain = $("#gift-explain").val();
		var deliveryYN =$("[name=deliveryYN]:checked").val();
		var isFirst = false;
		
		/* 처음인지 체크 */
		if(!$(".giftList").length){
			isFirst = true;
		}
		
		/* minMoney체크 */
		if(isFirst == false){
			$(".successMinMoney").each(function(){
				var text = $(this).text().replace(/,/g,"");
				if(text == minMoney){
					alert("이미 존재하는 최소 후원금액입니다.");
					$("#min-money").focus();
					return;
				}
			});
		}
		
		$("#tbl_item").find("tbody").children("tr").each(function(){
			
			var itemno = $(this).find("#itemno").val();
			var itemnumber = $(this).find("#itemnumber").val();
			var itemName = $(this).find("#itemno").parent().text();
			
			if(itemnumber != 0){
				
				$.ajax({
					url : "insertGift",
					data : {isFirst : isFirst, projectNo : projectNo, minMoney : minMoney, giftexplain : giftExplain, deliveryYN : deliveryYN, itemno : itemno, itemnumber : itemnumber},			
					success : function(data){
						
						var check_el = "#"+minMoney;
						if($(check_el).length){
							
							console.log("이미만들엇다");
							console.log($(check_el));
							$(check_el).find(".giftItemList").find("ul").append('<li>'+data.itemName+'&nbsp;( X '+data.itemnumber+' )</li>');
							
						} else {
							
							console.log("안만들엇다");
							console.log($(check_el));
							var html = '<div class="giftList" id="'+data.minMoney+'">';
							html += '<div>';
							html += '<span class="successMinMoney">'+data.minMoney+'</span>원 이상 밀어주시는 분께';
							html += '<span class="deleteGift">삭제하기</span>';
							html += '</div>';
							html += '<div class="giftItemList">';
							html += '<ul>';
							html += '<li>'+data.itemName+'&nbsp;( X '+data.itemnumber+' )</li>';				
							html += '</ul>';
							html += '</div>';
							html += '<div class="successDeliveryYN">';
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
	});
	
	$(".deleteGift").click(function(){

		var projectNo = $("#projectNo").val();
		var minMoney = $(this).siblings(".successMinMoney").text();
		
		$.ajax({
			url : "deleteGift",
			data : {projectNo : projectNo, minMoney : minMoney},			
			success : function(data){
				
				$(this).parents(".giftList").remove();
				
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	});
	
})
</script>


<form action="${pageContext.request.contextPath }/project/makeProject/story" onsubmit="return project_validate('#funding-gift');" method="post" >

	<input type="hidden" id="projectNo" name="projectNo" value="${projectNo }" />
	
	<!-- 펀딩 목표 설정 -->
	<div class="make-project-section">
		<p class="title">펀딩 목표 설정</p>
		<div class="make-project-content">
			
			<!-- 목표 금액 START -->
			<div class="shown">
				<p>목표 금액</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						목표 금액을 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
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
					<input type="number" id="funding-money" name="supportGoal" value="0" min="5000"/> 
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
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 마감일을 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
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
					<input type="date" id="deadline-date" name="deadlineDate" />
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
				프로젝트 마감일을 선택하시면, 예상 정산일이 표시됩니다.				
			</div>
			<!-- 예상 정산일 END -->
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 선물 구성 -->
	<div class="make-project-section">
		<p class="title">선물 구성</p>
		<div class="make-project-content">
			<div id="checkedGift"></div>
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
							<tr>
								<td>
									<img src="${pageContext.request.contextPath }/resources/images/makeProject/checked_gray.png" />
								</td>
								<td>아이템을 만들어주세요</td>
								<td>
									<img src="${pageContext.request.contextPath }/resources/images/makeProject/minus_gray.png" />
									&nbsp;&nbsp;
									<span class="gift-number">0</span>
									&nbsp;&nbsp;
									<img src="${pageContext.request.contextPath }/resources/images/makeProject/plus_gray.png" />
								</td>
							</tr>
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
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						환불 및 교환 정책을 입력해주세요
					</span>
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
					<textarea name="refund" id="refund" cols="30" rows="10" placeholder="환불 및 교환 정책을 입력해주세요"></textarea>
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