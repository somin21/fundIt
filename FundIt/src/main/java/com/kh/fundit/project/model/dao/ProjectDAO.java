package com.kh.fundit.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.fundit.admin.model.vo.AdminProjectView;
import com.kh.fundit.member.model.vo.Member;
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

public interface ProjectDAO {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage);

	List<ListProjectView> selectMyProjectYet(Member member, int numPerpage);
	
	List<ListProjectView> selectMyProjectYes(Member member, int numPerpage );
	
	List<ListProjectView> selectMyProjectNo(Member member, int numPerpage);
	
	int selectMyProjectCnt(Member member);
	
	List<ListProjectView> projectList(Map<String, String> map);

	List<ProjectView> projectView(Map<String, Object> map);

	List<ListProjectView> interestList(String email);

	Profile profileUser(String userEmail);

	List<ProjectView> oriProjectList(Map<String, String> map);

	int interestInsert(Map<String, Object> map);

	int interestCnt(Map<String, Object> map);

	int interestDelete(Map<String, Object> map);

	List<ProjectGift> projectGiftList(Map<String, Object> map);
	
	int insertPayment(Map<String, Object> map);

	List<ProjectGift> projectSeelctGift(Map<String, Object> map);

	int supportInsert(Map<String, Object> map);

	ProjectSupport supportList(Map<String, Object> map);

	int deliveryInsert(Map<String, Object> map);

	List<String> projectGiftLevel(Map<String, Object> map);

	List<Map<String, String>> projectGiftName(Map<String, Object> map);

	List<Community> communityList(Map<String, Object> map);

	int communityInsert(Map<String, Object> map);

	List<ListProjectView> interestList2(String email);

	List<ListProjectView> interestList1(String email);

	List<ListProjectView> interestList3(String email);

	List<ListProjectView> interestList4(String email);

	com.kh.fundit.member.model.vo.Profile makeProject(String email);

	int makeProjectOutline(ProjectOutline outline);

	void makeProjectProfile(com.kh.fundit.member.model.vo.Profile profile);

	int makeProjectFunding(ProjectFunding funding);
		
	void deleteItem(int projectNo);

	int insertItem(Item item);

	void updateItem(Item item);

	List<Item> selectItemList(int projectNo);

	void deleteGift(int projectNo);

	int insertGift(ProjectGift gift);

	void deleteGift(Map<String, Integer> map);

	ProjectGift selectGift(Map<String, Integer> map);

	int communityUpdate(Map<String, Object> map);

	List<SupportPayment> paymentCancel(Map<String, Object> map);

	int paymentCancelDel(Map<String, Object> map);

	int makeProjectStory(ProjectStory story);

	int makeProjectAccount(ProjectAccount account);

	int projectConfirm(int projectNo);

	ProjectOutline selectProjectOutline(int projectNo);

	int updateProjectOutline(ProjectOutline outline);

	ProjectFunding selectProjectFunding(int projectNo);

	int deleteProject(Map<String, Object> map);

	List<ListProjectView> selectMyProjectI(Member member, int numPerpage);

	ProjectStory projectStoryList(Map<String, Object> map);

	int emailAuthentication(Map<String, Object> map);

	List<String> emailAuthenticationList(Map<String, Object> map);

	void makeProjectMember(Map<String, String> map);

	ProjectView projectPreview(int projectNo);

	List<Integer> projectGiftMoneyList(int projectNo);

}
