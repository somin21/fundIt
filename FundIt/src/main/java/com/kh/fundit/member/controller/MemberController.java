package com.kh.fundit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	@RequestMapping("/member/emailjoin.do")
	public String memberEmailjoin() {
	
		return "member/emailjoin";
	}
	
}
