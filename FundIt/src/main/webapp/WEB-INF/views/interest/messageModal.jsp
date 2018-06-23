<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<div class="container">

  <!-- Trigger the modal with a button -->
  
 
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal"  data-target="#myModal">Open Small Modal</button>

<script>
window.onload = function () {
	$(".btn-info").hide();
	$(".btn-info").click();

}
</script>

<style>
body{
background: black;
}

.modal-header{
background-color: red;
}
</style>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title">창장자에게 문의하기</h4>
        </div>
        <span>받는 사람 </span>
        <div class="modal-body">
       	<textarea name="" id="" cols="30" rows="10"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/project/projectView.do?projectNo=${param.projectNo}'" >Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	