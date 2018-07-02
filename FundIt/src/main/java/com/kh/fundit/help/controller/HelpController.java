package com.kh.fundit.help.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.help.model.service.HelpService;
import com.kh.fundit.help.model.vo.Help;
import com.kh.fundit.project.model.vo.ListProjectView;


@Controller
public class HelpController {
		private Logger logger = LoggerFactory.getLogger(getClass());

		@Autowired
		private HelpService helpService;
			
//		호성
		@RequestMapping("/help/helpView.do")
		public String helpView() {
		
			return "help/helpView";
		}
		
		@RequestMapping("/help/helpRequest.do")
			public String helpRequest() {
			
				return "help/helpRequest";
		}
		
		@RequestMapping("/help/helpRequestEnd.do")
		public ModelAndView help(@RequestParam String userId, @RequestParam String reciver, @RequestParam String context) {
			System.out.println(userId);
			System.out.println(reciver);
			System.out.println(context);
			
			ModelAndView mav = new ModelAndView();
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("userId",userId);
			map.put("reciver",reciver);
			map.put("context",context);
			
			int result = helpService.insertHelpMsg(map);
			
			mav.addObject("msg", "문의가 완료되었습니다.");
			mav.addObject("loc", "/");
			mav.setViewName("common/msg"); 
				
			return mav;
			
		}

}
