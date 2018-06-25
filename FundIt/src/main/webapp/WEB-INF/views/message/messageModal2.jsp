<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>
<script>
window.onload = function () {
   $(".btn-info").hide();
   $(".btn-info").click();
   $("#sendEmailHide").hide();
   $("#projectNo").hide();
   $('#myModal').modal({backdrop: 'static', keyboard: false}) ;
   
  
 


   
}


</script>

<style>

body{
background: black;
}

.modal-header{
background-color: #fa6462;
}
.modal-title{
color:white;
}
#messagearea{
width:100%;
}
</style>


<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" >Open Large Modal</button>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">메세지 답장하기</h4>
        </div>
       	<form action="messageModalEnd.do">
        <div class="modal-body">
        <div >
         	받는사람 :<input type="text" value="${param.email }" name="receiveEmail" readonly />
         			<input type="text" value="${memberLoggedIn.email }" name="sendEmail" id="sendEmailHide" />
         </div>
         <textarea id="messagearea" name="messageContent" cols="30" rows="10"></textarea>
        
        </div>
        <div>
        <input type="text" value="${param.projectNo }" name="projectNo" id="projectNo" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"  onclick="location.href='${pageContext.request.contextPath}/project/projectView.do?projectNo=${param.projectNo}'">Close</button>
          <input type="submit" value="보내기" class="btn btn-default" />
        </form>
        </div>
      </div>
    </div>
  </div>
</div>



   