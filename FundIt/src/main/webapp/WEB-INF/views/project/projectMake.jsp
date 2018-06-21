<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<div id="make-project">
	<div id="make-project-btn">
		<button type="button">미리보기</button>
		<button type="button">검토 요청하기</button>
	</div>
	<div id="make-project-title">
		<div id="section-title">
			<span></span>
			프로젝트 개요
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />