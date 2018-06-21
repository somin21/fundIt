package com.kh.fundit.naver.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.naver.model.bo.NaverLoginBO;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"memberLoggedIn"})
@Controller
public class LoginController {

   /* NaverLoginBO */
   private NaverLoginBO naverLoginBO;
   private String apiResult = null;
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }

   //로그인 첫 화면 요청 메소드
   @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(Model model, HttpSession session) {
      
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      
      //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
      //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      System.out.println("네이버:" + naverAuthUrl);
      
      //네이버 
      model.addAttribute("url", naverAuthUrl);

      /* 생성한 인증 URL을 View로 전달 */
      return "member/login";
   }

   //네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
         throws IOException {
      System.out.println("여기는 callback");
      OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
       apiResult = naverLoginBO.getUserProfile(oauthToken);
       
       
          String [] a = apiResult.split(",");
          String [] b = a[8].split(":");
          String [] c = a[7].split(":");
          System.out.println(apiResult);
          String naverEmail = new String(c[1].replaceAll("\"",""));
          String naverName = new String(b[1].replaceAll("\"",""));
          System.out.println(StringEscapeUtils.unescapeJava(naverName));
          System.out.println(naverEmail);
          
          Map<String ,Object> map = new HashMap<>();
          
         map.put("naverEmail", naverEmail);
         map.put("naverName",StringEscapeUtils.unescapeJava(naverName));
        
         
          
         ModelAndView mav = new ModelAndView();
         
         Member m = memberService.selectNaverByEmail(naverEmail);
         
         String msg = "";
         String loc = "/";
         
         
         
         if(m == null) {
            int result = memberService.insertNaver(map);
            if(result > 0) {
                Member m2 = memberService.selectNaverByEmail(naverEmail);
                if(m2 != null) {
                msg = m2.getName() + "님, 환영합니다!";
                  mav.addObject("memberLoggedIn", m2);
            }
            }
         } else {
               msg = m.getName() + "님, 환영합니다!";
               mav.addObject("memberLoggedIn", m);
            }
         
         
         mav.addObject("msg", msg);
         mav.addObject("loc", loc);
         
         // 뷰단 지정
         mav.setViewName("common/msg");
         model.addAttribute("result", apiResult);

         return mav;
      }
       
}