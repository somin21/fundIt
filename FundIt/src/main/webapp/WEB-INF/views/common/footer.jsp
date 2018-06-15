<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="footer">
	<p>
		<span id="help">
			<a href="">헬프센터</a>
		</span>
		<button id="messageToAdmin" class="btn btn-outline-secondary">
			<img src="${pageContext.request.contextPath }/resources/images/questions.png" />
			<span>문의하기</span>
		</button>
	</p>
	
	<br />
	
	<p id="copyright">
		펀드잇(주) | 대표 정소민 | 서울시 강남구 테헤란로 14길 6, 4F
		<br />
		ⓒ 2018 FundIt Inc.
	</p>
	
</div>

</body>
</html>