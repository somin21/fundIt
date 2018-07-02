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

var numPerPage = 8;
var searchType = "";

function fn_shownSlide(el){
	
	$(".div-gift").not(".hidden").not($(el)).slideDown();
	$(".hidden").not($(el)).slideUp();
	$(el).slideUp();
	$(el).next(".hidden").slideDown(500);
}

function fn_hiddenSlide(el){
	
	
	$(el).children()
	$(el).slideUp();
	$(el).prev("#shown").slideDown(500);
	
}
function fn_preventEvent(event){
	 var event = event || window.event;
	 
	//ie를 제외한 브라우져
     event.stopPropagation();
     //ie8이하 브라우져
     event.cancelBubble = true;
}
function fn_updateDeliveryAddr(el, event, idNum){
	//ie를 제외한 브라우져
	
    event.stopPropagation();
    //ie8이하 브라우져
    event.cancelBubble = true;
    
    var postNum = $("#postNum"+idNum).val();
    var address = $("#address"+idNum).val();
    var details = $("#details"+idNum).val();
    var supportNo = idNum;
    if(postNum.length ==0 || address.length ==0 || details.length == 0){
    	alert("우편번호와 주소를 확인해주세요.");
    	return false;
    }
    address = address+" "+details;
    console.log(postNum);
    console.log(address);
    console.log(supportNo);
       
    $.ajax({
    	url : "${pageContext.request.contextPath}/gift/updateDeliveryAddr.do",
    	data : {postNum : postNum, address : address, supportNo : supportNo},
    	type : "POST",
    	success : function(data){
    		console.log(data);
    		if(data == 1){
    			alert("성공적으로 주소를 수정했습니다.");
    			toNextAjax();
    			
    		}else{
    			alert("주소수정에 실패했습니다.");
    		}
    	},
    	error : function(jqxhr,textStatus,errorThrown){
    		console.log("ajax 실패");
    	}
    	
    })
    
    
    
	
}


/* 검색   */
function fn_searchTypeChange(){
	var email = $("#email").val().trim();
	searchType = $("#searchType option:selected").val();
	console.log(searchType);
	$.ajax({
		url : "${pageContext.request.contextPath}/gift/selectMyGiftList",
		data : {email : email, searchType : searchType},
		success: function(data){
			console.log(data);
			var html = '';
			var div_name = $("#div-giftList"); 
			$("#div-giftList").html('');
			for(var i=0; i<data.length; i++){
				
				htmlAppend(data[i], div_name);
			}
			if(data.length < 1){
	    		htmlAppendNone(data.length+1, div_name);
	    	}			
			
		},
		error : function(jqxhr, textStatus, errorThrown){
			console.log("ajax실패")
		}
		
	});
	
	
}

$(function (){
	
	
	
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
		url : "${pageContext.request.contextPath}/gift/selectMyGiftList",
		data : {email : email, searchType : searchType},
		success: function(data){
			console.log(data);
			var html = '';
			var div_name = $("#div-giftList"); 
			
			for(var i=0; i<data.length; i++){
				htmlAppend(data[i], div_name);
			}
			if(data.length < 1){
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
	html += '<p style = "color : lightgray;">'+gift.projectWriter+'</p>';
	html += '</hr>';
	if(gift.deliveryYn.includes("Y")){
	html += '<span style = "font-size :20px; font-weight: 20px; color : yellowgreen;">'+gift.itemName+'</span>(배송상품) ';

	}else{
	html += '<span style = "font-size:20px; font-weight: 20px; color : yellowgreen;>'+gift.itemName+'</span>(비 배송상품)';	
	}
	html += '<p><span style="color : lightseagreen; font-size:20px;">'+gift.itemNumber+'</span> 개</p>';
	html += '<p style="margin-top : 5px;">'+gift.postNum+' || '+gift.address+'</p>';
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
	
	html += '<div class="div-gift hidden" id="hidden" onclick = "fn_hiddenSlide(this);">';
	html += '<h3 style="color : gray;">배송지 수정하기</h3></br>';
	html += '<input type="hidden"  id ="projectNo" value="'+gift.supportNo+'"/>';
	html += '<input type="text" name="postNum" id="postNum'+gift.supportNo+'" class = "addrText"   onclick = "fn_preventEvent(event);" size = "10" class = "addrText" maxlength = "10" style="width : 20%;" placeholder = "우편번호" >&nbsp;&nbsp;<input type="text" name = "address1"  id="address'+gift.supportNo+'" class = "addrText " size = "50"  style = "width : 60%;"  maxlength="30" onclick = "fn_preventEvent(event)" size = "60" placeholder = "기본 주소"/>';
	html += '<br/><br/>';
	html += '<input type="text" name="address2" id="details'+gift.supportNo+'" class = "addrText " onclick = "fn_preventEvent(event);"  style = "width : 60%; margin-left : 190px;"  maxlength = "30" placeholder = "상세주소"><br/><br/>';
	html += '<input type = "button" class = "btn btn-danger"  id="postcodify_search_button" onclick ="fn_inputAddr(event,this,'+gift.supportNo+');"  value="우편번호 찾기">&nbsp;&nbsp;<input type = "button" class = "btn btn-success" onclick = "fn_updateDeliveryAddr(this, event,'+gift.supportNo+');" value = "주소 수정">'
	html += '<input type = "hidden" id="idNum'+gift.supportNo+'" value="'+gift.supportNo+'"/>';
	html += '</div>';
	
	
    
    div_name.append(html);
}

function htmlAppendNone(startIndex, div_name){
		
		var html = ''; 	
		html += '<span style = "font-size : 25px; color : lightgray; font-weight : bolder; margin-left : 35%; ">'
		html += '받으실 선물이 없습니다';
		html += '</span>';
		
		
		div_name.append(html);	
	
}

function toNextAjax(){
	email = $("#email").val().trim();
	searchType = $("#searchType option:selected").val().trim();
	var page = numPerPage+ 8;
	numPerPage = page;
	console.log(page);
	
		$.ajax({
			url : "${pageContext.request.contextPath}/gift/selectMyGiftList",
			data : {page : page, searchType : searchType ,email : email},
			success : function(data){
				console.log(data);
				var div_name = $("#div-giftList");   	
		    	$("#div-giftList").html('');
				
		    	for(var i = 0; i < data.length; i++){	    		
		    		htmlAppend(data[i],div_name);
		    		
				}
		    	
		    	if(data.length < 1){
		    		htmlAppendNone(data.length+1, div_name);
		    	}
			},
			error : function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패");
			}
		});
	
}





</script>

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

<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
<script>
var windowObj;

	function fn_inputAddr(event, el, idNum){
		var event = event || window.event;
		 console.log(idNum);
		//ie를 제외한 브라우져
	     event.stopPropagation();
	     //ie8이하 브라우져
	     event.cancelBubble = true;
	   
	    windowObj =  window.open("${pageContext.request.contextPath}/gift/findAddress.do?idNum="+idNum,"findAddr","width = 700px height=500px left= 500px top = 200px menubar=no toolbar=no location=no");
	   
	    //windowObj.document.getElementById("idNum").value =document.getElementById('idNum'+idNum).value;
	    

	    
	    
		
	}
	
	
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>