package com.kh.fundit.member.controller;

import javax.mail.internet.MimeMessage;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.member.model.vo.Member;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.core.io.FileSystemResource;

@Controller
public class MemberController {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	public ModelAndView findPwdSendLink(@RequestParam final String email, HttpServletRequest request) {
	     System.out.println("email = "+ email);
	     ModelAndView mav = new ModelAndView();
	     String msg = "";
	     String loc = "/";
	     
	     Member member = new Member();
	     member.setEmail(email);
	     
	     int result = memberService.selectMemberCnt(member);
	     System.out.println("result = "+result);
	     if(result<1) {
	    	msg = "조회된 회원이 없습니다";
	    	mav.addObject("loc", loc);
	    	mav.addObject("msg", msg);
	    	mav.setViewName("common/msg");
	    	return mav; 
	     }else {
	     
	     final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	         @Override
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	             final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	             helper.setFrom("flyingboy147@naver.com");
	             helper.setTo(email);
	             helper.setSubject("fundit에서 비밀번호 링크를 보내드립니다.");
	             helper.setText("http://localhost:9090/fundit/member/changePwd.do?email="+email);
	         }
	     };

	     mailSender.send(preparator);
	     msg = "기입하신 이메일을 확인해주세요";
	    	mav.addObject("loc", loc);
	    	mav.addObject("msg", msg);
	    	mav.setViewName("common/msg");
	     
	     return mav;

	     }
	}
	
	@RequestMapping("member/changePwd.do")
	public ModelAndView changePwd(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("email", email);
		mav.setViewName("member/changePwdEnd");
		
		return mav;
	}
	
	@RequestMapping("member/changePwdEnd.do")
	public ModelAndView changePwdEnd(Member member, Model model) {
		ModelAndView mav = new ModelAndView();
		
		String rawPassword = member.getPassword();
		//System.out.println("암호화전 : "+rawPassword);
		
		/****** password 암호화 시작 ******/
		
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		System.out.println("encodedPassword = "+ encodedPassword);
		
		member.setPassword(encodedPassword);
		
		
		/****** password 암호화 끝 ******/
		System.out.println("암호화후 : "+member.getPassword());
		

		//1.비지니스로직 실행
		int result = memberService.updateMemberPwd(member);
		
		//2.처리결과에 따라 view단 분기처리
		String loc = "/"; 
		String msg = "";
		if(result>0) msg="비밀번호 변경 성공!";
		else msg="비밀번호 변경 실패!";
		
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");
		return mav;
		
		
		
	}
	
	
}
