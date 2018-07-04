package com.kh.fundit.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.dao.ProjectDAO;
import com.kh.fundit.project.model.vo.Community;
import com.kh.fundit.project.model.vo.Item;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectAccount;
import com.kh.fundit.project.model.vo.ProjectDelivery;
import com.kh.fundit.project.model.vo.ProjectFunding;
import com.kh.fundit.project.model.vo.ProjectGift;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectStory;
import com.kh.fundit.project.model.vo.ProjectSupport;
import com.kh.fundit.project.model.vo.ProjectView;
import com.kh.fundit.project.model.vo.SupportPayment;

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
//희영
	@Override
	public int deliveryInsert(Map<String, Object> map) {
		return projectDAO.deliveryInsert(map);
	}
//희영
	@Override
	public List<String> projectGiftLevel(Map<String, Object> map) {
		return projectDAO.projectGiftLevel(map);
	}
//희영
	@Override
	public List<Map<String, String>> projectGiftName(Map<String, Object> map) {
		return projectDAO.projectGiftName(map);
	}
//희영
	@Override
	public List<Community> communityList(Map<String, Object> map) {
		return projectDAO.communityList(map);
	}

	@Override
	public int communityInsert(Map<String, Object> map) {
		return projectDAO.communityInsert(map);
	}

//영준
	@Override
	public List<ListProjectView> interestList2(String email) {
		return projectDAO.interestList2(email);
	}
	//영준
	@Override
	public List<ListProjectView> interestList1(String email) {
		return projectDAO.interestList1(email);
	}
	//영준
	@Override
	public List<ListProjectView> interestList3(String email) {
		return projectDAO.interestList3(email);
	}
	//영준
	@Override
	public List<ListProjectView> interestList4(String email) {
		return projectDAO.interestList4(email);
	}

//	소민
	@Override
	public com.kh.fundit.member.model.vo.Profile makeProject(String email) {

		return projectDAO.makeProject(email);
	}

//	소민
	@Override
	public int makeProjectOutline(ProjectOutline outline, com.kh.fundit.member.model.vo.Profile profile) {

		int projectNo = 0;
		
		try {
			int result = projectDAO.makeProjectOutline(outline);
			
			if(result > 0) {
				projectNo = outline.getProjectNo();
				System.out.println(projectNo);
				projectDAO.makeProjectProfile(profile);
			}
			System.out.println(projectNo);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		System.out.println("projectNo : " + projectNo);
		return projectNo; 
	}

//	소민
	@Override
	public int makeProjectFunding(ProjectFunding funding) {

		int projectNo = 0;
		
		try {
			int result = projectDAO.makeProjectFunding(funding);
			
			if(result > 0) {
				projectNo = funding.getProjectNo();
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return projectNo; 
	}
	
//	소민
	@Override
	public void deleteItem(int projectNo) {

		projectDAO.deleteItem(projectNo);
	}
	
//	소민
	@Override
	public Item insertItem(Item item) {
		
		Item result_item = item;
		int itemNo = 0;
		
		try {
			int result = projectDAO.insertItem(item);
			
			if(result > 0) {
				result_item.setItemNo(item.getItemNo());
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result_item; 
	}

//	소민
	@Override
	public void updateItem(Item item) {
		
		projectDAO.updateItem(item);
	}

//	소민
	@Override
	public List<Item> selectItemList(int projectNo) {
		
		return projectDAO.selectItemList(projectNo);
	}

//	소민
	@Override
	public void deleteGift(int projectNo) {

		projectDAO.deleteGift(projectNo);
	}

//	소민
	@Override
	public ProjectGift insertGift(ProjectGift gift) {
		
		ProjectGift result_gift = new ProjectGift();
		
		try {
			int result = projectDAO.insertGift(gift);
			
			if(result > 0) {
				Map<String, Integer> map = new HashMap<>();
				map.put("projectNo", gift.getProjectNo());
				map.put("minMoney", gift.getMinMoney());
				map.put("itemno", gift.getItemno());
				result_gift = projectDAO.selectGift(map);
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result_gift; 
	}

//	소민
	@Override
	public void deleteGift(Map<String, Integer> map) {

		projectDAO.deleteGift(map);
	}
	
//	희영
	@Override
	public int communityUpdate(Map<String, Object> map) {
		return projectDAO.communityUpdate(map);
	}
//	희영
	@Override
	public List<SupportPayment> paymentCancel(Map<String, Object> map) {
		return projectDAO.paymentCancel(map);
	}
//	희영
	@Override
	public int paymentCancelDel(Map<String, Object> map) {
		return projectDAO.paymentCancelDel(map);
	}

//	소민
	@Override
	public int makeProjectStory(ProjectStory story) {
		
		int projectNo = 0;
		
		try {
			int result = projectDAO.makeProjectStory(story);
			
			if(result > 0) {
				projectNo = story.getProjectNo();
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return projectNo; 
	}

//	소민
	@Override
	public int makeProjectAccount(ProjectAccount account) {
		
		return projectDAO.makeProjectAccount(account);
	}

//	소민
	@Override
	public int projectConfirm(int projectNo) {
		
		return projectDAO.projectConfirm(projectNo);
	}

//	소민
	@Override
	public ProjectOutline selectProjectOutline(int projectNo) {
		
		return projectDAO.selectProjectOutline(projectNo);
	}

//	소민
	@Override
	public int updateProjectOutline(ProjectOutline outline, com.kh.fundit.member.model.vo.Profile profile) {

		int result = 0;
		
		try {
			result = projectDAO.updateProjectOutline(outline);
			if(result >0) {
				projectDAO.makeProjectProfile(profile);
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
		
	}

//	소민
	@Override
	public ProjectFunding selectProjectFunding(int projectNo) {
		
		return projectDAO.selectProjectFunding(projectNo);
	}

//	소민
	@Override
	public ProjectGift selectProjectGift(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
//  태윤
	@Override
	public int deleteProject(int projectNo, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return projectDAO.deleteProject(map);
	}
//  태윤
	@Override
	public List<ListProjectView> selectMyProjectI(Member member, int numPerpage) {
		// TODO Auto-generated method stub
		return projectDAO.selectMyProjectI(member, numPerpage);
	}


}
