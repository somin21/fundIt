<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-make-project.css" />


<script>
$(function(){
	
	/* 파일업로드 버튼 */
	$(".hiddenInput").parent().css("text-align","left");
	$(".uploadBtn").click(function(){
		$(this).next("input[type=file]").click();
	});
	
	/* 영역 클릭 시 다른 영역 보여주기 */
	$(".make-project-content div.shown").on("click",function(){
		$(".make-project-content").children(".shown").slideDown(500);
		$(".make-project-content").children(".hidden").slideUp(500);
		$(this).slideUp(500);	
		$(this).next(".hidden").slideDown(500);
		$(this).next(".hidden").attr("style","display:block!important");
		
	});
	
	/* 글자 수 세기 */
	$(".letter-cnt").prev().keyup(function(){
		
		var value = $(this).val();
		var length = value.length;
		var letter = $(this).next().children(".total-letter").text();
		
		if(length > letter){
			var cnt = length - letter;
			$(this).css("border-color","red");
			$(this).next().css({"color":"red","font-weight":"bold"});
			$(this).next().html('<span class="total-letter">'+letter+'</span><span class="cnt">'+cnt+'</span>자 초과하였습니다');
			$(this).parents(".hidden").find(".saveBtn").attr("disabled","disabled");
		} else {
			var cnt = letter - length;
			$(this).css("border-color","#ccdafc");
			$(this).next().css({"color":"darkgray","font-weight":"normal"});
			$(this).next().html('<span class="total-letter">'+letter+'</span><span class="cnt">'+cnt+'</span>자 남았습니다');
			$(this).parents(".hidden").find(".saveBtn").removeAttr("disabled");
		}

		$(this).next().children(".total-letter").hide();
	});
	
	/* 닫기 버튼 */
	$(".closeBtn").on("click",function(){
		
		var elem = $(this).parent().prev().children();

		var firstSpan = $(this).parents(".hidden").prev(".shown").children("p").last().children("span").first();
		var lastSpan = $(this).parents(".hidden").prev(".shown").children("p").last().children("span").last();
		
		var total = $(this).parent().prev().children(".letter-cnt").children(".total-letter").text();
		var cnt = firstSpan.text().length;
		
		console.log(total);
		console.log(cnt);
		
		if(firstSpan.css("font-size") != "13px"){

			elem.each(function(){
										
				if($(this).prop("tagName") == "TEXTAREA"){

					$(this).val(firstSpan.text());
				
				} else if($(this).prop("tagName") == "SELECT"){
					
					$(this).children("option").each(function(){
										
						if(firstSpan.text() == $(this).text()){
							$(this).parent().val($(this).val());
						}
					});
								
				} else if($(this).prop("tagName") == "INPUT"){
					
					if($(this).attr("id") == "funding-money"){
						
						var change = firstSpan.text().replace(/,/g,"");
						change = change.replace(/원/,"");
						$(this).val(change.trim());
						$("#money-warning").css("display","none");
						$(this).css("border-color","#ccdafc");
						$(this).parent().next().children(".saveBtn").removeAttr("disabled");
						
					} else{
						$(this).val(firstSpan.text());
					}
					
				}
				
				if($(this).attr("class") == "letter-cnt"){
					console.log("cnt수정해라");
					$(this).html('<span class="total-letter" style="display:none">'+total+'</span><span class="cnt">'+(total-cnt)+'</span>자 남았습니다');
				}
			});
			
	
		} else {

			elem.each(function(){
				
				if($(this).prop("tagName") == "TEXTAREA"){
					
						$(this).val("");
				
				} else if($(this).prop("tagName") == "SELECT"){
														
					$(this).val("");
								
				} else {
					
					if($(this).attr("id") == "funding-money"){
						$(this).val("0");	
					} else if($(this).attr("id") == "deadline-date"){
						
						var tomorrow = new Date();
						tomorrow.setDate(tomorrow.getDate()+1);
						
						var day = tomorrow.getDate();
						var month = tomorrow.getMonth()+1;
						var year = tomorrow.getFullYear();
						
						if(day<10){
							day = "0"+day;
						}
						if(month<10){
							month = "0"+month;
						}
						
						$(this).val(year+"-"+month+"-"+day);
						
					} else {
						$(this).val("");
					}
				}
				
				if($(this).attr("class") == "letter-cnt"){
					console.log("cnt없애라");
					$(this).html('<span class="total-letter">'+total+'</span>자 남았습니다');
				}
			});
		}
		
		$(this).parent().prev().children().not("span").css("border-color","#ccdafc");
		$(this).parent().prev().children(".letter-cnt").css({"color":"darkgray","font-weight":"normal"});
		
		$(this).parents(".hidden").slideUp(500);
		$(this).parents(".hidden").prev(".shown").slideDown(500);
	});
	
	
	/* 저장 버튼 */
	$(".saveBtn").on("click",function(){
		
		
		var elem = $(this).parent().prev().children();
		var place = $(this).parents(".hidden").prev(".shown").children("p").last();
		var summerPlace = $(this).parents(".hidden").prev(".shown").find("#story");

		var noSlide = false;
		
		var isSummer = false;
		var html = "";
		
		if(elem.first().prop("tagName") != "SPAN" && elem.first().prop("tagName") != "BUTTON"){
			if(elem.first().val() == "" || elem.first().val() == "0" || elem.first().val() == null){
				console.log("save실패");
				console.log(elem.first().prop("tagName"));
				return;
			} 
		}
		
		elem.each(function(){
			
			if($(this).prop("tagName") == "INPUT" && $(this).attr("class") == "hiddenInput"){
				
				if($(this).val() == "" || $(this).val() == null){
					alert("파일을 선택해 주세요");
					noSlide = true;
				} else {
					
					var imgSRC = $(this).next("img").attr("src");
					
					if($(this).attr("id") == "project-movie"){
						
						var movieSRC = $(this).next("video").attr("src");
						$(this).next("video").trigger('pause');
						html = '<span><video src="'+movieSRC+'" muted controls id="previewMovie" style="width:540px;height:360px;">영상이 지원되지 않는 브라우저입니다</video></span><span></span>';
						
					} else if($(this).attr("id") == "profile-image"){
						html = '<span><img src="'+imgSRC+'" class="uploadImg rounded-circle" style="width: 250px;height: 250px;"></span><span></span>';
					} else {
						html = '<span><img src="'+imgSRC+'" class="uploadImg" style="width:400px;height:300px;"></span><span></span>';
					}
				}
				
			} else if($(this).prop("tagName") == "TEXTAREA"){
				
				if($(this).val().trim().length > 0){
					
					if($(this).attr("id") == "summernote"){
						
						isSummer = true;
						html = $(this).val();
						summerPlace.css({"overflow":"hidden","text-overflow":"ellipsis"});
						
					} else {
						place.css({"overflow":"hidden","text-overflow":"ellipsis","white-space":"nowrap","color":"black","font-size":"20px","font-weight":"bold"});
						html = "<span style='font-weight:bold;font-size:20px;color:black;'>"+$(this).val()+"</span><span style='font-size:13px;color:#dc3545;font-weight:normal;'></span>";
					}
				} else {
					
					alert("내용을 입력하세요");
					$(this).val("");
					$(this).next(".letter-cnt").find(".total-letter").show();
					$(this).next(".letter-cnt").find(".cnt").hide();
					noSlide = true;
				}
			
			} else if($(this).prop("tagName") == "SELECT"){
				
				var text = "";
				$(this).children("option").each(function(){
					
					if($(this).val() == $(this).parent().val()){
						text = $(this).text();
					}
				});
				
				html = "<span style='font-weight:bold;font-size:20px;color:black;'>"+text+"</span><span></span>";
				
			} else if($(this).prop("tagName") == "INPUT"){
				
				if($(this).val().trim().length <= 0){
					
					alert("내용을 입력하세요");
					$(this).val("");
					$(this).next(".letter-cnt").find(".total-letter").show();
					$(this).next(".letter-cnt").find(".cnt").hide();
					noSlide = true;
					
				} else if($(this).attr("id") == "funding-money"){
					
					html = "<span style='font-weight:bold;font-size:20px;color:black;'>"+numberWithCommas($(this).val()) + " 원"+"</span><span></span>";
				
				} else {
					
					html = "<span style='font-weight:bold;font-size:20px;color:black;'>"+$(this).val()+"</span><span></span>";
					
					if($(this).attr("id") == "deadline-date"){
						
						var d = new Date();
						d.setFullYear($(this).val().substring(0,4));						
						d.setMonth($(this).val().substring(5,7)-1);
						d.setDate($(this).val().substring(8,10));
						d.setDate(d.getDate()+7);
						
						var text = "펀딩에 성공할 경우, 마감일 다음날부터 7일간 결제가 진행되어 "+d.getFullYear()+"년 "+(d.getMonth()+1)+"월 "+d.getDate()+"일에 모든 후원자의 결제가 종료됩니다.<br>";
						text += "결제 종료일로부터 추가로 7일 후 모금액이 창작자님의 계좌로 입금됩니다.";
						
						d.setDate(d.getDate()+14);
						var day = d.getDate();
						var month = d.getMonth()+1;
						var year = d.getFullYear();
						
						if(day<10){
							day = "0"+day;
						}
						if(month<10){
							month = "0"+month;
						}
						
						var d_date = year+"-"+month+"-"+day;
						
						text += '<input type="hidden" name="calculateDueDate" value="'+d_date+'" />';
						
						$("#fund-duedate").html(text);
						$("#fund-duedate").css({"text-align":"left","padding-top":"30px"});
					}
				}
			}
		});
		
		var rightHTML = '<img src="${pageContext.request.contextPath }/resources/images/makeProject/write.png" />&nbsp;<span>수정하기</span>';
		
		if(!noSlide){
			if(isSummer){
				
				summerPlace.html(html);
				summerPlace.css("display","inline-block");
				summerPlace.children("p").first().css("font-weight","normal");
				summerPlace.children("p").last().css({"font-size":"15px","color":"#000"});
				summerPlace.children("p").find("span").last().css("float","none");
				place.html("<span></span><span>"+rightHTML+"</span>");
				
			} else {
				place.html(html);		
				place.children("span").last().html(rightHTML);
			}
	
			$(this).parents(".hidden").slideUp(500);
			$(this).parents(".hidden").prev(".shown").slideDown(500);
		}
		
	});
})
</script>

