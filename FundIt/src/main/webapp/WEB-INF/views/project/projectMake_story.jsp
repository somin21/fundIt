<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="story" name="sectionName"/>
</jsp:include>


<form action="${pageContext.request.contextPath }/project/makeProject/account" onsubmit="return project_validate('#story');" method="post" >
	
	<!-- 프로젝트 소개 영상 -->
	<div class="make-project-section">
		<p class="title">프로젝트 소개 영상</p>
		<div class="make-project-content">
			
			<div class="shown">
				<p>
					프로젝트 소개 영상
					<span class="choice">선택 항목</span>
				</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 소개 영상을 등록해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>등록하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>
					프로젝트 소개 영상
					<span class="choice">선택 항목</span>	
				</p>
				<p>
					프로젝트를 소개하는 영상을 만들면 내용을 더 효과적으로 알릴 수 있습니다. <br />
					2~3분 이내의 짧은 영상이 가장 반응이 좋습니다. <br />
					배경음악을 사용하신다면 저작권 문제에 유념해주세요.
				</p>
				<p>
					<button type="button" class="uploadBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/upload.png" />
						영상 선택하기
					</button>
					<input type="file" class="hiddenInput" id="project-movie" name="projectMovie" accept="video/*" />
				</p>
				<p>
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
		</div>
	</div>
	
	<br /><br />
	
	<!-- 프로젝트 스토리 -->
	<div class="make-project-section">
		<p class="title">프로젝트 스토리</p>
		<div class="make-project-content">
			
			<div class="shown">
				<p>프로젝트 스토리</p>
				<p>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/hand_pointer.png" />
						&nbsp;&nbsp;
						프로젝트 스토리를 입력해주세요
					</span>
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />
						&nbsp;
						<span>입력하기</span>
					</span>
				</p>
			</div>
			<div class="hidden">
				<p>프로젝트 스토리</p>
				<p>
					프로젝트 스토리 잘 작성하기를 읽어보시고 스토리텔링에 필요한 요소들을 확인하여 작성해주세요.
				</p>
				<p>
					<!-- 에디터 API -->
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
	<jsp:param value="story" name="sectionName"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />