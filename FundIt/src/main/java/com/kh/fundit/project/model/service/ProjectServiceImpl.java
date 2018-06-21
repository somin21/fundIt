package com.kh.fundit.project.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.dao.ProjectDAO;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	
//	소민
	@Override
	public List<ProjectOutline> selectIndexProject() {
		
		return projectDAO.selectIndexProject();
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage) {
		
		return projectDAO.selectIndexPopularProject(popularProjectPage, numPerpage);
	}
	
//	소민
	@Override
	public List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage) {
		
		return projectDAO.selectIndexNewProject(newProjectPage, numPerpage);
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage) {

		return projectDAO.selectIndexDeadlineProject(deadlineProjectPage, numPerpage);
	}

// 태윤
	@Override
	public List<ListProjectView> selectMyProjectYet(Member member) {
		// TODO Auto-generated method stub
		return projectDAO.selectMyProjectYet(member);
	}
	// 태윤
	@Override
	public List<ListProjectView> selectMyProjectYes(Member member) {
		// TODO Auto-generated method stub
		return projectDAO.selectMyProjectYes(member);
	}
	// 태윤
	@Override
	public List<ListProjectView> selectMyProjectNo(Member member) {
		// TODO Auto-generated method stub
		return projectDAO.selectMyProjectNo(member);
	}
// 태윤
	@Override
	public int selectMyProjectCnt(Member member) {
		// TODO Auto-generated method stub
		return projectDAO.selectMyProjectCnt(member);
	}


}
