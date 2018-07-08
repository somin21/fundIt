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
.project{
	position: relative;
	z-index: 10;
}
#divchecked{
	display: none;
}
.divchecked{
	position: absolute;
	z-index: 100;
	top: 0; 
    left: 0;
    width: 100%;
    height: 100%;
    text-align: center;
    background: #f2f2f2d4;
    padding-top: 100px;
}
</style>
<script>
var noArray = new Array();
var array = new Array();
var z = 0;
var no = "";

function check(x,el){
	console.log(el);
	$(el).find("#divchecked").css("display","inline-block"); 
	$(el).find("#divchecked").addClass("divchecked"); 
	if(noArray.length == 0){
		noArray[0] = x;
		z++;
	}else{
		noArray[z] = x;
		z++;
		for(var i = 0; i<noArray.length; i++){
			for(var j = 0; j<i; j++){
				if(noArray[i] == noArray[j]){
					noArray.splice(i,1);
					noArray.splice(j,1);
					$(el).find("#divchecked").removeClass("divchecked"); 
					$(el).find("#divchecked").css("display","none"); 
					z--;
				}
				
			}
		}
		
	}
	no=noArray.join(",");
}
function validate(){
	if(z<=3){
		alert(z+"개를 선택하셨습니다."+"\n"+"처음부터 다시 선택하여 주세요."+"\n"+"4개 모두 선택하셔야 합니다.");
		no="";
		console.log("123456789 :::: "+no);
		return;
	}
	if(z>4){
		alert("4개까지 선택 가능합니다.");
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
					<div class="project" onclick="check(${project.projectNo },this);" >
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
								/&nbsp; <fmt:formatNumber value="${project.supportMoney}" pattern="#,###"/> &nbsp;(${project.supportPercent }%)
							</div>
						</div>
						<!-- 체크이미지 -->
						<div id="divchecked">
							<img src="${pageContext.request.contextPath }/resources/images/checked.png" style="width:90px; height:90px;"/>
						</div>
						
					</div>
				</c:forEach>
			</c:if>	
		</div>
</div>
<jsp:include page="/WEB-INF/views/admin/footer.jsp" />