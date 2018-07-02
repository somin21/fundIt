<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />

<style>
#allProjects{
	border: 1px solid red;
	width: 80%;
}

#indexUpdate1{
	margin-bottom: 10px;
	
}
</style>
<script>
var noArray = new Array();
var i = 0;
var no = "";
function check(x){
		if(i>=4){
			alert("4개를 모두 선택하셨습니다.");
			return;
		}
		noArray[i] = x;
		i++;
		no=noArray.join(",");
}
function validate(){
	
	console.log(no);
	
	if(i<4){
		alert(i+"개를 선택하셨습니다."+"\n"+"처음부터 다시 선택하여 주세요."+"\n"+"4개 모두 선택하셔야 합니다.");
		return;
	}
	location.href="${pageContext.request.contextPath}/admin/indexProjectEnd.do?no="+no;
	
}
</script>
<div class="index-project">
		<div class="title">
			&nbsp;&nbsp;&nbsp;&nbsp;모든 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<div class="project-group" id="allProjects">
		<div>
		<button type="button" id="indexUpdate1" class="btn btn-secondary" onclick="validate();">인덱스 수정하기</button>
		</div>
			<c:if test="${not empty list }">
				<c:forEach var="project" items="${list }">
					<div class="project" onclick="check(${project.projectNo });" >
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
								&nbsp; ${project.deadlineDay }일 남음
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
<jsp:include page="/WEB-INF/views/admin/footer.jsp" />