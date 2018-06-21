package com.kh.fundit.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin")
	public String adminLogin() {
		
		return "admin/adminIndex";
	}
}
