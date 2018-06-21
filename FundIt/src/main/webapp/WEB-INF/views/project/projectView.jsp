<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<style>
/* body{background-color:#cce2ff; } */
div.ground{background-color: #faf8f8;} 
div.mainDIV{text-align: center;}
div.mainTitle{height: 500px; width: 960px; display: inline-block;}

div.goal{display: inline-block;}
img.mainImg{height: 450px; width: 560px; padding: 10px 20px 0 0px; vertical-align: top;}
div.goal{text-align: left;}
div.notice{border: 1px solid #fafafa; padding: 10px; background-color: #faf8f8;}
span#sp1{font-size: 40px; font-weight: bold;}
span.sp{font-size: 15px; font-weight: bold; padding-bottom:10px; display: inline-block;}
span.sp2{font-size: 14px;}

div.menuDiv{text-align: left; padding: 5px 0 18px 18%; }
div.mainContext{width: 700px;border: 1px solid;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver;}
div.communityDiv{width: 700px;border: 1px solid;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver;}
div.changeDiv{width: 700px;border: 1px solid;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver;}

div.originator{width: 270px;display: inline-block; text-align: left; padding: 15px; background:white; margin: 10px; margin-top: 15px; box-shadow: 1px 1px silver;}
#originatorStory{font-weight: bold; padding-bottom:10px; display: inline-block;}
img.originatorImg{border-radius: 100%; width: 30px; height: 30px;}
.originContext{word-break:break-all; width: 250px; padding-top:15px;}

span#change,#community,#story{padding: 0 10px;}

span.tag{
    font-size: 1.5rem;
    font-weight: 600;
    padding: 1rem;
    color: #757575;
    background-color: #fafafa;
    border: 1px solid #efefef;
    border-radius: 2px;
}
a#tagA:link {color:#757575;}
a#tagA:visited {color:#757575;}
a#tagA:hover {color:black; text-decoration: none;}

/* 후원버튼 시작*/
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 23px;
  padding: 10px;
  width: 270px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 3px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
/* 후원버튼 끝*/
/* 담기버튼 시작 */
.button2 {
    background-color: #4CAF50; /* Green */
    border-radius: 4px;
    border: none;
    color: white;
    padding: 14px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button4 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}
/* 담기버튼 끝*/
</style>
<br />
<hr />
	
    <div class="mainDIV">
	<c:forEach var="i" items="${list }">
        <div class="title">
            <br>
            <span class="tag">
            <c:if test="${i.categoryCode eq 'C1' }">
        		<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C1">게임</a>
	        </c:if>
	        <c:if test="${i.categoryCode eq 'C2' }">
	        	<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C2">푸드</a>
	        </c:if>
	        <c:if test="${i.categoryCode eq 'C3' }">
	        	<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C3">예술</a>
	        </c:if>
	        <c:if test="${i.categoryCode eq 'C4' }">
	        	<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C4">패션</a>
	        </c:if>
	        <c:if test="${i.categoryCode eq 'C5' }">
	        	<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C5">출판</a>
	        </c:if>
	        <c:if test="${i.categoryCode eq 'C6' }">
	        	<a id="tagA" href="${pageContext.request.contextPath}/project/projectList.do?categoryCode=C6">테크놀리지</a>
	        </c:if>
            </span>
            <br />
            <h1>${i.projectTitle }</h1>
        </div>
        <br>
        <div class="mainTitle">
            <img src="${pageContext.request.contextPath }/resources/images/projects/${i.projectImage }" alt="메인사진" class="mainImg">
            <div class="goal">
                모인금액 <br>
                <span id="sp1"><fmt:formatNumber>${i.supportMoney }</fmt:formatNumber></span>원 <br><br>
                남은시간 <br>
                <span id="sp1">${i.deadlineDay }</span>일<br><br>
                후원자 <br>
                <span id="sp1">${i.supportor }</span>명 <br><br>
                <div class="notice">
                
               	<c:if test="${i.deadlineDay le 0 } && ${i.supportGoal le i.supportMoney } ">
                	<span class="sp">펀딩 성공!</span><br />
                    <span class="sp2">목표금액인 <fmt:formatNumber>${i.supportGoal }</fmt:formatNumber>원이 모였습니다.</span><br />
                    <span class="sp2">결제는 <fmt:formatDate value="${i.calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 에 다함께 결제됩니다.</span>
                </c:if>
                <c:if test="${i.deadlineDay le 0 } && ${i.supportGoal gt i.supportMoney }">
                	<span class="sp">펀딩 실패!</span><br />
                    <span class="sp2">목표금액인 <fmt:formatNumber>${i.supportGoal }</fmt:formatNumber>원이 모이지 않았습니다.</span><br />
                    <span class="sp2">결제는 모두 진행되지 않습니다.</span>
                </c:if>
                
                <c:if test="${i.deadlineDay gt 0}" > 
                    <span class="sp">펀딩 진행중</span><br />
                    <span class="sp2">목표금액인 <fmt:formatNumber>${i.supportGoal }</fmt:formatNumber>원이 모여야 결제됩니다.</span><br />
                    <span class="sp2">결제는 <fmt:formatDate value="${i.calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 에 다함께 진행됩니다.</span>
                </c:if>
                
                </div>
                <button class="button" style="vertical-align:middle"><span>후원하기 </span></button><button class="button2 button4"><span class="glyphicon glyphicon-shopping-cart"></span>담아두기</button>
            </div>
        </div>
	</c:forEach>
        <hr />

        <div class="menuDiv">
            <span id="story">스토리</span>   <span id="community">커뮤니티</span>   <span id="change">환불 및 교환</span>
            <input type="hidden" name="hidden" id="hiddenNum" value="1">
        </div>
        <div class="ground">
	        <div class="mainContext">메인글</div>
	        <div class="communityDiv">커뮤니티</div>
	        <div class="changeDiv">환불 및 교환</div>
	        
	        
	        <div class="originator">
	            <span id="originatorStory">창작자 소개</span>
	            <div>
 	                <%-- <img src="${pageContext.request.contextPath }/resources/images/projects/${p.profileImage }" alt="프로필" class="originatorImg"> --%>
 	                <img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="프로필" class="originatorImg">
	                <span class="sp">${p.email }</span>
	                <p class="originContext">${p.profileIntroduce }</p>
	                <button>창작자에게 문의하기</button>
	            </div>
	        </div>
		</div>

    </div>
    <script>
    $(function(){
        $(".communityDiv").hide();
        $(".changeDiv").hide();
        var menuSelect = $("#menuSelect").val();
        var hiddenNum = $("#hiddenNum").val();
        /* 호버했을때 이미지변경 */
        $("#story").hover(function() {
        	   $(this).css("background-color", "#F3F3F3");
        	}, function(){
        	    $(this).css("background-color", "white");
        	});
        $("#community").hover(function() {
     	   $(this).css("background-color", "#F3F3F3");
     	}, function(){
     	    $(this).css("background-color", "white");
     	});
        $("#change").hover(function() {
     	   $(this).css("background-color", "#F3F3F3");
     	}, function(){
     	    $(this).css("background-color", "white");
     	});
        /* 클릭했을때 이미지변경 */
        if(hiddenNum==1){
            $("#story").css({"color": "black", "background-color": "#F3F3F3", "border-bottom": "4px solid black", "padding-bottom": "0"});
        }

        $("#story").click(function(){
            $("#story").css({"color": "black", "background-color": "#F3F3F3", "border-bottom": "4px solid black", "padding-bottom": "0"});
            $("#community").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            $("#change").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            hiddenNum = 1;
            console.log(hiddenNum);
            $(".mainContext").show();
            $(".communityDiv").hide();
            $(".changeDiv").hide();
        });
        $("#community").click(function(){
            $("#story").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            $("#community").css({"color": "black", "background-color": "#F3F3F3", "border-bottom": "4px solid black", "padding-bottom": "0"});
            $("#change").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            hiddenNum = 2;
            console.log(hiddenNum);
            $(".mainContext").hide();
            $(".communityDiv").show();
            $(".changeDiv").hide();
        });
        $("#change").click(function(){
            $("#story").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            $("#community").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            $("#change").css({"color": "black", "background-color": "#F3F3F3", "border-bottom": "4px solid black", "padding-bottom": "0"});
            hiddenNum = 3;
            console.log(hiddenNum);
            $(".mainContext").hide();
            $(".communityDiv").hide();
            $(".changeDiv").show();
        });
    });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	