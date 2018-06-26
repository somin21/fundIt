package com.kh.fundit.admin.controller;

import java.lang.reflect.Array;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.admin.model.service.AdminService;
import com.kh.fundit.project.model.vo.ListProjectView;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin")
	public String adminLogin() {
		
		return "admin/adminIndex";
	}
	
	@RequestMapping("/admin/indexProject") // 모든 프로젝트.
	public ModelAndView indexProject(HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<ListProjectView> list = adminService.indexProject();
		
		System.out.println(list);
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="/admin/indexProjectEnd" , method = RequestMethod.GET)
	public ModelAndView indexProjectEnd(@RequestParam(value="no", required=false) String no, 
										HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		//배열에다가 다시 넣고 그 배열 그대로 가져가서 sql에서  배열이름[0]으로 넣어주면됨
		
		String proNo0 = no.split(",")[0];
		String proNo1 = no.split(",")[1];
		String proNo2 = no.split(",")[2];
		String proNo3 = no.split(",")[3];
		
		String arr[] = {proNo0, proNo1, proNo2, proNo3};
		
		int result = adminService.updateIndexYN(arr);
		String msg="";
		String loc="/";
		if(result==4) {
			msg="수정 성공!";
			loc="/admin/indexProject";
		}else {
			msg="실패!";
			loc="redirect:/";
		}
		mav.addObject("msg", msg);
	    mav.addObject("loc", loc);
	    mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/admin/projectConfirm")
	public String projectConfirm() {
		
		return "admin/projectConfirm";
	}
	
	@RequestMapping("/admin/projectDeadline")
	public String projectDeadline() {
		
		return "admin/projectDeadline";
	}
	
	@RequestMapping("/admin/memberAdmin")
	public String adminMember() {
		
		return "admin/memberAdmin";
	}
	
	@RequestMapping("/admin/message")
	public String adminMessage() {
		
		return "admin/message";
	}
}
