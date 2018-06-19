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
}
div.project div.summary p:first-of-type{
	font-weight: bold;
}
div.project div.summary p:last-of-type{
    font-size: 11px;
    margin-top: -10px;
}
div.project div.summary div.progress{
    width: 110%;
    height: 5%;
    margin-left: -10px;
}
div.project div.summary div.days {
	display: inline-block;
	float: left;
	font-size: 11px;
    margin: -10px 0 10px;
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
    margin: -10px 0 10px;
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
	    margin-left: -1.5%;
	    width: 104%;
	    height: 3%;
	}
}
@media (max-width: 925px){

}
</style>
<!-- 새로운 프로젝트 12개 -->
	<div class="index-project" >
		<p class="title">
			새로운 프로젝트
		</p>
		
		<c:forEach var="i" begin="1" end="4" step="1">
			<div class="project">
				<div class="project-img">
					<img src="${pageContext.request.contextPath }/resources/images/empty.png" />
				</div>
				<div class="summary">
					<p>
						<span class="no-project">
							<br />&nbsp;&nbsp;
							등록된 프로젝트가 없습니다
						</span>
					</p>
				</div>
			</div>
		</c:forEach>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	