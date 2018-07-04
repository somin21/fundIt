<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp"/>
<style>
#wrap-out{width: 80%; margin:auto;}
#title{text-align: center; font-size: 25px; margin: 3%;}
#search{margin-bottom: 2%; text-align: center;}

#m-cont{
	min-height: 300px;
}
#send-con1{
	height: 50px;
	vertical-align: bottom;
}
#mcontent-cont{
	min-height: 180px;
}
#receive-cont{
	height: 50px;
	vertical-align: bottom;
}
#modal-header{
	background-color: rgb(250, 100, 98);
	color: white;
}
#sendE-in{
	display: inline-block;
}
#receiveE-in{
	display: inline-block;
}
th{
	text-align: center;
}
#t-img{
	text-align: center;
}
#btn-group{
	margin-bottom: 2%;
}
#content-list11{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space:nowrap;
}
#t-img{
	width: 200px;
}
#btnM{
	border: 1px solid white;
	width: 60px;
	height: 40px;
	border-radius: 5px;
	
}
#tam{
	width:100%;
	height:250px;
}
</style>
<script>
var replyReceiveEmail="";
var replySendEmail="";

function fn_open(messageNo){
	fn_readY(messageNo);
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/selectMessage.do",
		dataType:"json",
		data:{messageNo:messageNo},
		success:function(data){
			var html='';
			$("#m-cont").html("");
			html+='<div id="send-con1"> ';
			html+='보낸 이메일 : <input type="text" id="sendE-in" class="col-sm-3 form-control" value="'+data.m.sendEmail + '"/><br>';
			html+='</div>';
			html+='<hr/>';
			html+='<div id="mcontent-cont"> ';
			html+= data.m.messageContent + '<br>';
			html+='</div>';
			html+='<hr/>';
			html+='<div id="receive-cont"> ';
			html+='받은 이메일 : <input type="text" id="receiveE-in" class="col-sm-3 form-control" value="'+ data.m.receiveEmail + '"/><br>';
			html+='</div>';

			replyReceiveEmail = data.m.sendEmail;
			replySendEmail = data.m.receiveEmail;
			
			$("#sendBtn").hide();
			$("#btnM").show();
			$("#m-cont").append(html);
			$("#exampleModalCenter").modal('show');
			
			
		}
		
	});
	
}
//전체 메세지 보여주기
function fn_allMessage(){
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/selectAllMessage.do",
		dataType:"json",
		success:function(data){
			var html='';
			if(data.list!=null){
				$("#tb-data").html("");
				for(var i=0; i<data.list.length; i++){
					html+='<tr><th scope="'+i+'"id="email1">'+data.list[i].sendEmail+'</th>';
					html+='<td id="content-list11" onclick="fn_open('+"'"+data.list[i].messageNo+"'"+');">'+data.list[i].messageContent+'</td>';
					html+='<td>'+data.list[i].receiveEmail+'</td>';
					if(data.list[i].readyn=='Y'){
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/email.png" alt="읽음"/></td>';
					}else{
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/mail.png" alt="읽지않음"/></td>';
					}
					html+='<td>'+data.list[i].messageDate+'</td>';
				}
				$("#tb-data").append(html);
			}
		}
	});
}

//안읽은 메세지만 보여주기
function fn_readNSelect(){
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/selectReadN.do",
		dataType:"json",
		success:function(data){
			var html='';
			if(data.list!=null){
				$("#tb-data").html("");
				for(var i=0; i<data.list.length; i++){
					html+='<tr><th scope="'+i+'"id="email1">'+data.list[i].sendEmail+'</th>';
					html+='<td id="content-list11" onclick="fn_open('+"'"+data.list[i].messageNo+"'"+');">'+data.list[i].messageContent+'</td>';
					html+='<td>'+data.list[i].receiveEmail+'</td>';
					if(data.list[i].readyn=='Y'){
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/email.png" alt="읽음"/></td>';
					}else{
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/mail.png" alt="읽지않음"/></td>';
					}
					html+='<td>'+data.list[i].messageDate+'</td>';
					
				}
				$("#tb-data").append(html);
			}
		}
	});
}

