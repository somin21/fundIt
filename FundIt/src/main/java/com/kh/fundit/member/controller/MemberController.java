package com.kh.fundit.member.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
//	영준
	@RequestMapping("/member/login.do")
		public String memberLogin() {
		
			return "member/login";
	}
	
//	영준
	@RequestMapping("/member/join.do")
	public String memberJoin() {
	
		return "member/join";
	}
	
//	영준
	@RequestMapping("/member/emailjoin.do")
	public String memberEmailjoin() {
	
		return "member/emailjoin";
	}
	
	//  김효정
	  @RequestMapping("/member/memberView.do")
	  public ModelAndView profileView(@RequestParam("email") String email, HttpServletRequest request) {
	     ModelAndView mav = new ModelAndView();
	     Member member = memberService.selectMember(email);
	     
	     mav.addObject("member", member);
	     mav.setViewName("member/memberView");
	     
	     return mav;
	     
	  }
	  
	//  김효정
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
	  
	//  김효정
	  @RequestMapping("/member/profileView.do")
	  public ModelAndView profileView(@RequestParam("email") String email) {
	     ModelAndView mav = new ModelAndView();
	     System.out.println(email);
	     Member member = memberService.selectMember(email);
	     mav.addObject("member", member);       
	     mav.setViewName("member/profileView");
	     return mav;
	  }
	  
	//  김효정
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
	  
	  //태윤
	   @RequestMapping("/member/findPwd.do")
	   public String findPwd() {
	      ModelAndView mav = new ModelAndView();
	      
	      return "member/findPwdEnd";
	   }
	   
	   
	   //태윤
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
	   
	   
	   //태윤
	   @RequestMapping("member/changePwd.do")
	   public ModelAndView changePwd(@RequestParam String email) {
	      ModelAndView mav = new ModelAndView();
	      
	      mav.addObject("email", email);
	      mav.setViewName("member/changePwdEnd");
	      
	      return mav;
	   }
	   //태윤
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
