<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />
<style>
#allProjects{
	width: 80%;
}

#indexUpdate1{
	margin-bottom: 10px;
	
}
</style>
<script>
	$(function(){
		$(".project").click(function(){
			var projectNo = $(this).children("#projectNo").val();
			console.log(projectNo);
			location.href="${pageContext.request.contextPath}/admin/projectDeadlineView.do?projectNo="+projectNo;
		});
	});
</script>
<div class="index-project">
		<div class="title">
			&nbsp;&nbsp;&nbsp;&nbsp;마감 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<div class="project-group" id="allProjects">
			<c:if test="${not empty list }">
				<c:forEach var="project" items="${list }">
					<div class="project" >
					<input type="hidden" value="${project.projectNo}" id="projectNo" />
						<img src="${pageContext.request.contextPath }/resources/images/projects/${project.projectImage }" >
						<div class="summary">
							<p>${project.projectTitle }</p>
							<p>${project.name}</p>
							<div class="progress">
 								<div class="progress-bar bg-danger"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:${project.supportPercent}%" ></div>
							</div>
							<br />
							<div class="days">
								<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>
								&nbsp;${project.deadlineDay }일 남음
							</div>
							<div class="support">
								<img src="${pageContext.request.contextPath }/resources/images/money.png"/>
								&nbsp; <fmt:formatNumber value="${project.supportMoney}" pattern="#,###"/> &nbsp;(${project.supportPercent }%)
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>	
		</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />