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
/*import com.kh.fundit.project.model.vo.Profile;*/
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
		/*System.out.println(projectNo);*/
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("projectNo",projectNo);
		
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.projectView(map);
		
		/*System.out.println(list);*/
		String userEmail = "";
		for(ProjectView v : list) {
			userEmail = v.getEmail();
		}

		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(userEmail);
		/*System.out.println(p);*/
		
		mav.addObject("list",list);
		mav.addObject("p",p);
		mav.addObject("projectNo",projectNo);
		mav.setViewName("project/projectView");
		
		return mav;
	
	}
//	희영
	@RequestMapping("project/originatorView.do")
	public ModelAndView origitorView(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		/*System.out.println(email);*/
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("email",email);
		
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.oriProjectList(map);
		
		/*System.out.println(list);*/
		
		//카테고리 구별
		int rowNum = 0;
		String categoryCode = "";
		String category = "";
		for(ProjectView v : list) {
			rowNum = v.getRowNum();
			categoryCode += v.getCategoryCode()+",";
		}
		/*System.out.println(categoryCode);*/
		if(categoryCode.contains("C1") && !(category.contains("게임")) ) {
			category += "게임,";
		}
		if(categoryCode.contains("C2") && !(category.contains("푸드"))) {
			category += "푸드,";
		}
		if(categoryCode.contains("C3") && !(category.contains("예술"))) {
			category += "예술,";
		}
		if(categoryCode.contains("C4") && !(category.contains("패션"))) {
			category += "패션,";
		}
		if(categoryCode.contains("C5") && !(category.contains("출판"))) {
			category += "출판,";
		}
		if(categoryCode.contains("C6") && !(category.contains("테크놀리지"))) {
			category += "테크놀리지,";
		}
		
		if (category.length() > 0 && category.charAt(category.length()-1)==',') {
			category = category.substring(0, category.length()-1);
		    }
		/*System.out.println(category);*/
		
		//창작자프로필
		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(email);

		mav.addObject("list",list);
		mav.addObject("p",p);
		mav.addObject("rowNum",rowNum);
		mav.addObject("category",category);
		mav.setViewName("project/originatorView");
		
		return mav;
	
	}

}
