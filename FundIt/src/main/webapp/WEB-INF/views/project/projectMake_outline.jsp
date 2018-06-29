<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="outline" name="sectionName"/>
</jsp:include>


<form action="${pageContext.request.contextPath }/project/makeProject/funding-gift" onsubmit="return project_validate('#outline');" method="post" >

	<input type="hidden" name="email" value="${memberLoggedIn.email }" />
	<input type="hidden" name="phone" value="${profile.phone }" />
	
	<!-- 프로젝트 개요 -->
	<div class="make-project-section">
		<p class="title">프로젝트 개요</p>
		<div class="make-project-content">
			
			<!-- 프로젝트 제목 START -->
			<div class="shown">
				<p>프로젝트 제목</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 제목을 입력해 주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>프로젝트 제목</p>
				<p>
					프로젝트에 멋진 제목을 붙여주세요. <br>
					감정에 호소하는 제목보다는 만드시려는 창작물, 작품명, 혹은 프로젝트의 주제가 드러나게 써주시는 것이 좋습니다.
				</p>
				<p>
					<input type="text" id="project-title" name="projectTitle" placeholder="프로젝트 제목을 입력해주세요" />
					<span class="letter-cnt"><span class="total-letter">25</span>자 남았습니다</span>
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
			<!-- 프로젝트 제목 END -->
			
			<!-- 프로젝트 대표 이미지 START -->
			<div class="shown">
				<p>프로젝트 대표 이미지</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 대표 이미지를 등록해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>업로드하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>프로젝트 대표 이미지</p>
				<p>
					프로젝트를 대표할 이미지입니다. <br />
					후원자들이 한 번에 무슨 프로젝트인지 알 수 있도록 프로젝트의 선물 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋습니다.
				</p>
				<p>
					<button type="button" class="uploadBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/upload.png" />
						이미지 선택하기
					</button>
					<input type="file" class="hiddenInput" id="project-image" name="projectImage" onchange="previewImage(this,'projectImgPreview');" accept="image/*" />
					<img src="" id="projectImgPreview" class="uploadImg" style="width: 250px;height: 250px;display:none;"/>
				</p>
				<p>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			<!-- 프로젝트 대표 이미지 END -->
			
			<!-- 프로젝트 요약 START -->
			<div class="shown">
				<p>프로젝트 요약</p>
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
			<div class="hidden">
				<p>프로젝트 요약</p>
				<p>
					후원자 분들에게 본 프로젝트를 간략하게 소개해 주세요.
				</p>
				<p>
					<textarea name="projectSummary" id="projectSummary" cols="30" rows="5"></textarea>
					<span class="letter-cnt"><span class="total-letter">50</span>자 남았습니다</span>
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
			<!-- 프로젝트 요약 END -->
			
			<!-- 프로젝트 카테고리 START -->
			<div class="shown">
				<p>프로젝트 카테고리</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 카테고리를 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>프로젝트 카테고리</p>
				<p>
					프로젝트의 성격에 맞는 카테고리를 선택해 주세요. <br />
					(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 후원자가 해당 프로젝트를 찾기 어려워지기에 에디터에 의해 조정될 수 있습니다.)
				</p>
				<p>
					<select name="categoryCode" id="category">
						<option selected disabled value="">프로젝트 카테고리를 정해주세요</option>
						<option value="C1">게임</option>
						<option value="C2">푸드</option>
						<option value="C3">예술</option>
						<option value="C4">패션</option>
						<option value="C5">출판</option>
						<option value="C6">테크놀리지</option>
					</select>
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
			<!-- 프로젝트 카테고리 END -->
			
		</div>
	</div>
	
	<br /><br />
	
	<!-- 진행자 정보 -->
	<div class="make-project-section">
		<p class="title">진행자 정보</p>
		<div class="make-project-content">
			
			<div class="shown">
				<p>프로필 이미지</p>
				<p>
					<c:if test="${profile.profileImage eq null}">
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
							&nbsp;&nbsp;
							진행자님의 프로필 이미지를 올려주세요
						</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>업로드하기</span>
						</span>
					</c:if>
						
					<c:if test="${profile.profileImage ne null}">
						<span>
							 <img src="${pageContext.request.contextPath }/resources/upload/profileImg/${profile.profileImage }" class="profileImg rounded-circle" style="width: 250px;height: 250px;" />
						</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>수정하기</span>
						</span>
					</c:if>
				</p>
			</div>
			<div class="hidden">
				<p>프로필 이미지</p>
				<p>
					진행자님 개인이나 팀의 사진을 올려주세요. <br />
					얼굴이 나온 사진을 넣으면 프로젝트의 신뢰성 향상에 도움이 됩니다.
				</p>
				<p>
					<button type="button" class="uploadBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/upload.png" />
						이미지 선택하기
					</button>
					<input type="file" class="hiddenInput" id="profile-image" name="profileImage" onchange="previewImage(this,'profileImgPreview');" accept="image/*" />
					<img src="" id="profileImgPreview" class="uploadImg rounded-circle" style="width: 250px;height: 250px;display:none;"/>
				</p>
				<p>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
			
			<div class="shown">
				<p>진행자 이름</p>
				<p>
					<span style="font-weight:bold;font-size:20px;color:black;">
						${memberLoggedIn.name }
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>수정하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>진행자 이름</p>
				<p>
					진행자님을 대표할 수 있는 이름을 써 주세요. <br />
					팀으로 진행하신다면 팀 이름을 쓰셔도 됩니다.
				</p>
				<p>
					<input type="text" id="profile-name" name="profileName" placeholder="이름을 입력해주세요" />
					<span class="letter-cnt"><span class="total-letter">10</span>자 남았습니다</span>
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
			
			<div class="shown">
				<p>진행자 소개</p>
				<p>
					<c:if test="${profile.profileIntroduce eq null}">
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
							&nbsp;&nbsp;
							진행자 소개를 입력해주세요
						</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>입력하기</span>
						</span>
					</c:if>
					
					<c:if test="${profile.profileIntroduce ne null}">
						<span style="font-weight:bold;font-size:20px;color:black;">${profile.profileIntroduce }</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>수정하기</span>
						</span>
					</c:if>
				</p>
			</div>
			<div class="hidden">
				<p>진행자 소개</p>
				<p>
					진행자님의 이력과 간단한 소개를 써 주세요. <br />
					2~3문장으로 간략하게 어떤 작업을 위주로 활동해 온 창작자인지 알려주시면 좋습니다.
				</p>
				<p>
					<textarea name="profileIntroduce" id="profileIntroduce" cols="30" rows="10"></textarea>
					<span class="letter-cnt"><span class="total-letter">100</span>자 남았습니다</span>
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
			
			<div class="shown">
				<p>진행자 황동 지역</p>
				<p>
					<c:if test="${profile.localName eq null}">
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
							&nbsp;&nbsp;
							진행자 활동 지역을 입력해주세요
						</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>입력하기</span>
						</span>
					</c:if>
					
					<c:if test="${profile.localName ne null}">
						<span style="font-weight:bold;font-size:20px;color:black;">${profile.localName }</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
							&nbsp;
							<span>수정하기</span>
						</span>
					</c:if>
				</p>
			</div>
			<div class="hidden">
				<p>진행자 활동 지역</p>
				<p>
					진행자님은 주로 어느 지역에서 활동하시는지 입력해 주세요. <br />
					활동 지역을 구체적으로 기입해주시면  프로젝트의 신뢰를 높이는데 도움이 됩니다.
				</p>
				<p>
					<select name="localCode" id="local">
						<option selected disabled value="">활동 지역을 정해주세요</option>
						<option value="L1">서울</option>
						<option value="L2">부산</option>
						<option value="L3">대구</option>
						<option value="L4">인천</option>
						<option value="L5">광주</option>
						<option value="L6">대전</option>
						<option value="L7">울산</option>
						<option value="L8">경기</option>
						<option value="L9">강원</option>
						<option value="L10">충북</option>
						<option value="L11">충남</option>
						<option value="L12">전북</option>
						<option value="L13">전남</option>
						<option value="L14">경북</option>
						<option value="L15">경남</option>
						<option value="L16">제주</option>
					</select>
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
			
		</div>
	</div>


<jsp:include page="/WEB-INF/views/project/projectMake_footer.jsp" >
	<jsp:param value="outline" name="sectionName"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />