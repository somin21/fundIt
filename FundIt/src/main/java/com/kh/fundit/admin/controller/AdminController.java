package com.kh.fundit.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kh.fundit.admin.model.service.AdminService;
import com.kh.fundit.admin.model.vo.AdminMember;
import com.kh.fundit.admin.model.vo.AdminMessage;
import com.kh.fundit.admin.model.vo.AdminProjectView;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectGift;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 index
	@RequestMapping("/admin")
	public String adminLogin() {
		
		return "admin/adminIndex";
	}
	
	//모든 프로젝트 리스트 보기 -index선택
	@RequestMapping("/admin/indexProject") // 모든 프로젝트.
	public ModelAndView indexProject(HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		List<ListProjectView> list = adminService.indexProject();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	//인덱스 선택 업뎃
	@RequestMapping(value="/admin/indexProjectEnd" , method = RequestMethod.GET)
	public ModelAndView indexProjectEnd(@RequestParam(value="no", required=false) String no, 
										HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		//배열에다가 다시 넣고 그 배열 그대로 가져가서 sql에서  배열이름[0]으로 넣어주면됨
		System.out.println(no);
		String proNo0 = no.split(",")[0];
		String proNo1 = no.split(",")[1];
		String proNo2 = no.split(",")[2];
		String proNo3 = no.split(",")[3];
		System.out.println("pronNo0"+ proNo0 );
		String arr[] = {proNo0, proNo1, proNo2, proNo3};
		int result = adminService.updateIndexYN(arr);
		String msg="";
		String loc="/";
		if(result==4) {
			msg="수정 성공!";
			loc="/admin/indexProject";
		}else {
			msg="실패!";
			loc="/admin/indexProject";
		}
		mav.addObject("msg", msg);
	    mav.addObject("loc", loc);
	    mav.setViewName("common/msg");
	    
		return mav;
	}
	
	//프로젝트 승인대기 리스트 보기
	@RequestMapping("/admin/projectConfirmList")
	public ModelAndView projectConfirmList(HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		List<ListProjectView> list = adminService.projectConfirmList();
		
		mav.addObject("list",list);
		mav.setViewName("admin/projectConfirmList");
		
		return mav;
	}
	
	// 프로젝트 선택해서 프로젝트 보기
	@RequestMapping("/admin/projectConfirmView")
	public ModelAndView projectConfirmListEnd(@RequestParam("projectNo") int no,
											  HttpServletResponse response)	{
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",no);
		
		//프로젝트리스트뽑기
		List<AdminProjectView> list = adminService.adminProjectView(map);
		
		//선물리스트 받아오기
		List<ProjectGift> gList = adminService.projectGiftList(map);
		String userEmail = "";
		Date calculateduedDate = null;
		for(AdminProjectView v : list) {
			userEmail = v.getEmail();
			calculateduedDate = v.getCalculateduedDate();
		}
		Profile p = adminService.profileUser(userEmail);
		
		mav.addObject("list",list);
		mav.addObject("gList",gList);
		mav.addObject("p",p);
		mav.addObject("projectNo",no);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.setViewName("admin/projectConfirmView");
		
		return mav;

	}
	
	//프로젝스 승인하기
	@RequestMapping("/admin/projectConfirmY")
	public ModelAndView projectConfirmY(@RequestParam String no) {

		ModelAndView mav = new ModelAndView();
		
		int result = adminService.projectConfirmY(no);
		
		String msg="";
		String loc="/";
		if(result>0) {
			msg="프로젝트를 승인하였습니다.!";
			loc="/admin/projectConfirmList";
		}else {
			msg="실패!";
			loc="redirect:/";
		}
		mav.addObject("msg", msg);
	    mav.addObject("loc", loc);
	    mav.setViewName("common/msg");
		return mav;
	}
	
	//프로젝트 거절하기
	@RequestMapping("/admin/projectConfirmF")
	public ModelAndView projectConfirmF(@RequestParam String no) {
		
		ModelAndView mav = new ModelAndView();
		
		int result = adminService.projectConfirmF(no);
		
		String msg="";
		String loc="/";
		if(result>0) {
			msg="프로젝트를 거절하였습니다.!";
			loc="/admin/projectConfirmList";
		}else {
			msg="실패!";
			loc="redirect:/";
		}
		mav.addObject("msg", msg);
	    mav.addObject("loc", loc);
	    mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("/admin/projectDeadlineList")
	public ModelAndView projectDeadlineList() {
		ModelAndView mav = new ModelAndView();
		
		List<ListProjectView> list = adminService.projectDeadLineList();
		
		mav.addObject("list",list);
		mav.setViewName("admin/projectDeadlineList");
		
		return mav;
	}
	
	@RequestMapping("admin/projectDeadlineView")
	public ModelAndView projectDeadlineView(@RequestParam("projectNo") int no,
			  								 HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",no);
		
		//프로젝트리스트뽑기
		List<AdminProjectView> list = adminService.projectDeadlineView(map);
		
		//선물리스트 받아오기
		List<ProjectGift> gList = adminService.projectGiftList(map);
		String userEmail = "";
		Date calculateduedDate = null;
		int deadlineDay = 0;
		
		for(AdminProjectView v : list) {
			userEmail = v.getEmail();
			calculateduedDate = v.getCalculateduedDate();
			deadlineDay = v.getDeadlineDay();
		}
		Profile p = adminService.profileUser(userEmail);
		
		mav.addObject("list",list);
		mav.addObject("gList",gList);
		mav.addObject("p",p);
		mav.addObject("projectNo",no);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.addObject("deadlineDay",deadlineDay);
		mav.setViewName("admin/projectDeadlineView");
		
		return mav;
	}
	
	@RequestMapping("/admin/adminMemberList")
	public ModelAndView adminMember() {
		ModelAndView mav = new ModelAndView();
		
		List<AdminMember> list = adminService.memberList();
		mav.addObject("list", list);
		
		mav.setViewName("admin/adminMemberList");
		return mav;
	}
	
	@RequestMapping("/admin/adminMemberDelete")
	public ModelAndView adminMemberDelete(@RequestParam String email){
		
		ModelAndView mav = new ModelAndView();
		
		int result = adminService.adminMemberDelete(email);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg= email+"회원을 삭제하였습니다.!";
			
		}else {
			msg="삭제 실패!";
		}
		loc="/admin/adminMemberList";
		
		mav.addObject("msg", msg);
	    mav.addObject("loc", loc);
	    mav.setViewName("common/msg");
		return mav;
	}
	
	//검색
	@RequestMapping("/admin/adminMemberSearch.do")
	public ModelAndView adminMemberSearch(@RequestParam String email, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		List<AdminMember> list = adminService.memberSearchList(email);
		
		map.put("list", list);
		mav.addAllObjects(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/admin/messageList.do")
	public ModelAndView adminMessageList() {
		ModelAndView mav = new ModelAndView();
		
		List<AdminMessage> list = adminService.adminMessageList();
		mav.addObject("list",list);
		mav.setViewName("admin/adminMessageList");
		
		return mav;
	}
	@RequestMapping("/admin/selectMessage.do")
	public ModelAndView selectMessage(@RequestParam String messageNo, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		
		AdminMessage m = adminService.selectMessage(messageNo);
		
		map.put("m",m);
		mav.addAllObjects(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping("/admin/selectAllMessage.do")
	@ResponseBody
	public Map<String,Object> selectAllMessage(HttpServletResponse response)throws JsonProcessingException{
		Map<String,Object> map = new HashMap<>();
		
		List<AdminMessage> list = adminService.adminMessageList();
		map.put("list", list);
		
		return map;
	}
	@RequestMapping("/admin/selectReadN.do")
	@ResponseBody
	public Map<String,Object> selectReadN( HttpServletResponse response)throws JsonProcessingException{
		Map<String,Object> map = new HashMap<>();
		
		List<AdminMessage> list = adminService.selectReadN();

		map.put("list", list);
		
		return map;
	}
	@RequestMapping("/admin/reply.do")
	@ResponseBody
	public Map<String,Object> replyMessage(@RequestParam String replyReceiveEmail, @RequestParam String replySendEmail, @RequestParam String content, HttpServletResponse response) throws JsonProcessingException{
		
		Map<String,Object> map = new HashMap<>();
		
		Map<String,String> map1 = new HashMap<>();
		map1.put("replyReceiveEmail", replyReceiveEmail);
		map1.put("replySendEmail", replySendEmail);
		map1.put("content", content);
		
		int result = adminService.replyMessage(map1);
		if(result>0) {
			map.put("map1", map1);
		}
		return map;
	}
	
	@RequestMapping("/admin/readY.do")
	@ResponseBody
	public Map<String,Object> readY(@RequestParam String messageNo, HttpServletResponse response) throws IOException{
		
		Map<String,Object> map = new HashMap<>();
		
		int result = adminService.updateReadyn(messageNo);

		List<AdminMessage> list = adminService.adminMessageList();
		
		map.put("list", list);
		return map;
	}
	@RequestMapping("/admin/adminMessageSearch.do")
	@ResponseBody
	public Map<String,Object> adminMessageSearch(@RequestParam String content, HttpServletResponse response) throws IOException{
		Map<String,Object> map = new HashMap<>();
		List<AdminMessage> list = adminService.adminMessageSearch(content);
		System.out.println("##############");
		System.out.println(list);
		map.put("list", list);
		return map;
	}
	
}
