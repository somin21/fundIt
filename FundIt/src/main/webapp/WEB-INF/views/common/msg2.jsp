<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>

<form action="${pageContext.request.contextPath}/message/messageList2.do" method="post">
<input type="text" name="email" value="${memberLoggedIn.email }" style="display: none;"/>
<input type="submit"  id="messagesubmit" style="display: none;"/>
</form>
<script>
alert("${msg}");

$("#messagesubmit").click();




</script>