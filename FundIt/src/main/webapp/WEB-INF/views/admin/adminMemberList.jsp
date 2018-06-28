<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp"/>
<style>
#wrap-out{width: 80%; margin:auto;}
#title{text-align: center; font-size: 25px; margin: 3%;}
#search{margin-bottom: 2%; text-align: center;}
#btn1{border:}
</style>
<div id="wrap-out" >
	<div id="title">회원 관리</div>
	<div id="search">검색 : <input type="text" /></div>
	<div id="table-container">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th scope="col">이메일</th>
		      <th scope="col">진행중인 프로젝트</th>
		      <th scope="col">후원중인 프로젝트</th>
		      <th scope="col">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:if test="${not empty list }">
		  	<c:forEach var="list" items="${list }" varStatus="i">
			    <input type="hidden" value="${list.email }" id="email1"/>
		  		<tr>
		  			<th scope="${i.count }" id="email1">${list.email }</th>
			    	<td>${list.projecting }</td>
			      	<td>${list.supporting }</td>
			      	<c:if test="${list.projecting eq 0 && list.supporting eq 0 }">
			      	<td><button id="btn2"  class="btn btn-danger btn-sm" onclick="fn_delete('${list.email}');">삭제</button></td>
			      	</c:if>
			      	<c:if test="${list.projecting ne 0 || list.supporting ne 0 }">
			      	<td><button id="btn1"  class="btn btn-danger btn-sm" disabled>삭제</button></td>
			      	</c:if>
			    </tr>
			</c:forEach>
		   </c:if>
		  </tbody>
		</table>
	</div>
</div>
<script>
function fn_delete(email){
	location.href="${pageContext.request.contextPath}/admin/adminMemberDelete?email="+email;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />