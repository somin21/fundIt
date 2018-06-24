<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>



<section>
<div id="board-container">

<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="location.href='boardForm.do'" />
<table class="table">
	<tr>
		<th>번호</th>
		<th>내용</th>
		<th>수신 여부</th>
		<th>보낸이</th>
		<th>받은사람</th>
	</tr>

	<c:forEach items="${list}" var="message">
		<tr>
			<td>${message.messageNo}</td>
			<td>${message.messageContent }</td>
			<td>${message.readyn }</td>
			<td>${message.sendEmail }</td>
			<td>${message.receiveEmail }</td>
		</tr>
	</c:forEach>

</table>
</div>
<!-- 페이지바 -->
<%
	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	try{
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}catch(NumberFormatException e){
		
	}
%>
<%=com.kh.fundit.message.util.Utils.getPageBar(count,cPage,numPerPage,"messageList.do")%>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>