//답장
function fn_reply(){
	$("#sendBtn").show();
	$("#btnM").hide();
	
	var html="";
	
	$("#m-cont").html("");
	
	html+='<div id="send-con1"> ';
	html+='받는사람 : <input type="text" id="sendE-in" class="col-sm-3 form-control" value="'+replyReceiveEmail + '"/><br>';
	html+='</div>';
	html+='<hr/>';
	html+='<div id="mcontent-cont" height="550">';
	html+='<textarea id="tam" style="resize: none;" rows="7" placeholder="보내실 메세지를 입력하여주세요."></textarea>' + '<br>';
	html+='</div>';
	
	$("#m-cont").append(html);
	
	$("#sendBtn").click(function(){
		var content = $("#tam").val();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/reply.do",
			dataType:"json",
			data:{replyReceiveEmail:replyReceiveEmail, replySendEmail:replySendEmail, content:content},
			success:function(data){
				alert(data.map1.replyReceiveEmail+"님께 메세지를 보냈습니다.");
				$("#exampleModalCenter").modal('hide');
				replyReceiveEmail=' ';
				replySendEmail=' ';
			}
		}).done(function(){
			location.href="${pageContext.request.contextPath}/admin/messageList.do";
		});
	});
	
}

//열때마다
function fn_readY(x){
	messageNo = x;
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/readY.do",
		dataType:"json",
		data:{messageNo:messageNo},
		success:function(data){
			var html='';
			if(data.list!=null){
				$("#tb-data").html("");
				for(var i=0; i<data.list.length; i++){
					html+='<tr><th scope="'+i+'"id="email1">'+data.list[i].sendEmail+'</th>';
					html+='<td id="content-list11" onclick="fn_open('+"'"+data.list[i].messageNo+"'"+');">'+data.list[i].messageContent+'</td>';
					html+='<td>'+data.list[i].receiveEmail+'</td>';
					if(data.list[i].readyn=='Y'){
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/email.png" alt="읽음"/></td>';
					}else{
						html+='<td id="t-img"><img src="${pageContext.request.contextPath}/resources/images/mail.png" alt="읽지않음"/></td>';
					}
					html+='<td>'+data.list[i].messageDate+'</td>';
				}
				$("#tb-data").append(html);
			}
		}
	});
}
</script>
<div id="wrap-out" >
	<div id="title">메세지 관리</div>
	<div id="search"><input type="text" class="form-control col-3" id="searchInput" aria-label="이메일 검색" aria-describedby="inputGroup-sizing-sm"></div>
	<div id="table-container">
		<div id="btn-group">
			<input type="button" class="btn btn-danger btn-sm" value="전체 메세지 " onclick="fn_allMessage();"/>
			<input type="button" class="btn btn-danger btn-sm" value="안 읽은 메세지" onclick="fn_readNSelect();"/>
		</div>	
		<table class="table table-hover table-bordered" style="table-layout: fixed">
		  <thead>
		    <tr>
		      <th scope="col" width="200">보낸 이메일</th>
		      <th scope="col" width="400">내용</th>
		      <th scope="col" width="200">받은이메일</th>
		      <th scope="col" width="100">읽음 유무</th>
		      <th scope="col" width="200">시간</th>
		    </tr>
		  </thead>
		  <tbody id="tb-data">
		  <c:if test="${not empty list }">
		  	<c:forEach var="list" items="${list }" varStatus="i">
		  	<input type="hidden" id="sendE" value="${list.sendEmail }" />
		  	<input type="hidden" id="receiveE" value="${list.receiveEmail }" />
		  		<tr>
		  			<th scope="${i.count }" id="sendE">${list.sendEmail }</th>
			    	<td id="content-list11" onclick="fn_open('${list.messageNo}')">${list.messageContent }</td>
			      	<td>${list.receiveEmail }</td>
			      	<c:if test="${list.readyn eq 'Y' }">
				      	<td id="t-img"><img src="${pageContext.request.contextPath }/resources/images/email.png" alt="읽음" /></td>
			      	</c:if>
			      	<c:if test="${list.readyn eq 'N' }">
				      	<td id="t-img"><img src="${pageContext.request.contextPath }/resources/images/mail.png" alt="읽지않음" /></td>
			      	</c:if>
			      	<td>${list.messageDate }</td>
			    </tr>
			</c:forEach>
		   </c:if>
		  </tbody>
		</table>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" id="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">메세지</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="m-cont">
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="close-btn" data-dismiss="modal" >Close</button>
        <button type="button" class="btn btn-primary" id="sendBtn" >Send</button>
        <button type="button" id="btnM" onclick="fn_reply();">답장</button>
         <!-- onclick="fn_reply();" -->
      </div>
    </div>
  </div>
</div>
<script>
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />