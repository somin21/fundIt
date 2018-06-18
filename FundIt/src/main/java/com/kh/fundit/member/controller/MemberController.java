package com.kh.fundit.member.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.member.model.vo.Member;


@SessionAttributes({"memberLoggedIn"})
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private MemberService memberService;
	//@Autowired
	//private ShaPasswordEncoder shaPasswordEncoder;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	public Map<String,Object> checkEmailDuplicate(@RequestParam String Email)  {
		logger.debug("ResponseBody-javaob ajax:"+Email);
		Map<String,Object> map = new HashMap<>(); 
	
		


		
		//업무로직
		int count = memberService.checkEmailDuplicate(Email);
		boolean isUsable = count==0?true:false;
		
		//jsonString 변환
		map.put("isUsable",isUsable);
		
		return map;
		}
	
//영준
	@RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(@RequestParam String Email,
							  @RequestParam String Password) {
		
		if(logger.isDebugEnabled()) // 성정된 레벨에서 디버그를 출력해?
			logger.debug("로그인 요청");
		
		// 리턴할 ModelAndView 객체 생성
		ModelAndView mav = new ModelAndView();
		
		// 업무 로직
		Member m = memberService.selectMemberByEmail(Email);
		
		String msg = "";
		String loc = "/";
		
		if(m == null) {
			msg = "존재하지 않는 아이디 입니다.";
		} else {
			if(bcryptPasswordEncoder.matches(Password, m.getPassword())) {
				msg = m.getName() + "님, 환영합니다!";
				mav.addObject("memberLoggedIn", m);
				
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
	
//	태윤
	@RequestMapping("/member/findPwd.do")
	public String findPwd() {
		ModelAndView mav = new ModelAndView();
		
		return "member/findPwdEnd";
	}
	
//	태윤
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
	             helper.setText("메일보내기 태스트 Test Commit");
	         }
	     };

	     mailSender.send(preparator);
	     
	     return "member/login";
	}
	
}
