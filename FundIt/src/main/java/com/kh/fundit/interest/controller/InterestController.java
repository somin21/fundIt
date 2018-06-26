
package com.kh.fundit.interest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.kh.fundit.member.model.service.MemberService;
import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.ListProjectView;



@Controller
public class InterestController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProjectService projectService;
/*//	영준
	@RequestMapping("/interest/interest.do")
		public String memberLogin() {
		
			return "interest/interest";
	}
	*/
	@RequestMapping("/interest/interest.do")
	public ModelAndView projectList(@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView();
		
		
		
		List<ListProjectView> list = projectService.interestList(email);
		mav.addObject("list",list);
		
		
	
	
		mav.setViewName("interest/interest");
		
		return mav;
	
}
	@RequestMapping("/interest/interestDelete.do")
	public  ModelAndView interestDelete(@RequestParam("projectNo") int projectNo ,
			@RequestParam("email") String email) {
		
		
	
		System.out.println(projectNo);
	
		   Map<String ,Object> map = new HashMap<>();
	          
	       map.put("email", email);
	       map.put("projectNo",projectNo);
		
	       
	       
		ModelAndView mav = new ModelAndView();
		
		int result = projectService.interestDelete(map);
		
		List<ListProjectView> list = projectService.interestList(email);
		mav.addObject("list",list);
		
		mav.setViewName("interest/interest");
		
		return mav;
	}
	
	
}
