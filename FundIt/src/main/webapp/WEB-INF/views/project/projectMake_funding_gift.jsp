<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<form action="">
<div class="make-project-contents">

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
					<span class="red-font">** 목표 금액은 5,000원 이상입니다.</span>
				</p>
				<p>
					<input type="number" id="funding-money" name="fundingMoney" value="0" /> 
					<span class="bold-font">원</span>
					<!-- 수수료 -->
				</p>
				<p>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						취소하기
					</button>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장하기
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
					<span class="red-font">
						** 펀딩 마감일은 오늘로부터 60일 이내의 날짜 중에 고르실 수 있습니다. <br>
						** 이미 선물을 만드셨다면, 선물 실행일 중에 마감일보다 이른 날짜가 있지는 않은지 꼭 확인해주세요.
					</span>
				</p>
				<p>
					<span class="bold-font">오늘로부터 </span>
					<input type="number" id="deadline-day" name="deadlineDay" />
					<span class="bold-font">일 뒤인 </span>
					<input type="date" id="deadline-date" name="deadlineDate" />
					<span class="bold-font">에 펀딩을 마감합니다.</span>
				</p>
				<p>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						취소하기
					</button>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장하기
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
			<div class="fund-duedate">
				<p>예상 정산일</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 요약을 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</p>
			</div>
			<!-- 예상 정산일 END -->
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 선물 구성 -->
	<div class="make-project-section">
		<p class="title">선물 구성</p>
		<div class="make-project-content">
			
			<!-- 선물 추가하기 START -->
			<div class="shown gift">
				<p>선물 추가하기</p>
				<p>
					<span>후원자분들에게 드릴 새로운 선물을 만듭니다.</span>
				</p>
				<p>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						추가하기
					</button>
				</p>
			</div>
			
			<div class="hidden gift-hidden">
				<p>선물 추가하기</p>
				<p>
					후원자 분들에게 드릴 선물 내용을 입력해주세요.
				</p> 
				<hr />
				<p>
					<span class="bold-font gray-font">최소 후원금액</span> <br/>
					인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다. <br />
					배송이 필요한 선물의 경우, <span class="bold-font">배송비 포함</span>된 금액으로 작성해주세요.
				</p>
				<p>
					<input type="number" id="min-money" name="minMoney" value="0" />
					<span class="bold-font">원 이상 밀어주시는 분께 드리는 선물입니다.</span>
				</p>
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
					<br /><span class="letter-cnt">1000자 남았습니다</span>
				</p>
				<p>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
						취소하기
					</button>
					<button type="button">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장하기
					</button>
				</p>
			</div>
			<!-- 환불 및 교환 정책 END -->
			
		</div>
	</div>
</div>
</form>