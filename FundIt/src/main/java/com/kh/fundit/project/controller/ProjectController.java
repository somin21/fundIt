package com.kh.fundit.project.controller;

import java.util.List;

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
	@RequestMapping("selectIndexPopularProject")
	@ResponseBody
	public List<ListProjectView> selectIndexPopularProject(@RequestParam(value="popularProjectPage", required=false, defaultValue="1") int popularProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexPopularProject(popularProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexNewProject")
	@ResponseBody
	public List<ListProjectView> selectIndexNewProject(@RequestParam(value="newProjectPage", required=false, defaultValue="1") int newProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexNewProject(newProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexDeadlineProject")
	@ResponseBody
	public List<ListProjectView> selectIndexDeadlineProject(@RequestParam(value="deadlineProjectPage", required=false, defaultValue="1") int deadlineProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexDeadlineProject(deadlineProjectPage, numPerpage);
	
		return list;
	}
	
}