<script>
/* 천단위 콤마 포맷 */
function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}

/* 사진 미리보기 */
function previewImage(fileObj, imgPreviewId) {
    var allowExtention = ".jpg,.bmp,.gif,.png";  //allowed to upload file type
    /* document.getElementById("hfAllowPicSuffix").value; */
    var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
    var browserVersion = window.navigator.userAgent.toUpperCase();
    if (allowExtention.indexOf(extention) > -1) {
        if (fileObj.files) {
            if (window.FileReader) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
                };
                reader.readAsDataURL(fileObj.files[0]);
            } else if (browserVersion.indexOf("SAFARI") > -1) {
                alert("don't support  Safari6.0 below broswer");
            }
        } else if (browserVersion.indexOf("MSIE") > -1) {
            if (browserVersion.indexOf("MSIE 6") > -1) {//ie6
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
            } else {//ie[7-9]
                fileObj.select();
                fileObj.blur(); 
                var newPreview = document.getElementById(imgPreviewId);

                newPreview.style.border = "solid 1px #eeeeee";
                newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                newPreview.style.display = "block";

            }
        } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
            var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
            if (firefoxVersion < 7) {//firefox7 below
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());
            } else {//firefox7.0+ 
                document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));
            }
        } else {
            document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
        }
    } else {
        alert(allowExtention + "\n위 형식만 지원 가능합니다");
        fileObj.value = ""; //clear Selected file
        if (browserVersion.indexOf("MSIE") > -1) {
            fileObj.select();
            document.selection.clear();
        }

    }
    var css = "width:400px;height:300px;display:auto;";
    document.getElementById(imgPreviewId).setAttribute("style",css);
}
</script>

