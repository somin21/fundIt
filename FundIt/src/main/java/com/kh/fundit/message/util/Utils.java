package com.kh.fundit.message.util;

import org.springframework.web.bind.annotation.SessionAttributes;


public class Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ,String email ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		pageBar += "<form action="+url+" method='post'>";
		pageBar += "<input type='text' name='email' value="+email+" style='display:none'>";
		pageBar += "<input type='text' name='url' value="+url+" style='display:none' >";
		pageBar += "<input type='text' name='cPage' id='myPage' value="+cPage+" style='display:none' >";
		pageBar += "<input type='submit' id='siba' style='display:none' >";
		pageBar += "</form>";
		pageBar += "</ul>";
		
		
		
		pageBar += "<script>";
		
		pageBar += "function fn_paging(cPage,numPerPage){";		
		
		pageBar += "var page = $('#myPage').val();";
		pageBar += "if(page < cPage){";
		pageBar += "cPage = parseInt(page)+(cPage-page);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		pageBar += "else{";
		pageBar += "cPage = parseInt(page)-(page-cPage);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		
		
	/*	pageBar += "location.href='"+url+"?email="+email+"&cPage='+cPage;";*/
		pageBar += "}";
		pageBar += "</script>";
		
		
		return pageBar; 
	}
	
	public static String getPageBar2(int totalContents, int cPage, int numPerPage, String url ,String email,String messageSelect){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "<form action="+url+" method='post'>";
		pageBar += "<input type='text' name='email' value="+email+" style='display:none'>";
		pageBar += "<input type='text' name='url' value="+url+" style='display:none'>";
		pageBar += "<input type='text' name='cPage' id='myPage' value="+cPage+" style='display:none'>";
		pageBar += "<input type='text' name='messageSelect' id='myPage' value="+messageSelect+" style='display:none'>";
		pageBar += "<input type='submit' id='siba' style='display:none'>";
		pageBar += "</form>";
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		
		pageBar += "function fn_paging(cPage,numPerPage){";		
		
		pageBar += "var page = $('#myPage').val();";
		pageBar += "if(page < cPage){";
		pageBar += "cPage = parseInt(page)+(cPage-page);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		pageBar += "else{";
		pageBar += "cPage = parseInt(page)-(page-cPage);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		
		
	/*	pageBar += "location.href='"+url+"?email="+email+"&cPage='+cPage;";*/
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

	public static String getPageBar3(int totalContents, int cPage, int numPerPage, String url ,String email ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "<form action="+url+" method='post'>";
		pageBar += "<input type='text' name='email' value="+email+" style='display:none'>";
		pageBar += "<input type='text' name='url' value="+url+" style='display:none'>";
		pageBar += "<input type='text' name='cPage' id='myPage' value="+cPage+" style='display:none'>";
		pageBar += "<input type='submit' id='siba' style='display:none'>";
		pageBar += "</form>";
		pageBar += "</ul>";
		

		//2.스크립트 태그 작성
		//fn_paging함수
		
		pageBar += "<script>";
		
		pageBar += "function fn_paging(cPage,numPerPage){";		
		
		pageBar += "var page = $('#myPage').val();";
		pageBar += "if(page < cPage){";
		pageBar += "cPage = parseInt(page)+(cPage-page);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		pageBar += "else{";
		pageBar += "cPage = parseInt(page)-(page-cPage);";
		pageBar += "$('#myPage').val(cPage);";
		pageBar += "$('#siba').click();";
		pageBar += "}";
		
		
	/*	pageBar += "location.href='"+url+"?email="+email+"&cPage='+cPage;";*/
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
}
