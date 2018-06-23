<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<style>
div.index-project{
    margin-top: 50px;
    text-align: center;
}
div.index-project p.title{
	font-size: 1.5em;
	font-family: 'Do Hyeon', sans-serif;	
}
div.project{
	width: 240px;
	border: 1.5px solid #eaeaea;
	border-radius: 3px;
	overflow: hidden;
	display: inline-block;
	margin: 0 10px;
	text-align: left;
}
div.project:hover{
	position: relative;
    top: -3px;
    left: -3px;
    box-shadow: 5px 5px 15px lightgrey;
    cursor: pointer;
}
div.project img{
	width: 240px;
	height: 180px;
}
div.project div.project-img{
	background: lightgray;
	width: 240px;
	height: 180px;
	text-align: center;
}
div.project div.project-img img{
	width: 100px;
	height: 100px;
    margin-top: 40px;
}
div.project div.summary{
	height: 150px;
	padding: 15px;
	box-sizing: border-box;
	position: relative;
}
div.project div.summary p:first-of-type{
	font-weight: bold;
}
div.project div.summary p:last-of-type{
    font-size: 11px;
    margin-top: -10px;
}
div.project div.summary div.progress{
    width: 95%;
    height: 5%;    
    position: absolute;
    bottom: 45px;
    left: 2.5%;
}
div.project div.summary div.days {
	display: inline-block;
	float: left;
	font-size: 11px;
    position: absolute;
    bottom: 13px;
}
div.project div.summary div.days img{
    width: 15px;
    height: 15px;
    margin-top: -3px;
}
div.project div.summary div.support{
	display: inline-block;
	float: right;
	font-size: 11px;
    position: absolute;
    bottom: 13px;
    right: 10px;
}
div.project div.summary div.support img{
    width: 15px;
    height: 15px;
    margin-top: -3px;
}
div.project div.summary span.no-project{
	font-weight: normal;
    margin-top: 0;
	font-size: 13px;
	color: red;
	
}
div#all{text-align: center;}
@media (max-width: 1070px){
	div.project{
		width: 200px;
	}
	div.project img{
		width: 200px;
		height: 140px;
	}
	div.project div.project-img{
		width: 200px;
		height: 140px;
	}
	div.project div.project-img img{
		width: 80px;
		height: 80px;
		margin-top: 30px;
	}
	div.project div.summary{
		padding: 8px;
	}
	div.project div.summary div.progress{
	    width: 95%;
	    height: 3%;
        bottom: 38px;
	}
}
@media (max-width: 2070px){
	div#index-container{text-align: center;width: 80%; display: inline-block;}
	div.maincontainer{text-align: center; padding: 80px;}
	div.maincontainer2{text-align: left; padding: 7px 10px 7px 16.1%;}
}
@media (max-width: 500px){
	div.maincontainer{padding:70px 70px 70px 50px; width:360px; height: 210px; text-align: center;}
	h1{font-size: 30px;}
	div.maincontainer2{text-align: left; padding: 10%;}
	div#index-container{text-align: center;width: 100%;}
}

select#select {
  width: 130px;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid white;
  border-radius: 0px;
}
</style>
    <!-- 프로젝트 -->
    <hr />
    <div class="maincontainer">
        <h1>
        <c:if test="${empty categoryCode }">
        	모든프로젝트
        </c:if>
        <c:if test="${categoryCode eq 'C1' }">
        	게임
        </c:if>
        <c:if test="${categoryCode eq 'C2' }">
        	푸드
        </c:if>
        <c:if test="${categoryCode eq 'C3' }">
        	예술
        </c:if>
        <c:if test="${categoryCode eq 'C4' }">
        	패션
        </c:if>
        <c:if test="${categoryCode eq 'C5' }">
        	출판
        </c:if>
        <c:if test="${categoryCode eq 'C6' }">
        	테크놀리지
        </c:if>
       	
        </h1>
    </div>
    <hr />
    <div class="maincontainer2">
        <div id="selectList">
        <select name="" id="select">
            <option value="">최다 후원순</option>
            <option value="">최다 금액순</option>
            <option value="">마감 임박순</option>
            <option value="">최신순</option>
        </select>
        </div>
    </div>
    <hr />
    <div id="all">
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
	