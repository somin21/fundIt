<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-gift-list.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script>
var searchType = "";
var email = "";
var page = 1;
function fn_searchTypeChange(){
	var html = '';
	$("#div-giftList").html(html);
	$(".btn").prop("disabled",false);
	var email = $("#email").val().trim();
	page = 1;
	searchType = $("#searchType option:selected").val();
	console.log(searchType);
	$.ajax({
		url : "${pageContext.request.contextPath}/gift/selectGiveGiftList",
		data : {email : email, searchType : searchType},
		success: function(data){
			console.log(data);
			var html = '';
			var div_name = $("#div-giftList"); 
			$("#div-giftList").html('');
			if(data.length >=1){
			for(var i=0; i<data.length; i++){
				if(data.length <6 && data.length>=1){
					$(".btn").prop("disabled",true);
				}
				
				htmlAppend(data[i], div_name);
			}
			}
			if(data.length < 1){
				$(".btn").prop("disabled",true);
	    		htmlAppendNone(data.length+1, div_name);
	    	}			
			
		},
		error : function(jqxhr, textStatus, errorThrown){
			console.log("ajax실패");
		}
	});
}


$(function(){
	
var email = $("#email").val().trim();
	
	console.log(email);
	
	/* 프로필 보여주기  */
	/* profileImgage */
	$.ajax({
		url : "${pageContext.request.contextPath}/member/selectProfileImg?email="+email,
		
		success : function(data){
			console.log(data);
				var html = '';
				if(data == ""){
					html += '<img class="profileImage" src="${pageContext.request.contextPath }/resources/images/profile.png" />';
				}else{
					html += '<img class="profileImage" src="${pageContext.request.contextPath }/resources/upload/profileImg/'+data+'" />';	
				}
			    
			    $("#img-container").append(html);
			
		},
		error : function(jqxhr,textStatus,errorThrown){
			console.log("ajax실패");
		}
	});
	
	/*선물 리스트 */
	$.ajax({
		url : "${pageContext.request.contextPath}/gift/selectGiveGiftList",
		data : {page:page ,email : email, searchType : searchType},
		success: function(data){
			console.log(data);
			var html = '';
			var div_name = $("#div-giftList"); 
			if(data.length>=1){
			for(var i=0; i<data.length; i++){
				if(data.length <6 && data.length>=1){
					$(".btn").prop("disabled",true);
				}
				htmlAppend(data[i], div_name);
			}
			}
			if(data.length < 1){
				$(".btn").prop("disabled",true);
				htmlAppendNone(data.length+1, div_name);
			}
			
		},
		error : function(jqxhr, textStatus, errorThrown){
			console.log("ajax실패")
		}
		
	});
	
	
});

function htmlAppend(gift, div_name){
	var html = '';
	
	html += '<div class="div-gift" id="shown" onclick="fn_shownSlide(this);">';  /* div-gift #shown  */
	html += '<input type="hidden" name="projectNo" id ="projectNo" value="'+gift.projectNo+'" />';
	html += '<div id="left-content">'
	html += '<h5><a href="${pageContext.request.contextPath}/project/projectView.do?projectNo='+gift.projectNo+'" style = "text-decoration : none; font-weight : bolder; color : gray;">'
		 +gift.projectTitle+'<img src="${pageContext.request.contextPath }/resources/images/right-arrow-gray.png" style="width:15px; height: 15px;"/></a></h5>';
	html += '<p style = "color : lightgray;">'+gift.supportor+'</p>';
	html += '</hr>';
	if(gift.deliveryYn.includes("Y")){
	html += '<span style = "font-size :20px; font-weight: 20px; color : yellowgreen;">'+gift.itemName+'</span>(배송상품) ';

	}else{
	html += '<span style = "font-size:20px; font-weight: 20px; color : yellowgreen;>'+gift.itemName+'</span>(비 배송상품)';	
	}
	html += '<p><span style="color : lightseagreen; font-size:20px;">'+gift.itemNum+'</span> 개</p>';
	if(gift.postNum != null){
	html += '<p style="margin-top : 5px;">우편번호 :'+gift.postNum+' || 주소 : '+gift.address+'</p>';
	}else if(gift.postNum == null){
		html += '<p style="margin-top : 5px;">우편번호 : 조회결과 없음 || 주소 : '+gift.address+'</p>';	
	}
	html += '</div>';
	html += '<div id="right-content">'
	html += '<div class="days" style = "margin-top : 10px;">';
	html += '<img src="${pageContext.request.contextPath }/resources/images/calendar.png"/>';
	var toDay = new Date();
	var deliveryDueDate = new Date(gift.deliveryDueDate);
	if(toDay >= deliveryDueDate){
	html += '&nbsp;<span style="color : tomato; margin-bottom : 20px;">'+gift.deliveryDueDate+'</span></br></br>';
	html += '<h5 style = "color : lightseagreen;">배송완료</h5>';
	}else if(toDay < deliveryDueDate){
	html += '&nbsp;<span style="color : tomato; margin-bottom : 20px;">'+gift.deliveryDueDate+'</span></br></br>';	
	html += '<h5 style = "color : pink;">배송예정</h5>';
	}
	html += '</div>';
	html += '</div>';
	html += '</div>';  /* div-gift #shown close  */
	
    div_name.append(html);
}

function htmlAppendNone(startIndex, div_name){
		
		var html = ''; 	
		html += '<span style = "font-size : 25px; color : lightgray; font-weight : bolder; margin-left : 35%; ">'
		html += '조회된 결과가 없습니다';
		html += '</span>';
		
		
		div_name.append(html);	
	
}

function toNextAjax(){
	email = $("#email").val().trim();
	searchType = $("#searchType option:selected").val().trim();
	page = page+1;
	console.log(page);
	
		$.ajax({
			url : "${pageContext.request.contextPath}/gift/selectGiveGiftList",
			data : {page : page, searchType : searchType ,email : email},
			success : function(data){
				console.log(data);
				var div_name = $("#div-giftList");   	
		    	if(data.length >= 1){		
		    	for(var i = 0; i < data.length; i++){	
		    		if(data.length <6 && data.length>=1){
						$(".btn").prop("disabled",true);
					}
					htmlAppend(data[i],div_name);
		    		
				}
		    	}
		    	if(data.length < 1){
		    		$(".btn").prop("disabled",true);
		    		htmlAppendNone(data.length+1, div_name);
		    	}
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	
}


</script>



<div id="giveDeliveryList-container" style = "width : 100%">

<div class="myProfile-container">
	<div id = "changable-content">
	<div id="img-container">
	
	</div>
	<h1><a href="${pageContext.request.contextPath}/member/profileView.do?email=${memberLoggedIn.email}">${memberLoggedIn.email}</a></h1>
	<input type="hidden" id ="email" value="${memberLoggedIn.email}" />
	</div> 	

	
	
	
</div>
<hr />
<div id="searchList" onchange="fn_searchTypeChange();">
        <select name="searchType" id="searchType">
            <option  value="All" >모두보기</option>
            <option  value="deliveryBefore">배송대기중</option>
            <option  value="deliveryAfter">배송완료</option>
        </select>
    </div>
<hr />

<div class="myGiftList-container">

<p class="title">
	선물리스트  	
</p>
<div class="gift-project" id="div-giftList">

</div>
<input type="button" value="더보기" class = "btn btn-success" style = "width:1024px; margin: auto; margin-top : 200px;"  onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectYet','${memberLoggedIn.email}','div-giftList','div-giftList');" />

</div>







</div>















<jsp:include page="/WEB-INF/views/common/footer.jsp"/>