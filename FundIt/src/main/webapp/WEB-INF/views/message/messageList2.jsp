<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>


<style>
.container {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}

@media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container {
    width: 970px;
  }
}

@media (min-width: 1200px) {
  .container {
    width: 1170px;
  }
}

#messageContainer{
	font-size: 70px;
}

  div.maincontainer{text-align: center; padding: 80px;}
  
.content{
width:300px;
display:inline-block;
overflow: hidden;
text-overflow: ellipsis;
white-space:nowrap;
} 
</style>
<script>
window.onload = function () {
	$("#loggedinemail").hide();
	
}
</script>
    <div class="maincontainer">
        <h1 id="messageContainer">
           <img src="${pageContext.request.contextPath }/resources/images/message/message.png" alt="" />Message
        </h1>
        </div>

<section>
<div id="container" class="container">
<input type="button" value="받은 메세지함" id="btn-add" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/message/messageList.do?email=${memberLoggedIn.email }'" />
<input type="button" value="보낸 메세지함" id="btn-add" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/message/messageList2.do?email=${memberLoggedIn.email }'" />
<input type="button" value="읽은 메세지함" id="btn-add" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/message/messageList5.do?email=${memberLoggedIn.email }'" />
<br /><br />
<table class="table">
	<tr>
		<!-- <th>번호</th> -->
		<th class="content">내용</th>
		<th>수신 여부</th>
		<!-- <th>보낸이</th> -->
		<th>받은사람</th>
		<th>받은시간</th>
	</tr>

	<c:forEach items="${list}" var="message">
		<tr>
			<%-- <td>${message.messageNo}</td> --%>
			<td><a href="${pageContext.request.contextPath }/message/messageModal3.do?email=${message.receiveEmail}&email2=${message.sendEmail}&messageNo=${message.messageNo}" class="content">${message.messageContent }</a></td>
			<td>${message.readyn }</td>
			<%-- <td>${message.sendEmail }</td> --%>
			<td>${message.receiveEmail }</td>
			<td>${message.messageDate }</td>
		</tr>
	</c:forEach>
<c:if test="${empty list }">
			<h1>아직 메세지가 등록되지 않았습니다~~~~ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</h1>
		</c:if>
		<form action="messageSelect2.do">
<input type="text" value="${param.email }" name="email" id="loggedinemail"/> 
<input type="text" placeholder="메일검색" onkeydown="JavaScript:Enter_Check();" name="messageSelect" value="" />
<input type="submit" value="검색" />
</form>
</table>
</div>
<!-- 페이지바 -->
<%
	String email = request.getParameter("email");
	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	try{
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}catch(NumberFormatException e){
		
	}
%>
<%=com.kh.fundit.message.util.Utils.getPageBar(count,cPage,numPerPage,"messageList2.do",email) %>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>