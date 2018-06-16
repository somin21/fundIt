package com.kh.fundit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	
	@RequestMapping("/member/login.do")
		public String memberLogin() {
		
			return "member/login";
		
	}
	
	@RequestMapping("/member/join.do")
	public String memberJoin() {
	
		return "member/join";
	}
	
	
	@RequestMapping("/member/findPwd.do")
	public String findPwd() {
		ModelAndView mav = new ModelAndView();
		
		return "member/findPwdEnd";
	}
	
	@RequestMapping("/member/findPwdSendLink.do")
	public void findPwdSendLink(@RequestParam String email) {
	     System.out.println("email = "+ email);
	}
	
}
