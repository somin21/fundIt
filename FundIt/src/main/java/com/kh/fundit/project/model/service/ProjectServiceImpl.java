package com.kh.fundit.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.dao.ProjectDAO;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectDelivery;
import com.kh.fundit.project.model.vo.ProjectGift;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectSupport;
import com.kh.fundit.project.model.vo.ProjectView;

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
	public List<ListProjectView> selectMyProjectYet(Member member, int numPerpage) {
		
		return projectDAO.selectMyProjectYet(member, numPerpage);
	}
	
	// 태윤
	@Override
	public List<ListProjectView> selectMyProjectYes(Member member ,int numPerpage) {
		
		return projectDAO.selectMyProjectYes(member, numPerpage);
	}
	
	// 태윤
	@Override
	public List<ListProjectView> selectMyProjectNo(Member member, int numPerpage ) {
		
		return projectDAO.selectMyProjectNo(member, numPerpage );
	}
	
// 태윤
	@Override
	public int selectMyProjectCnt(Member member) {
		
		return projectDAO.selectMyProjectCnt(member);
	}

//	희영
	@Override
	public List<ListProjectView> projectList(Map<String, String> map) {
		
		return projectDAO.projectList(map);
	}

//	희영
	@Override
	public List<ProjectView> projectView(Map<String, Object> map) {
		
		return projectDAO.projectView(map);
	}

	@Override
	public List<ListProjectView> interestList(String email) {
		
		return projectDAO.interestList(email);
	}

	@Override
	public Profile profileUser(String userEmail) {
		return projectDAO.profileUser(userEmail);
	}

	@Override
	public List<ProjectView> oriProjectList(Map<String, String> map) {
		return projectDAO.oriProjectList(map);
	}

	@Override
	public int interestInsert(Map<String, Object> map) {
		return projectDAO.interestInsert(map);
	}
//희영
	@Override
	public int interestCnt(Map<String, Object> map) {
		return projectDAO.interestCnt(map);
	}
//영준
	@Override
	public int interestDelete(Map<String, Object> map) {
		return projectDAO.interestDelete(map);
	}

//희영
	@Override
	public List<ProjectGift> projectGiftList(Map<String, Object> map) {
		return projectDAO.projectGiftList(map);
	}
//희영
	@Override
	public int insertPayment(Map<String, Object> map) {
		return projectDAO.insertPayment(map);
	}
//희영
	@Override
	public List<ProjectGift> projectSeelctGift(Map<String, Object> map) {
		return projectDAO.projectSeelctGift(map);
	}
//희영
	@Override
	public int supportInsert(Map<String, Object> map) {
		return projectDAO.supportInsert(map);
	}
//희영
	@Override
	public ProjectSupport supportList(Map<String, Object> map) {
		return projectDAO.supportList(map);
	}

	@Override
	public int deliveryInsert(Map<String, Object> map) {
		return projectDAO.deliveryInsert(map);
	}

}
