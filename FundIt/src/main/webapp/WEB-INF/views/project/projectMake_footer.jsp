<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


		<div class="make-project-btn">
					
			<c:if test="${param.sectionName  eq 'account' || param.sectionName eq 'complete'}">

				<button type="submit" class="nextBtn" >
					저장
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/checked_gray.png" />
				</button>
			</c:if>
			<c:if test="${param.sectionName  ne 'account' }">
				<button type="submit" class="nextBtn" >
					저장
					<img src="${pageContext.request.contextPath }/resources/images/makeProject/next.png" />
				</button>
			</c:if>
		
			</form>
		</div>
	</div>
</div>