<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#addItemModal div#addItemModalHeader, #addItemModal div#addItemModalBody, #addItemModal div#addItemModalFooter{
	padding: 3%;
}
#addItemModal div#addItemModalHeader{
	border-bottom: 1px solid lightgray;
}
#addItemModal div#addItemModalBody{
	background: #f5f5f5;
	min-height: 550px;
}
#addItemModal div#addItemModalFooter{
	border-top: 1px solid lightgray;
}
/* 아이템추가 */
div#addItemModalBody div.addItemDivContent{
    padding: 0!important;
    padding-bottom: 30px!important;
}
div#addItemModalBody button#addItemBtn{
	border: 2px solid #fa6462;
	background: white;
	font-weight: bold;
	font-size: 15px;
	border-radius: 5px;
	color: #fa6462;
	width: 100px;
	height: 35px;
	cursor: pointer;
}
div#addItemModalBody div#addItemDivTitle{
	border-bottom: 0;
}
div#addItemModalBody div#shownItemDiv{
	border: 1px solid lightgray;
	border-radius: 5px;
    padding: 25px 0 15px;
    cursor: pointer;
}
div#addItemModalBody div#shownItemDiv:hover{
	background: #f0f5ff;
}
div#addItemModalBody div#shownItemDiv p{
	text-align: center!important;
}
div#addItemModalBody div#hiddenItemDiv{
	display: none;
	border: 1px solid lightgray;
	border-radius: 5px;
	background: #f0f5ff;
	padding: 15px 10px 10px;
}
/* 아이템목록 */
div.addItemDivContent div.items{
	background: white;
	border: 1px solid lightgray;
	border-radius: 5px;
    padding: 10px 10px 10px 20px!important;
    font-size: 13px;
}
div.addItemDivContent div.items div{
	display: inline-block;
	padding: 0!important;
}
div.addItemDivContent div.items div.item-name{
	border: 0;
	width: 80%;
}
div.addItemDivContent div.items div.update-item{
	width: 10%;
	text-align: center;
	cursor: pointer;
}
div.addItemDivContent div.items div.delete-item{
	width: 10%;
	text-align: center;
}
div.addItemDivContent div.updateItems{
	display: none;
	border: 1px solid lightgray;
	border-radius: 5px;
	background: #f0f5ff;
	padding: 15px 10px 10px!important;
}
div.addItemDivContent div.updateItems button{
	margin-left: 10px;
}

/* 푸터 */
#addItemSaveBtn{
    background: #f4b4b8;
    color: #f7faff;
    border: 0;
    width: 90px;
    height: 35px;
    border-radius: 5px;
    font-size: 13px;
    font-weight: bold;
}
#addItemSaveBtn:hover{
	background: #fa6462;
	color: white;
	cursor: pointer;
	border: 0;
}
</style>

<script>
$(function(){
	
	$("#shownItemDiv").on("click",function(){
		$("#shownItemDiv").slideUp(500);
		$("#hiddenItemDiv").slideDown(500);
	});
	
	$(".itemCloseBtn").on("click",function(){
		$("#shownItemDiv").slideDown(500);
		$("#hiddenItemDiv").slideUp(500);
		$("#itemName").val("");
	});
	
	$(".itemSaveBtn").on("click",function(){
		
		var name = $("#itemName").val();
		
		if(name.length < 1){
			return;
		}
		
		var html = '<div class="items">';
		html += '<div class="item-name">'+name+'</div>';
		html += '<div class="update-item">수정</div>';
		html += '<div class="delete-item">삭제</div>';
		html += '</div>';
		html += '<div class="updateItems">';
		html += '<p>아이템 이름</p>';
		html += '<p>';
		html += '<input type="text" id="itemUpdateName" name="itemUpdateName" value="'+name+'"/>';
		html += '<span class="letter-cnt"><span class="total-letter" style="display:none">30</span><span class="cnt">'+(30-name.length)+'</span>자 남았습니다</span>';
		html += '</p>';
		html += '<p>';
		html += '<button type="button" class="itemUpdateCloseBtn">';
		html += '<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />';
		html += '닫기';
		html += '</button>';
		html += '<button type="button" class="itemUpdateSaveBtn">';
		html += '<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />';
		html += '저장';
		html += '</button>';
		html += '</p>';
		html += '</div>';
		
		$(".item-list").append(html);
		
		$("#shownItemDiv").slideDown(500);
		$("#hiddenItemDiv").slideUp(500);
		$("#itemName").val("");
	});
	
	$(".item-list").on("click", ".update-item" ,function(){
		$(this).parent().next(".updateItems").slideDown(300);
	});
	
	$(".item-list").on("click", ".itemUpdateCloseBtn" ,function(){
		$(this).parents(".updateItems").slideUp(300);
		var name = $(this).parents(".updateItems").prev(".items").children(".item-name").text();
		$(this).parent().prev().children("#itemUpdateName").val(name);
	});
	
	$(".item-list").on("click", ".itemUpdateSaveBtn" ,function(){
		$(this).parents(".updateItems").slideUp(300);
		var name = $(this).parent().prev().children("#itemUpdateName").val();
		$(this).parents(".updateItems").prev(".items").children(".item-name").text(name);
	});
	
	$("#addItemSaveBtn").on("click",function(){
		$("#shownItemDiv").slideDown(500);
		$("#hiddenItemDiv").slideUp(500);
		$(".updateItems").slideUp(300);
	});
	
});
</script>

<!-- AddItemModal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content" id="addItemModal">
    
      <div class="modal-header" id="addItemModalHeader">
        <h4 class="modal-title" id="exampleModalCenterTitle"><b>아이템 관리하기</b></h4>
      </div>
      
      <div class="modal-body" id="addItemModalBody">
      	
      	<!-- 아이템 추가 시작 -->
      	<div class="addItemDiv">
      		
      		<div id="addItemDivTitle">
      			<p>아이템만들기</p>
      		</div>
      		
      		<div class="addItemDivContent">
      			<div id="shownItemDiv">
	      			<p>아이템 추가하기</p>
					<p>
						선물 구성에 추가할 아이템을 만듭니다
					</p>
					<p>
						<button type="button" id="addItemBtn">
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/addGift.png" />
							추가하기
						</button>
					</p>
				</div>
	      		
	      		<div id="hiddenItemDiv">
	      			<p>아이템 이름</p>
					<p>
						<input type="text" id="itemName" name="itemName" placeholder="새로 만들 아이템의 이름을 입력하세요" />
						<span class="letter-cnt"><span class="total-letter">30</span>자 남았습니다</span>
					</p>
					<p>
						<button type="button" class="itemCloseBtn">
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/x.png" />
							닫기
						</button>
						<button type="button" class="itemSaveBtn">
							<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
							저장
						</button>
					</p>
	      		</div>
	      		
      		</div>
      	</div>
      	<!-- 아이템 추가 끝 -->
      		
      	<!-- 아이템목록 시작 -->
   		<div class="addItemDiv">
   		
    		<div id="addItemDivTitle">
    			<p>아이템 목록</p>
    		</div>
    		
    		<div class="addItemDivContent">
    			<div class="item-list">
    				
    			</div>
   			</div>
      	</div>
      	<!-- 아이템목록 끝 -->
      	
      </div>
      
      <div class="modal-footer" id="addItemModalFooter">
		<button type="button" data-dismiss="modal" id="addItemSaveBtn">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/ok.png" />
			저장
		</button>
      </div>
      
    </div>
  </div>
</div>