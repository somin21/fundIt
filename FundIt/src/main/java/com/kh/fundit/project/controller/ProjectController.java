package com.kh.fundit.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectView;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
//	소민
	@RequestMapping("selectIndexProject")
	@ResponseBody
	public List<ProjectOutline> selectIndexProject(HttpServletResponse response) {
		
		List<ProjectOutline> list = projectService.selectIndexProject();
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexPopularProject")
	@ResponseBody
	public List<ListProjectView> selectIndexPopularProject(@RequestParam(value="page", required=false, defaultValue="1") int popularProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexPopularProject(popularProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexNewProject")
	@ResponseBody
	public List<ListProjectView> selectIndexNewProject(@RequestParam(value="page", required=false, defaultValue="1") int newProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexNewProject(newProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexDeadlineProject")
	@ResponseBody
	public List<ListProjectView> selectIndexDeadlineProject(@RequestParam(value="page", required=false, defaultValue="1") int deadlineProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexDeadlineProject(deadlineProjectPage, numPerpage);
	
		return list;
	}
	
//태윤
	@RequestMapping("/project/myProject.do")
	public ModelAndView selectMyProject(@RequestParam String email){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/myProject");
		return mav;
	}
//태윤
	@RequestMapping("/project/selectMyProjectYet")
	@ResponseBody
	public List<ListProjectView> selectMyProjectList(@RequestParam String email){
		
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
				
		List<ListProjectView> list = projectService.selectMyProjectYet(member);
		
		return list;
	}
	
	//태윤
		@RequestMapping("/project/selectMyProjectYes")
		@ResponseBody
		public List<ListProjectView> selectMyProjectListYes(@RequestParam String email){
			
			Member member = new Member();
			System.out.println(email);
			member.setEmail(email);
					
			List<ListProjectView> list = projectService.selectMyProjectYes(member);
			
			return list;
		}
		
		//태윤
		@RequestMapping("/project/selectMyProjectNo")
		@ResponseBody
		public List<ListProjectView> selectMyProjectListNo(@RequestParam String email){
			
			Member member = new Member();
			System.out.println(email);
			member.setEmail(email);
					
			List<ListProjectView> list = projectService.selectMyProjectNo(member);
			
			return list;
		}
	
	
	
	
	
// 태윤
	@RequestMapping("/project/selectMyProjectCnt")
	@ResponseBody
	public int selectMyProjectCnt(@RequestParam String email) {
		Member member = new Member();
		member.setEmail(email);
		int cnt = projectService.selectMyProjectCnt(member);
		
		return cnt;
		
	}
	
	
//	희영
	@RequestMapping("/project/projectList.do")
	public ModelAndView projectList(@RequestParam String categoryCode) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("categoryCode",categoryCode);
		
		List<ListProjectView> list = projectService.projectList(map);
		
		mav.addObject("list",list);
		mav.addObject("categoryCode",categoryCode);
		mav.setViewName("project/projectList");
		
		return mav;
	
	}
//	희영
	@RequestMapping("/project/projectView.do")
	public ModelAndView projectView(@RequestParam int projectNo) {
		ModelAndView mav = new ModelAndView();
		System.out.println(projectNo);
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("projectNo",projectNo);
		
		List<ProjectView> list = projectService.projectView(map);
		
		System.out.println(list);
		mav.addObject("list",list);
		mav.addObject("projectNo",projectNo);
		mav.setViewName("project/projectView");
		
		return mav;
	
	}


}
