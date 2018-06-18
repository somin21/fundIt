package com.kh.fundit.member.controller;

import javax.mail.internet.MimeMessage;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.core.io.FileSystemResource;

@Controller
public class MemberController {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	public String findPwdSendLink(@RequestParam final String email, HttpServletRequest request) {
	     System.out.println("email = "+ email);
	     
	     final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	         @Override
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	             final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	             helper.setFrom("flyingboy147@naver.com");
	             helper.setTo(email);
	             helper.setSubject("fundit에서 비밀번호 링크를 보내드립니다.");
	             helper.setText("메일보내기 Test Commit");
	         }
	     };

	     mailSender.send(preparator);
	     
	     return "member/login";

	   
	     
	    
	}
	
}
