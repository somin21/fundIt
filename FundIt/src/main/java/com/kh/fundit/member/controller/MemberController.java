package com.kh.fundit.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	김효정
	@RequestMapping("/member/memberView.do")
	public ModelAndView profileView(@RequestParam("email") String email, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member = memberService.selectMember(email);
		
		mav.addObject("member", member);
		mav.setViewName("member/memberView");
		
		return mav;
		
	}
	
//	김효정
	@RequestMapping("/member/memberUpdate.do")
	public ModelAndView updateMember(@RequestParam("email") String email,
			 						 @RequestParam(required=false) String newsyn) {
		ModelAndView mav = new ModelAndView();
		Member member = new Member(email,newsyn);
		System.out.println("1111"+member);
		if(member.getNewsyn() == null) {
			member.setNewsyn("N");
		}else {
			member.setNewsyn("Y");
		}
		System.out.println("2222"+member);
		int result = memberService.updateMember(member);
		
		System.out.println("33333"+member);
		
		mav.setViewName("member/memberView");
		return mav;
	}
	
//	김효정
	@RequestMapping("/member/profileView.do")
	public ModelAndView profileView(@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView();
		System.out.println(email);
		Member member = memberService.selectMember(email);
		mav.addObject("member", member); 		
		mav.setViewName("member/profileView");
		return mav;
	}
	
//	김효정
	@RequestMapping("/member/profileUpdate.do")
	public ModelAndView profileUpdate(@RequestParam(name="email") String email,
									  @RequestParam(name="localCode", required=false) String localCode,
									  @RequestParam(name="profileIntroduce", required=false) String profileIntroduce,
									  @RequestParam(name="phoneNum", required=false) String phoneNum,
									  @RequestParam(value="profileImage", required=false) MultipartFile proImg,
									  HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		try {
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/profileImg");
			String renamedFileName="";
			if(!proImg.isEmpty()) {
				String originalFileName = proImg.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
				
				String id = email.replaceAll("\\.","_");
				String id2 = id.replaceAll("@", "_");
				System.out.println(id2);
				renamedFileName = id2 + "."+ext;
				System.out.println(renamedFileName);
				
				try {
					proImg.transferTo(new File(saveDirectory+"/"+renamedFileName));
				}catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			Profile profile = new Profile(email,renamedFileName, localCode, profileIntroduce, phoneNum);
			System.out.println(profile);
			int result = memberService.updateProfile(profile);
			if(result>0) {
				System.out.println("성공!!!");
			}else {
				System.out.println("실패!!!!!!!");
			}
			mav.addObject("profile", profile);
			mav.setViewName("member/memberView");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
