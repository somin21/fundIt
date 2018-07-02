<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function nextPage(toPage){
	location.href="${pageContext.request.contextPath}/project/makeProject/"+toPage;
}
</script>

		<div class="make-project-btn">
		
			<c:if test="${param.sectionName eq 'outline' }">
				<button type="button" class="nextBtn" onclick="nextPage('funding-gift')">
					다음
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/next.png" />
				</button>
			</c:if>
			
			<c:if test="${param.sectionName eq 'funding-gift' }">
				<button type="button" class="prevBtn">
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/prev.png" />
					이전
				</button>
				<button type="button" class="nextBtn" onclick="nextPage('story')">
					다음
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/next.png" />
				</button>
			</c:if>
			
			<c:if test="${param.sectionName eq 'story' }">
				<button type="button" class="prevBtn">
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/prev.png" />
					이전
				</button>
				<button type="button" class="nextBtn" onclick="nextPage('account')">
					다음
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/next.png" />
				</button>
			</c:if>
			
			<c:if test="${param.sectionName  eq 'account'}">
				<button type="button" class="prevBtn">
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/prev.png" />
					이전
				</button>
			</c:if>
		</div>
	</div>
</div>