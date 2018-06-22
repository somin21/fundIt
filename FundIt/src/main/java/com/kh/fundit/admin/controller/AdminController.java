package com.kh.fundit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/admin/indexProject")
	public ModelAndView adminProject() {
		ModelAndView mav = new ModelAndView();
		/*ListProjectView pList = adminService.selectpListView();*/
		
		
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
	
	@RequestMapping("/admin/member")
	public String adminMember() {
		
		return "admin/member";
	}
	
	@RequestMapping("/admin/message")
	public String adminMessage() {
		
		return "admin/message";
	}
}
