package com.kh.fundit.project.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectGift;
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
	public List<ListProjectView> selectMyProjectList(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage,HttpServletResponse response){
		
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
		
		List<ListProjectView> list = projectService.selectMyProjectYet(member, numPerpage);
		
		return list;
	}
	
	//태윤
		@RequestMapping("/project/selectMyProjectYes")
		@ResponseBody
		public List<ListProjectView> selectMyProjectListYes(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
			Member member = new Member();
			System.out.println(email);
			member.setEmail(email);
			
			List<ListProjectView> list = projectService.selectMyProjectYes(member, numPerpage);
			
			return list;
		}
		
//태윤
	@RequestMapping("/project/selectMyProjectNo")
	@ResponseBody
	public List<ListProjectView> selectMyProjectListNo(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
					
		List<ListProjectView> list = projectService.selectMyProjectNo(member, numPerpage);
			
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
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",projectNo);
		
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.projectView(map);
		
		//선물리스트 받아오기
		List<ProjectGift> List = projectService.projectGiftList(map);
		
		/*System.out.println(list);*/
		String userEmail = "";
		Date calculateduedDate = null;
		int deadlineDay = 0;
		for(ProjectView v : list) {
			userEmail = v.getEmail();
			calculateduedDate = v.getCalculateduedDate();
			deadlineDay = v.getDeadlineDay();
		}

		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(userEmail);
		/*System.out.println(p);*/
		
		mav.addObject("list",list);
		mav.addObject("List",List);
		mav.addObject("p",p);
		mav.addObject("projectNo",projectNo);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.addObject("deadlineDay",deadlineDay);
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
		
		/*System.out.println("list="+list);*/
		
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
//	희영
	@RequestMapping("/project/interestInsert.do")
	public ModelAndView interestInsert(@RequestParam String no,@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		System.out.println("email@controll"+email);
		
		Map<String,Object> map = new HashMap<>();
		map.put("no",no);
		map.put("email",email);
		
		//관심프로젝트 체크
		int cnt = projectService.interestCnt(map);
		
		String loc = "/";
		String msg = "";
		
		if(cnt==0) {
			//관심프로젝트 등록하기
			int result = projectService.interestInsert(map);
			
			
			if(result>0) {
				msg = "관심등록 성공! 마이페이지에서 확인하세요.";
				loc = "/project/projectView.do?projectNo="+no;
			}else {
				msg = "관심등록 실패";
			}
		}else if(cnt>0) {
			msg = "이미 관심등록이 되어있습니다. 마이페이지에서 확인하세요.";
			loc = "/project/projectView.do?projectNo="+no;
		}
		
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	
	}
//	희영
	@RequestMapping("/project/supportGo.do")
	public ModelAndView supportGo(@RequestParam String no) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",no);
		
		//선물리스트 받아오기
		List<ProjectGift> List = projectService.projectGiftList(map);
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.projectView(map);
		String title = "";
		Date calculateduedDate = null;
		for(ProjectView v : list) {
			title = v.getProjectTitle();
			calculateduedDate = v.getCalculateduedDate();
		}
		System.out.println(title);
		
		
		mav.addObject("List",List);
		mav.addObject("projectNo",no);
		mav.addObject("title",title);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.setViewName("project/giftList");
		
		return mav;
	}
	
	

//	소민
	@RequestMapping("/project/makeProject.do")
	public String makeProject() {
		return "project/projectMake";
	}

}
