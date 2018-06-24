<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-make-project.css" />

<script>
$(function(){
	
	$(".hiddenInput").parent().css("text-align","left");
	
	$(".uploadBtn").click(function(){
		$(this).next("input[type=file]").click();
	});
	
	$(".make-project-content div.shown").on("click",function(){
		$(".make-project-content").children(".shown").slideDown(500);
		$(".make-project-content").children(".hidden").slideUp(500);
		$(this).slideUp(500);	
		$(this).next(".hidden").slideDown(500);
		
	});
})
</script>

<script>
function previewImage(fileObj, imgPreviewId) {
    var allowExtention = ".jpg,.bmp,.gif,.png";  //allowed to upload file type
    /* document.getElementById("hfAllowPicSuffix").value; */
    var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
    var browserVersion = window.navigator.userAgent.toUpperCase();
    if (allowExtention.indexOf(extention) > -1) {
        if (fileObj.files) {
            if (window.FileReader) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
                };
                reader.readAsDataURL(fileObj.files[0]);
            } else if (browserVersion.indexOf("SAFARI") > -1) {
                alert("don't support  Safari6.0 below broswer");
            }
        } else if (browserVersion.indexOf("MSIE") > -1) {
            if (browserVersion.indexOf("MSIE 6") > -1) {//ie6
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
            } else {//ie[7-9]
                fileObj.select();
                fileObj.blur(); 
                var newPreview = document.getElementById(imgPreviewId);

                newPreview.style.border = "solid 1px #eeeeee";
                newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                newPreview.style.display = "block";

            }
        } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
            var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
            if (firefoxVersion < 7) {//firefox7 below
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());
            } else {//firefox7.0+ 
                document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));
            }
        } else {
            document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
        }
    } else {
        alert("only support" + allowExtention + "suffix");
        fileObj.value = ""; //clear Selected file
        if (browserVersion.indexOf("MSIE") > -1) {
            fileObj.select();
            document.selection.clear();
        }

    }
    var css = "width:250px;height:250px;display:auto;";
    document.getElementById(imgPreviewId).setAttribute("style",css);
}
</script>

<div id="make-project">
	
	<div class="make-project-notice">
		<div class="alert alert-primary" role="alert">
		  펀딩 준비에 앞서 
		  공개 검토 가이드라인, 
		  펀드잇 커뮤니티 운영원칙
		  을 확인해주세요.
		</div>
		<div class="alert alert-secondary" role="alert">
		  프로젝트를 개설하려면 네 개의 섹션을 완성해야 합니다. 해당 섹션을 완성해야 다음 섹션으로 넘어갈 수 있습니다.
		</div>
		<div class="alert alert-secondary" role="alert">
		  완성된 섹션은 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" /> 
		  탭 아이콘에 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" /> 
		  파랗게 체크가 됩니다.
		</div>
	</div>
	
	<div class="make-project-btn">
		<button type="button">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/binoculars.png" />
			미리보기
		</button>
		<button type="button">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/paper-plane.png" />
			검토 요청하기
		</button>
	</div>
	
	<div class="make-project-title">
	
		<c:if test="${param.sectionName eq 'outline' }">
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'funding-gift' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'story' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'account' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				스토리텔링
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
	</div>
	
	
	<div class="make-project-contents">
	
		
	