<script>
$(function(){
	
	$("#confirmProject").on("click",function(){
		
		var validate = false;
		
		var checkEl = $(".make-project-title").find("img").last();
			
		if(checkEl.attr("src") == "${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png"){
			validate = true;
		} else {
			validate = false;
		}
			
		
		if(validate){
			location.href = "${pageContext.request.contextPath}/project/confirm?projectNo=${projectNo}";
		} else {
			alert("프로젝트 내용이 완성되지 않았습니다.\n완성 후 다시 검토 요청해주십시오");
		}
		
	});
	
});
</script>


<div id="make-project">
	
	<div class="make-project-notice">
		<div class="alert alert-primary" role="alert">
		  펀딩 준비에 앞서 
		  공개 검토 가이드라인, 
		  펀드잇 커뮤니티 운영원칙
		  을 확인해주세요.
		</div>
		<div class="alert alert-secondary" role="alert">
		  프로젝트를 개설하려면 네 개의 섹션을 완성해야 합니다. 해당 섹션을 완성해야 다음 섹션으로 넘어갈 수 있습니다.
		</div>
		<div class="alert alert-secondary" role="alert">
		 내용을 입력한 뒤 하단의 "저장" 버튼을 눌러야 저장이 되며, 저장 후 다음 섹션으로 이동합니다.
		</div>
		<div class="alert alert-secondary" role="alert">
		  완성된 섹션은 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" /> 
		  탭 아이콘에 
		 <img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" /> 
		  파랗게 체크가 됩니다.
		</div>
	</div>
	
	<div class="make-project-btn">
		<button type="button" id="confirmProject">
			<img src="${pageContext.request.contextPath }/resources/images/makeProject/paper-plane.png" />
			검토 요청하기
		</button>
	</div>
	
	<div class="make-project-title">
	
		<c:if test="${param.sectionName eq 'outline' }">
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'funding-gift' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'story' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'account' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				스토리텔링
			</div>
			<div class="section-title selected-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/empty_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
		<c:if test="${param.sectionName eq 'complete' }">
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				프로젝트 개요
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				펀딩 및 선물 구성
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				스토리텔링
			</div>
			<div class="section-title">
				<img src="${pageContext.request.contextPath }/resources/images/makeProject/check_circle.png" />
				계좌 설정
			</div>
		</c:if>
		
	</div>
	
	
	<div class="make-project-contents" >
	
	
		
	
