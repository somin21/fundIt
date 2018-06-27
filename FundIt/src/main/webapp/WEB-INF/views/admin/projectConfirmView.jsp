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
div#nav a, div#nav a:link, div#nav a:visited, div#nav a:active, div#nav a:hover{
	text-decoration: none;
	color: black;
}
div.ground{background-color: #faf8f8; margin: 0 auto; vertical-align: top;height: 600px;} 
div.mainDIV{text-align: center;   }
div.mainTitle{height: 480px; width: 960px; display: inline-block;}
div.sideDiv{display: inline-block; vertical-align: top; }

div.goal{display: inline-block;}
img.mainImg{height: 450px; width: 560px; padding: 10px 20px 0 0px; vertical-align: top;}
div.goal{text-align: left;}
div.notice{border: 1px solid #fafafa; padding: 10px; background-color: #faf8f8;}
span#sp1{font-size: 40px; font-weight: bold;}
span#sp2{font-size: 25px; font-weight: bold;}
span.sp{font-size: 15px; font-weight: bold; padding-bottom:10px; display: inline-block;}
span.sp2{font-size: 14px;}

div.menuDiv{text-align: left; padding: 5px 0 18px 18%; }
div.mainContext{width: 60%; height:200px; display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver; margin-bottom: 30px; }
div.changeDiv{ width:60%;border: 1px solid;display: inline-block; background:white; margin-top: 15px; box-shadow: 1px 1px silver; }

div.originator{width: 270px;display: inline-block; text-align: left; padding: 15px; background:white; margin: 10px; margin-top: 15px; box-shadow: 1px 1px silver;}
#originatorStory{font-weight: bold; padding-bottom:10px; display: inline-block;}
img.originatorImg{border-radius: 100%; width: 30px; height: 30px;}
.originContext{word-break:break-all; width: 250px; padding-top:15px;}

div.gift{width: 270px; display: inline-block; background: white; box-shadow: 1px 1px silver; text-align: center;}
div.gift2{width: 240px; display: inline-block; text-align:left; padding-top: 10px; padding-bottom: 10px;}

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

a#tagA2:link {color:black;}
a#tagA2:visited {color:black;}
a#tagA2:hover {color:#757575; text-decoration: none;}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 23px;
  padding: 10px;
  width: 40%;
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
@media (max-width: 800px){
	img.mainImg{display: block; padding-bottom: 20px; }
	div.mainTitle{width: 500px;}
}
</style>
<jsp:include page="/WEB-INF/views/admin/header.jsp" />
    <div class="mainDIV">
	<c:forEach var="i" items="${list }">
        <div class="title">
            <h1>${i.projectTitle }</h1>
        </div>
        <br>
        <div class="mainTitle">
            <img src="${pageContext.request.contextPath }/resources/images/projects/${i.projectImage }" alt="메인사진" class="mainImg">
            <div class="goal">
                모인금액 <br>
                <span id="sp1">0</span>원 <br><br>
                남은시간 <br>
                <span id="sp1">0</span>일<br><br>
                후원자 <br>
                <span id="sp1">0</span>명 <br><br>
                <div class="notice">
                
                    <span class="sp">승인 대기</span><br />
                    <span class="sp2">목표금액인 <fmt:formatNumber>${i.supportGoal }</fmt:formatNumber>원이 모여야 결제됩니다.</span><br />
                    <span class="sp2">결제는 <fmt:formatDate value="${i.calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 에 다함께 진행됩니다.</span>
                
                </div>
               
                <button class="button" style="vertical-align:middle" onclick="fn_projectConfirmY('${i.projectNo}');"><span>승인</span></button>
                <button class="button" style="vertical-align:middle" onclick="fn_projectConfirmF('${i.projectNo}');"><span>거절</span></button>
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
	</c:forEach>
        <hr />

        <div class="menuDiv">
	            <span id="story">스토리</span>   <span id="community">커뮤니티</span>   <span id="change">환불 및 교환</span>
	            <input type="hidden" name="hidden" id="hiddenNum" value="1">
	        </div>
	        <div class="ground">
		        <div class="mainContext">
		        <c:forEach var="i" items="${list }">
					${i.story }
				</c:forEach>
				</div>
		        
		        <div class="changeDiv">환불 및 교환 sdfaf</div>
		        
		        <div class="sideDiv">
		        <div class="originator">
		            <span id="originatorStory">창작자 소개</span>
		            <div>
	 	                <img src="${pageContext.request.contextPath }/resources/upload/profileImg/${p.profileImage != null ? p.profileImage: 'profile.png' }" alt="프로필" class="originatorImg">
		                <span class="sp"><a id="tagA2" href="${pageContext.request.contextPath }/project/originatorView.do?email=${p.email}" >${p.email }</a></span>
		                <p class="originContext">${p.profileIntroduce }</p>
		                <hr />
		                <button class="button2 button3" ><i style="font-size:24px" class="fa">&#xf0e0;</i> 창작자에게 문의하기</button>
		            </div>
		        </div>
		        
		        <c:if test="${deadlineDay gt 0 }">
		        <c:if test="${not empty List}">
		        <c:forEach var="v" items="${List }">
		        <br /><br />
		        <div class="gift">
		        	<div class="gift2">
		        	<ul>
		        		<li>
		        			<span id="sp2">${v.minMoney }원 +</span>
		        		</li>
		        		<li>
		        			${v.itemName }.(X${v.itemnumber })
		        		</li>
		        		<li>
		        			예상전달일 <fmt:formatDate value="${calculateduedDate }" pattern="yyyy년 MM월 dd일"/> 후 순차배송됩니다.
		        		</li>
		        		<hr />
		        	</ul>
		        		<button class="button2 button3">선물 선택하고 후원하기</button>
		        	</div>
		        </div>
		        </c:forEach>
		        </c:if>
		        
		        <c:if test="${empty List }">
		        <br /><br />
		        <div class="gift">
		        	<div class="gift2">
		        	<ul>
		        		<li>
		        			상품없이 지원자를 후원하는 프로젝트입니다.
		        		</li>
		        		<hr />
		        	</ul>
		        		<button class="button2 button3">후원하기</button>
		        	</div>
		        </div>
		        </c:if>
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