<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/project/projectMake_header.jsp" >
	<jsp:param value="story" name="sectionName"/>
</jsp:include>


<!-- include libraries(jQuery, bootstrap) -->
<!-- bootstrap + jquery -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<!-- <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script> -->

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>






<script>
$(document).ready(function(){
	
	$("#summernote").summernote({
		height: 300,
		focus: true,
		codemirror: {
			theme: 'monokai'
		}
	});
	
	$("#summernote").next("div").css({"border":"2px solid #ccdafc","padding":"0"});
	$("#summernote").next("div").find("div").each(function(){
		$(this).css({"text-align":"left"});
	});
	
});
</script>

<form action="${pageContext.request.contextPath }/project/makeProject/account" onsubmit="return project_validate('#story');" method="post" >
	
	<input type="hidden" name="projectNo" value="${projectNo }" />
		
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
				<div id="story" style="display:none;color:#000;"></div>
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
			<div class="hidden" id="story-hidden">
				<p>프로젝트 스토리</p>
				<p>
					프로젝트 스토리 잘 작성하기를 읽어보시고 스토리텔링에 필요한 요소들을 확인하여 작성해주세요.
				</p>
				<p>
					<!-- 에디터 API -->
					<%-- <jsp:include page="/WEB-INF/views/project/projectMake_editor.jsp" /> --%>
					<textarea name="projectStory" id="summernote" value=""></textarea>
				</p>
				<p style="text-align:right">
					<button type="button" class="saveBtn">
						<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
						저장
					</button>
				</p>
			</div>
		</div>
	</div>

<style>
div.note-editor div.note-toolbar{
	background: #f0f5ff;
}
div.note-editor div.note-statusbar, div.note-editor div.note-toolbar-wrapper{
	background: #f0f5ff!important;
	padding: 0px;
}
div.note-editor div.note-statusbar div{
	padding: 0px;
} 
div.note-editor div.note-toolbar div{
	padding:0px;
	border-bottom:0px; 
}
div.note-editor div.note-editing-area, 
div.note-editor div.note-editing-area div{
	padding: 0px;
	border-bottom: 0px;
} 
div.note-editor div.note-editing-area div.note-editable, div.note-editor div.note-editing-area div.CodeMirror-code{
    padding: 10px;
}
div.note-editor div.note-editing-area p{
   	color: #000!important;
   	font-size: 1rem!important;
   	font-weight: normal!important;
}
div.note-editor div.note-editing-area p span{
	float: none!important;
}
div.note-editor div.modal div.modal-header{
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
div.note-editor div.modal div.modal-footer{
    padding: 15px;
    text-align: right;
    border-top: 1px solid #e5e5e5;
}
div.note-editor div.modal div.modal-body{
	padding: 15px;
	overflow: auto!important;
}
div.note-editor div.modal div.modal-body div{
	border-bottom: 0px;
}
    
</style>

<jsp:include page="/WEB-INF/views/project/projectMake_footer.jsp" >
	<jsp:param value="story" name="sectionName"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />