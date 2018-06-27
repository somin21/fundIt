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
   $("#messageNo").hide();
   $('#myModal').modal({backdrop: 'static', keyboard: false}) ;
   $('.aaa').hide();
  $('.messagearea').hide();
  $('#receive').hide();
}

function receive(){
	$('#receive').show();
	$('.messagearea').show();
	$('.aaa').show();
	$('.bbb').hide();
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
.messagearea{
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
          <h4 class="modal-title">상세보기 및 답장하기</h4> <button type="button" onclick="receive();" class="btn btn-default">답장하기</button>
        </div>
       	<form action="messageModalEnd2.do">
        <div class="modal-body">
        	<h4 class="bbb">메세지 내용</h4>
        	<hr class="bbb"/>
        	<div class="bbb">${content}</div>
         <%--  <textarea class="messagearea" name="" id="" cols="30" rows="10" readonly>${content}</textarea> --%>
          <div >
          	
         <h4 class="aaa">받는 사람:<input type="text" value="${param.email2 }" name="receiveEmail" readonly  /> </h4> 
         			<input type="text" value="${memberLoggedIn.email }" name="sendEmail" id="sendEmailHide" />
         </div>
         <textarea class="messagearea" name="messageContent" cols="30" rows="10" placeholder="답장할 내용을 입력하세요" ></textarea>
        </div>
        <input type="text" value="${param.messageNo }" name="messageNo" id="messageNo" />
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"  onclick="location.href='${pageContext.request.contextPath}/message/messageList.do?email=${memberLoggedIn.email }'">Close</button>
          <input type="submit" value="보내기" class="btn btn-default" id="receive" />
        </form>
        </div>
      </div>
    </div>
  </div>
</div>



   