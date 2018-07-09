<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
body{
	user-select: none;
	overflow-x: hidden;
}
div.ground{background-color: #f7f5f5; margin: 0 auto; vertical-align: top;} 
div.mainDIV{text-align: center; }
div.mainTitle{height: 520px; width: 960px; display: inline-block;}
div.sideDiv{display: inline-block; vertical-align: top; padding-bottom: 50px;}

div.goal{display: inline-block;}
img.mainImg{height: 450px; width: 560px; padding: 10px 20px 0 0px; vertical-align: top;}
div.goal{text-align: left;}
div.notice{border: 1px solid #fafafa; padding: 10px; background-color: #faf8f8;margin: 10px 0;}
span#sp1{font-size: 40px; font-weight: bold;}
span#sp2{font-size: 25px; font-weight: bold;}
span.sp{font-size: 15px; font-weight: bold; padding-bottom:10px; display: inline-block;}
span.sp2{font-size: 14px;}

span#story:hover{cursor: pointer;}
span#community:hover{cursor: pointer;}
span#change:hover{cursor: pointer;}

div.menuDiv{text-align: left; padding: 5px 0 18px 18%; }
div.mainContext{width: 700px;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver; margin-bottom: 30px; padding: 30px; text-align: left;}

div.communityDiv{width: 700px;display: inline-block; background:#faf8f8; margin-top: 15px; }
div.communityS{width: 700px; display: inline-block; padding-bottom:10px; padding-top:10px; background:white; margin-top: 15px; box-shadow: 1px 1px silver;}
div.communityMain{width: 700px;display: inline-block; background:#faf8f8; margin-top: 15px;}
div.community{background: white; box-shadow: 1px 1px silver; text-align: left; padding-left: 30px; padding-bottom:10px; padding-top:10px;}

div.changeDiv{width: 700px;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver; padding:30px;text-align:left;}
span.refundSp{font-weight: bold;}

div.originator{width: 270px;display: inline-block; text-align: left; padding: 15px; background:white; margin: 10px; margin-top: 15px; box-shadow: 1px 1px silver;}
#originatorStory{font-weight: bold; padding-bottom:10px; display: inline-block;}
img.originatorImg{border-radius: 100%; width: 30px; height: 30px;}
.originContext{word-break:break-all; width: 250px; padding-top:15px;}

div.gift{width: 270px; display: inline-block; background: white; box-shadow: 1px 1px silver; text-align: center;}
div.gift2{width: 240px; display: inline-block; text-align:left; padding-top: 10px; padding-bottom: 10px;}

span#change,#community,#story{padding: 0 10px;}

span.tag{
    font-size: 15px;
    font-weight: 600;
    padding: 10px;
    color: #757575;
    background-color: #fafafa;
    border: 1px solid #efefef;
    border-radius: 2px;
}
a#tagA:link {color:#757575;}
a#tagA:visited {color:#757575;}
a#tagA:hover {color:black; text-decoration: none;}

a#tagA2:link {color:black;}
a#tagA2:visited {color:black;}
a#tagA2:hover {color:#757575; text-decoration: none;}
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
  width: 150px;
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
.disabled {
    opacity: 0.6;
    cursor: not-allowed;
}
/* 후원버튼 끝*/
/* 후원버튼취소 시작 */
.delbutton{
	background: #e7e7e7;
	color:rgba(50,100,100,100);
	font-weight: bold;
}
.delbutton:hover {
  background: #d9d9d9;
	color:black;
}
/* 후원버튼취소 끝 */
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
.button3 {
    background-color: #e7e7e7;
    color: rgba(50,100,100,100);
    border: 2px solid #e7e7e7;
    padding: 8px 8px;
    width: 100%;
    font-weight: bold;
}

.button4 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}
.button3:hover {background-color: #d9d9d9; color:black;}
/* 담기버튼 끝*/

@media (max-width: 800px){
	img.mainImg{display: block; padding-bottom: 20px; }
	div.mainTitle{width: 500px;}
}
div.mainContext video{
	max-width : 640px;
}
div.mainContext img{
	max-width : 640px;
}
</style>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />
    <div class="mainDIV">
	
        <div class="title">
         	<br>
            <span class="tag">${view.categoryName }</span>
            <br /><br />
            <h1>${view.projectTitle }</h1>
        </div>
        <br>
        <div class="mainTitle">
            <img src="${pageContext.request.contextPath }/resources/images/projects/${view.projectImage }" alt="메인사진" class="mainImg">
            <div class="goal">
                모인금액 <br>
                 <span id="sp1">0</span>원<br><br>
                남은시간 <br>
                 <span id="sp1">0</span>일<br><br>
                후원자 <br>
                <span id="sp1">0</span>명 <br><br>
                <div class="notice">
                    <span class="sp">승인 대기</span><br />
                    <span class="sp2">목표금액인 <fmt:formatNumber>${view.supportGoal }</fmt:formatNumber>원이 모여야 결제됩니다.</span><br />
                    <span class="sp2">결제는 <fmt:formatDate value="${view.calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 에 다함께 진행됩니다.</span>
                </div>
               
                <button class="button" style="vertical-align:middle" onclick="fn_projectConfirmY('${view.projectNo}');"><span>승인</span></button>
                <button class="button" style="vertical-align:middle" onclick="fn_projectConfirmF('${view.projectNo}');"><span>거절</span></button>
                <script>
                function fn_projectConfirmY(no){
                   location.href="${pageContext.request.contextPath}/admin/projectConfirmY.do?no="+no;
                }
                function fn_projectConfirmF(no){
                   location.href="${pageContext.request.contextPath}/admin/projectConfirmF.do?no="+no;
                }
                </script>
                

            </div>
        </div>
	
        <hr />

        <div class="menuDiv">
	            <span id="story">스토리</span>   <span id="community">커뮤니티</span>   <span id="change">환불 및 교환</span>
	            <input type="hidden" name="hidden" id="hiddenNum" value="1">
	        </div>
	        <div class="ground">
		        <div class="mainContext">
		        <c:if test="${view.movie ne null }">
		        	<video src="${pageContext.request.contextPath }/resources/images/projects/${view.movie }" autoplay controls style="margin-bottom: 50px;"></video><br />
		        </c:if>
		        ${view.story }
		        </div>
		        
		        <div class="changeDiv">
		        	<span class="refundSp">이 프로젝트의 환불 및 교환 정책</span><br />
		        	<hr />
		        	<br />
		        	<span>${view.refund }</span>
		        	<br /><br />
		        </div>
		        
		        <div class="sideDiv">
		        <div class="originator">
		            <span id="originatorStory">창작자 소개</span>
		            <div>
	 	                <img src="${pageContext.request.contextPath }/resources/upload/profileImg/${p.profileImage }" alt="프로필" class="originatorImg">
		                <span class="sp">${p.email }</span>
		                <p class="originContext">${p.profileIntroduce }</p>
		                <hr />
		                <button class="button2 button3" ><i style="font-size:24px" class="fa">&#xf0e0;</i> 창작자에게 문의하기</button>
		            </div>
		        </div>
		        
		        <c:if test="${not empty mList}">
		        <c:forEach var="m" items="${mList }" >
				<br /><br />
		        <div class="gift">
		        	<div class="gift2">
        				<span id="sp2"><fmt:formatNumber>${m }</fmt:formatNumber>원 +</span>
			        	<ul>
			        		<c:forEach var="g" items="${gList }">
			        			<c:if test="${g.minMoney eq m }">
			        				<li>${g.itemName } (X ${g.itemnumber })</li>
			        			</c:if>
			        		</c:forEach>
			        		<hr />
			        	</ul>
	        			<span style="font-size:13px;color=#797979;">예상전달일<br><fmt:formatDate value="${view.calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 후 순차배송됩니다.</span>
		        		<button class="button2 button3" >선물 선택하고 후원하기</button>
		        	</div>
		        </div>
				</c:forEach>
				</c:if>
				
		        <c:if test="${empty mList }">
		        <br /><br />
		        <div class="gift">
		        	<div class="gift2">
		        		<span style="font-size:13px;color=#797979;">상품없이 지원자를 후원하는 프로젝트입니다.</span>
		        		<button class="button2 button3">후원하기</button>
		        	</div>
		        </div>
		        </c:if>
		        
	        </div>
	        
		</div>

    </div>
     <script>
    $(function(){
        $(".changeDiv").hide();
        var menuSelect = $("#menuSelect").val();
        var hiddenNum = $("#hiddenNum").val();
        /* 호버했을때 이미지변경 */
        $("#story").hover(function() {
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
            $("#change").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            hiddenNum = 1;
            $(".mainContext").show();
            $(".changeDiv").hide();
        });
        $("#change").click(function(){
            $("#story").css({"color": "black", "background-color": "white", "border-bottom": "0px solid black", "padding-bottom": "0"});
            $("#change").css({"color": "black", "background-color": "#F3F3F3", "border-bottom": "4px solid black", "padding-bottom": "0"});
            hiddenNum = 3;
            $(".mainContext").hide();
            $(".changeDiv").show();
        });
        
    });
   
    
    </script>

<jsp:include page="/WEB-INF/views/admin/footer.jsp" />