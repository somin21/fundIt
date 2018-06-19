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

import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;

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
	@RequestMapping("selectIndexProjectsList")
	@ResponseBody
	public Map<String,List<ListProjectView>> selectIndexProjectsList(@RequestParam(value="popularProjectPage", required=false, defaultValue="1") int popularProjectPage,
																	 @RequestParam(value="newProjectPage", required=false, defaultValue="1") int newProjectPage,
																	 @RequestParam(value="deadlineProjectPage", required=false, defaultValue="1") int deadlineProjectPage,
																	 HttpServletResponse response) {
		
		int numPerpage = 4;
		
		Map<String,List<ListProjectView>> map = new HashMap<String,List<ListProjectView>>();
		
		List<ListProjectView> popular_list = projectService.selectIndexPopularProject(popularProjectPage, numPerpage);
		List<ListProjectView> new_list = projectService.selectIndexNewProject(newProjectPage, numPerpage);
		List<ListProjectView> deadline_list = projectService.selectIndexDeadlineProject(deadlineProjectPage, numPerpage);
		
		map.put("polularList",popular_list);
		map.put("newList",new_list);
		map.put("deadlineList",deadline_list);
		
		return map;
	}

}