package com.kh.fundit.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.member.model.vo.Support;
import com.kh.fundit.message.model.service.MessageService;


@SessionAttributes({"memberLoggedIn"})

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private MemberService memberService;
	private MessageService messageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
		
	@Autowired
	private JavaMailSenderImpl mailSender;
		
//	영준
	@RequestMapping("/member/login.do")
		public ModelAndView memberLogin() {
		
		int a =1;
		 ModelAndView mav = new ModelAndView();
	      
	      mav.addObject("a", a);
	      mav.setViewName("member/login");
	      
	      return mav;
		
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
//	영준	
	@RequestMapping("/member/emailjoinEnd.do")
	public String emailjoinEnd(Member member, Model model) {
		
		if(logger.isDebugEnabled()) // 성정된 레벨에서 디버그를 출력해?
			logger.debug("회원 등록 페이지");
		
		logger.debug(member.toString());
		
		String rawPassword = member.getPassword();
		System.out.println("암호화 전 : "+rawPassword);
		
		/***** password 암호화 시작 *****/
		// salt값 사용하지 않은 버전
//		String encodedPassword = shaPasswordEncoder.encodePassword(rawPassword, null);
		// salt값 사용 버전
//		String encodedPassword = shaPasswordEncoder.encodePassword(rawPassword, member.getUserId()+rawPassword);
		
		// BCryptPasswordEncoder : 자동 salt값 처리
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encodedPassword);
		// $2a$10$kGobygZrri2aukkp5/arbeWf8QnToBlRftjOtlrc1ixR7Z6muxLBO
		// $2a$10$ : 알고리즘 및 알고리즈 옵셥
		// kGobygZrri2aukkp5/arbe : random salt 값 (22자리)
		// Wf8QnToBlRftjOtlrc1ixR7Z6muxLBO : 암호화된 패스워드 (31자리)
		/***** password 암호화 끝 *****/

		System.out.println("암호화 후 : "+member.getPassword());
		
		int result = memberService.insertMember(member);
		System.out.println("result@emailjoinEnd="+result);
		
		String msg = "";
		String loc = "/";
		
		if(result > 0) {
			msg = "회원 등록 완료";
			loc = "/";
		}
		else {
			msg = "회원 등록 실패";
			loc = "/member/join";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
//영준
	@RequestMapping("/member/checkEmailDuplicate.do")
	@ResponseBody
	public Map<String,Object> checkEmailDuplicate(@RequestParam String email)  {
		logger.debug("ResponseBody-javaob ajax:"+email);
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		//업무로직
		int count = memberService.checkEmailDuplicate(email);
		boolean isUsable = count==0?true:false;
		
		//jsonString 변환
		map.put("isUsable",isUsable);
		
		return map;
	}
			
	//영준
		@RequestMapping("/member/memberLogin.do")
		public ModelAndView memberLogin(@RequestParam String email,
								  @RequestParam String password) {
			
			if(logger.isDebugEnabled()) // 성정된 레벨에서 디버그를 출력해?
				logger.debug("로그인 요청");
			
			// 리턴할 ModelAndView 객체 생성
			ModelAndView mav = new ModelAndView();
			
			// 업무 로직
			Member m = memberService.selectMemberByEmail(email);
			
			System.out.println(m);
			String msg = "";
			String loc = "/";
			
			if(m==null) {
					msg = "존재하지 않은 아이디";
				}else if(m.getDeleteyn().equals("Y")) {
					msg = "삭제된 아이디 입니다";
				}
			 else {
				if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
					msg = m.getName() + "님, 환영합니다!";
					mav.addObject("memberLoggedIn", m);
					
					
					//관리자이면 adminIndex페이지로
					if(m.getAdminyn().equals("Y")) {
						msg = "관리자!";
						loc="/admin";
					}
				} else {
					msg = "비밀번호가 틀렸습니다";
				}
			}
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			
			// 뷰단 지정
			mav.setViewName("common/msg");
			
			return mav;
		}
		
	//영준	
		@RequestMapping("/member/memberLogout.do")
		public String memberLogout(SessionStatus sessionStatus) {
			
			if(logger.isDebugEnabled()) // 성정된 레벨에서 디버그를 출력해?
				logger.debug("로그아웃 요청");
			
			if(!sessionStatus.isComplete()) {
				// 현재 session상태를 끝났다고 마킹
				sessionStatus.setComplete();
			}
			
			return "redirect:/";
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
	     String msg = "";
	     String loc="/";
	     
	     if(member.getNewsyn() == null) {
	        member.setNewsyn("N");
	     }else {
	        member.setNewsyn("Y");
	     }
	     int result = memberService.updateMember(member);
	     
	     if(result>0) {
	    	msg="수정 성공!";
	     }else {
	    	 msg = "실패!";
	    	 loc="redirect:/";
	     }
	     
	     mav.addObject("msg", msg);
	     mav.addObject("loc", loc);
	     mav.setViewName("common/msg");
	     return mav;
	  }
	  
	//  김효정
	  @RequestMapping("/member/profileView.do")
	  public ModelAndView profileView(@RequestParam("email") String email) {
	     ModelAndView mav = new ModelAndView();
	    
	     Member member = memberService.selectMember(email);
	     Profile profile = memberService.selectProfile(email);
	     
	     mav.addObject("member", member);    
	     mav.addObject("profile", profile);    
	     mav.setViewName("member/profileView");
	     
	     return mav;
	  }
	  
	  //  김효정
	  @RequestMapping("/member/profileUpdate.do")
	  public ModelAndView profileUpdate(@RequestParam(name="email") String email,
	                            @RequestParam(name="localCode", required=false) String localCode,
	                            @RequestParam(name="profileIntroduce", required=false) String profileIntroduce,
	                            @RequestParam(name="phoneNum", required=false) String phoneNum,
	                            @RequestParam(name="file2") String file2,
	                            @RequestParam(value="profileImage", required=false) MultipartFile proImg,
	                            HttpServletRequest request) throws Exception{
		  
		  ModelAndView mav = new ModelAndView();
		  
		  
		  String realName = proImg.getOriginalFilename();
		  
		  String msg="";
	      String loc="/";
		  String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/profileImg");
		  String renamedFileName="";
		  //img파일이있으면
		  if(!proImg.isEmpty()) {
			  String ext = realName.substring(realName.lastIndexOf(".")+1);
			  
			  String id = email.replaceAll("\\.","_");
	          String id2 = id.replaceAll("@", "_");

	          renamedFileName = id2 + "."+ext;
	          
	          proImg.transferTo(new File(saveDirectory+"/"+renamedFileName));
		  }
		  
		  if(renamedFileName == "") {
	        	renamedFileName = file2;
	        }
		  Profile profile = new Profile(email,renamedFileName, localCode, profileIntroduce, phoneNum);
	        int result = memberService.updateProfile(profile);
	        if(result>0) {
	        	msg="정보가 수정되었습니다.";
	        	loc="/";
	        	mav.addObject("msg", msg);
	        	mav.addObject("loc", loc);
	        	
	        	mav.addObject("profile", profile);
	        	mav.setViewName("common/msg");
	        }else {
	           msg="실패!";
	           loc="/";
	           /*loc="redirect:/";*/
	          
	           mav.addObject("msg",msg);
	           mav.addObject("loc", loc);
	          
	           mav.setViewName("common/msg");
	        }
	     return mav;
	  }
	  
	  //태윤
	   @RequestMapping("/member/findPwd.do")
	   public String findPwd() {
	      
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
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	        int rndNum = (int)((Math.random()*1000)+1);
	        final String token = sdf.format(new Date(System.currentTimeMillis()))+rndNum;
	        
	        Map<String,String> map = new HashMap<>();
	        map.put("email", email);
	        map.put("token", token);
	        result =  memberService.insertMemberToken(map);
	        final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	            @Override
	            public void prepare(MimeMessage mimeMessage) throws Exception {
	                final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	                helper.setFrom("flyingboy147@naver.com");
	                helper.setTo(email);
	                helper.setSubject("fundit에서 비밀번호 링크를 보내드립니다.");
	                helper.setText("http://localhost:9090/fundit/member/changePwd.do?email="+email+"&token="+token);
	            }
	        };

	        mailSender.send(preparator);
	        
	        msg = "기입하신 이메일로 링크를 보내드렸습니다.";
	          mav.addObject("msg", msg);
	          mav.addObject("loc", loc);
	          mav.setViewName("common/msg");
	        
	        return mav;

	        }
	   }
	   
	   
	   //태윤
	   @RequestMapping("member/changePwd.do")
	   public ModelAndView changePwd(@RequestParam String email, @RequestParam String token) {
		  String chkToken  = memberService.selectToken(email).trim();
		  
	      ModelAndView mav = new ModelAndView();
	      if(chkToken.equals(token.trim())) {
	      int result = memberService.deleteToken(email);
	      System.out.println(result);
	      mav.addObject("email", email);
	      mav.setViewName("member/changePwdEnd");
	      }else if(chkToken == null ||!chkToken.equals(token.trim())) {
	      mav.addObject("loc","/");
	      mav.addObject("msg","페이지가 만료되었습니다");
	      mav.setViewName("common/msg");
	      }
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
	   
//  태윤
	   @RequestMapping("member/selectProfileImg")
	   @ResponseBody
	   public String selectProfileImg(@RequestParam String email) {
		   logger.debug(email);
		   
		   Profile profile = new Profile();
		   profile.setEmail(email);
		   String profileImg = memberService.selectProfileImg(profile);
		   logger.debug(profileImg);
		   return profileImg;
	   }
	   
	//  태윤
		@RequestMapping("/member/mySupport.do")
		public  ModelAndView goToMySupport(@RequestParam String email) {
			ModelAndView mav = new ModelAndView();
			if(email == null) {
			mav.setViewName("/");
			}else {
			mav.setViewName("member/mySupportList");
			}
			return mav;
		}
		
	//태윤
		@RequestMapping("/member/selectMySupport")
		@ResponseBody
		public List<Support> selectSupprtList(@RequestParam String email,
				                              @RequestParam (value = "page", required = false, defaultValue = "1") int page,
											  @RequestParam (value="searchType", required = false, defaultValue = "searchAll") String searchType,
											  @RequestParam (value="searchKeyword", required = false, defaultValue = "") String searchKeyword ){
		
		System.out.println(page);
		System.out.println(searchType);
		System.out.println(searchKeyword);
		
		
		int numPerPage = 4;	
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		List<Support> list = memberService.selectSupportList(map,page,numPerPage);
		System.out.println(list);	
		return list;
			
		}

		
		
		
}
