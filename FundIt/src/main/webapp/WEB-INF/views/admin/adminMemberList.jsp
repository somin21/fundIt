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
<script>
$(function(){
	$("#searchInput").on("keyup",function(){
		var email = $(this).val().trim();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/adminMemberSearch.do",
			dataType: "json",
			data:{email:email},
			success:function(data){
				var html='';
				if(data.list!=null){
					$("#tb-data").html("");
					for(var i=0; i<data.list.length; i++){
						html+='<tr><th scope="'+i+'"id="email1">'+data.list[i].email+'</th>';
						html+='<td>'+data.list[i].projecting+'</td>';
						html+='<td>'+data.list[i].supporting+'</td>';
						if(data.list[i].projecting == 0 && data.list[i].supporting ==0){
							html+='<td><button id="btn1" class="btn btn-danger btn-sm" onclick="fn_delete('+"'"+data.list[i].email+"'" +');">삭제</button></td>';
						}else{
							html+='<td><button id="btn1" class="btn btn-danger btn-sm" disabled="disabled">삭제</button></td>';
						}
						html+='</tr>'
					}
					$("#tb-data").append(html);
				}
			}
		});
	});
});

</script>
<div id="wrap-out" >
	<div id="title">회원 관리</div>
	<div id="search"><input type="text" class="form-control" id="searchInput" aria-label="이메일 검색" aria-describedby="inputGroup-sizing-sm"></div>
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
		  <tbody id="tb-data">
		  <c:if test="${not empty list }">
		  	<c:forEach var="list" items="${list }" varStatus="i">
			    <input type="hidden" value="${list.email }" id="email1"/>
			    <input type="hidden" value="${list.email }" id="email2"/>
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