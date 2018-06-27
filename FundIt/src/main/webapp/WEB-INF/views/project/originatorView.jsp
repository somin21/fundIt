<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
div.maincontainer{text-align: center; padding: 80px; margin: auto 0px; background: #ebeae5;}
img.imgMain{border-radius: 100%; width: 120px; height: 100px; box-shadow: 0px 0px 1px 10px white;}
a{text-decoration:none;}
div.mainProjectDIV{ padding: 20px; text-align: center; }
div.mainProjectDIV2{ padding: 20px; text-align: left; width: 1100px; display: inline-block;}
div.projectDIV{border: 1px solid #dcdcdc; height: 500px; width: 218px; border-radius: 20px; display: inline-block; text-align: center;}
div.a{display: inline-block;}
div.a2{display: inline-block;}
div.aaa{display: inline-block; padding:10px;}
span.id{font-weight: bold; font-size: 30px;}
span#sp{font-size: 17px; font-weight: bold;}
span#sp1{font-size: 17px; font-weight: bold; color:red;}

</style>

<div class="maincontainer">
        <br>
        <img class="imgMain" src="${pageContext.request.contextPath }/resources/upload/profileImg/${p.profileImage != null? p.profileImage: 'profile.png'}" alt="메인사진">
        <br><br />
        <div class="g" >
            <span class="id"> ${p.email }</span>
        </div>
        <div class="tagDIV">
            <span class="b">
                <i style="font-size:24px" class="fa">&#xf02c;</i>
                ${category } 분야 크리에이터
            </span>
            <pre style="display: inline-block;">  </pre>
            <span class="b3">
                <i style="font-size:24px" class="fa">&#xf194;</i>
                후원몇개
            </span>
        </div>
    </div>
    <div class="mainProjectDIV">
        <div class="mainProjectDIV2">
            <div class="aaa">
                <span id="sp">만든 프로젝트 <span id="sp1">${rowNum }</span> 개</span>
            </div>
            <div id="index-container">
		<!-- 프로젝트 리스트 -->
		<c:if test="${not empty list }">
		<c:forEach var="i" items="${ list}">
		
			<div class="project">
			<input type="hidden" value="${i.projectNo }" id="projectNo"/>
				<img src="${pageContext.request.contextPath }/resources/images/projects/${i.projectImage}" />
				<div class="summary">
					<p>${i.projectTitle }</p>
					<p>${i.name }</p>
					<div class="progress">
						<div class="progress-bar bg-danger" role="progressbar" style="width:${i.supportPercent }%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<br />
					<div class="days">
						<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>
						${i.deadlineDay }일 남음
					</div>
					<div class="support">
						<img src="${pageContext.request.contextPath }/resources/images/money.png"/>
						<fmt:formatNumber>${i.supportMoney }</fmt:formatNumber>
						(${i.supportPercent }%)
					</div>
				</div>
			</div>
		</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<h1>아직 프로젝트가 등록되지 않았습니다~~~~ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</h1>
		</c:if>
		</div>
            
            
            
        </div>
    </div>
<script>
	$(function(){
		$(".project").click(function(){
			var projectNo = $(this).children("#projectNo").val();
			console.log(projectNo);
			location.href="${pageContext.request.contextPath}/project/projectView.do?projectNo="+projectNo;
		});
	});
</script>	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	