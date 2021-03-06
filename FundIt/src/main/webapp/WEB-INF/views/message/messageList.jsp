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

    <div class="maincontainer">
        <h1 id="messageContainer">
           <img src="${pageContext.request.contextPath }/resources/images/message/message.png" alt="" />Message
        </h1>
        </div>
	
<section>
<div id="container" class="container">
<form action="${pageContext.request.contextPath}/message/messageList.do" method="post">
<input type="submit" value="받은 메세지함" id="receive" class="btn btn-outline-success"/>
<input type="text" name="email" value="${memberLoggedIn.email}" style="display: none;" />
</form>
<form action="${pageContext.request.contextPath}/message/messageList2.do" method="post">
<input type="submit" value="보낸 메세지함" id="send" class="btn btn-outline-success"/>
<input type="text" name="email" value="${memberLoggedIn.email}" style="display: none;" />
</form>
<form action="${pageContext.request.contextPath}/message/messageList5.do" method="post">
<input type="submit" value="안읽은 메세지함" id="readyn" class="btn btn-outline-success" />
<input type="text" name="email" value="${memberLoggedIn.email}" style="display: none;" />
</form>
<br /><br />
<table class="table">
	<tr>
	<!-- 	<th>번호</th> -->
		<th class="content">내용</th>
		<th>읽은 여부</th>
		<th>보낸 사람</th>
		<!-- <th>받은사람</th> -->
		<th>받은 시간</th>
	</tr>
	
	<c:forEach items="${list}" var="message" varStatus="status">
		<tr>
		<form action="messageModal2.do" method="post">
			<%-- <td>${message.messageNo}</td> --%>
			<td><input type="submit" id="sss${status.count }" style="display: none;"  /><a href="#" class="content" onclick="me(${status.count});">${message.messageContent } </a></td>
			<td>${message.readyn }</td>
			<td>${message.sendEmail }</td>
			<input type="text" name=email value="${message.receiveEmail }" style="display: none;" />
			<input type="text" name=email2 value="${message.sendEmail }" style="display: none;"/>
			<input type="text" name=messageNo value="${message.messageNo }" style="display: none;"/>
			</form>
			<%-- <td>${message.receiveEmail }</td> --%>
			<td>${message.messageDate }</td>
		</tr>
	</c:forEach>
<c:if test="${empty list }">
			
		</c:if>
		<form action="messageSelect.do" method="post">
<input type="text" value="${param.email }" name="email" id="loggedinemail" style="display: none;"/> 
<input type="text" placeholder="메일검색" onkeydown="JavaScript:Enter_Check();" name="messageSelect" value="" />
<input type="submit" value="확인" />
</form>

</table>
</div>

<script>
function me(a){
	var b = $("#sss"+a);
	console.log(b);
	b.click();
	
	

}




</script>


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

<%=com.kh.fundit.message.util.Utils.getPageBar3(count,cPage,numPerPage,"messageList.do",email) %>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>