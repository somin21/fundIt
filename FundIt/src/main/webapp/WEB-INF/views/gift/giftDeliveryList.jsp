<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script>

var numPerPage = 8;
var searchType = "";

function fn_shownSlide(el){
	console.log(el);
	console.log($(el).attr("id"));
	$(el).slideUp();
	$(el).next(".hidden").slideDown();
}


/* function fn_hiddenSlide(){
	console.log('hidden');
	$(this).slideDown(500);
	$(this).next(".shown").slideUp(500);
} */



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
	if(gift.deliveryYn == "Y"){
	html += '<span style = "font-size :20px; font-weight: 20px; color : yellowgreen;">'+gift.itemName+'</span>(배송상품) ';

	}else{
	html += '<span style = "font-size:20px; font-weight: 20px; color : yellowgreen;>'+gift.itemName+'</span>(비 배송상품)';	
	}
	html += '<p><span style="color : lightseagreen; font-size:20px;">'+gift.itemNumber+'</span> 개</p>';
	html += '<p style="margin-top : 5px;">'+gift.address+'</p>';
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
	
	html += '<div class="hidden" onclick = "">';
	html += '<h3>배송지 수정하기</h3></br>';
	html += '<input type="hidden" name="supportNo" id ="projectNo" value="'+gift.supportNo+'"/>';
	html += '<input type="text" name = "address" size = "60" value="'+gift.address+'" id="updateAddress"/>';
	html += '</div>';
	
	
    
    div_name.append(html);
}

function htmlAppendNone(startIndex, div_name){
		
		var html = '';
		html += '<span style = "font-size : 25px; text-align : center; color : lightgray; font-weight : bolder; margin-left : 35%; ">'
		html += '받으실 선물이 없습니다';
		html += '</span>';
		
		
		div_name.append(html);	
	
}

function toNextAjax(){
	email = $("#email").val().trim();
	searchType = $("#searchType option:selected").val();
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



<style>
div.myProfile-container{
width : 100%;
height : 500px;
background-color : #ebeae5;
border : 1.2px solid #efeded; 
padding-bottom : 80px;

}
div#changable-content{
width : 500px;
height : 30%;
margin: auto;
margin-bottom : 40px;
text-align:center;
line-height: 200px;
padding-top : 100px;
}
.profileImage{
	width:150px;
	height:150px;
	margin:auto;
	border-radius : 100px;
	border : 5px solid white;
	
}

#searchType {
  margin-left : 100px;
  width: 180px;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid white;
  border-radius: 0px;
}
div.myGiftList-container{
margin : auto;
width : 75%;
padding-bottom : 80px;
background : ;
}
div.div-gift{
width: 80%;
height : 30%;
border-radius : 20px;
border : 1px solid lightgray;
margin-bottom : 25px;
padding-top : 15px;
}
div.hidden{
	width: 80%;
	height : 30%;
	border-radius : 20px;
	border : 1px solid lightgray;
	margin-bottom : 25px;
	padding-top : 15px;
	display: none;
}
div#left-content{
float : left;
margin-left : 25px;
margin-top : 15px;

}
div#right-content{
float : right;
margin-top : 20px;
margin-right : 40px;

}
p.title{
font-weight : bolder;
font-size: 25px;
margin-bottom : 40px;
}

div.div-gift:hover{
	position: relative;
    top: -3px;
    left: -3px;
    box-shadow: 5px 5px 15px lightgrey;
    cursor: pointer;
}




</style>

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
<input type="button" value="더보기" class = "btn btn-success" style = "width:1024px; margin: auto;"  onclick = "toNextAjax('${pageContext.request.contextPath}/project/selectMyProjectYet','${memberLoggedIn.email}','div-giftList','div-giftList');" />

</div>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>