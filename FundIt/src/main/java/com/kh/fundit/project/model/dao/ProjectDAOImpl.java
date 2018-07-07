package com.kh.fundit.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	소민
	@Override
	public List<ProjectOutline> selectIndexProject() {
		
		return sqlSession.selectList("project.selectIndexProject");
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage) {
		
		RowBounds rowBounds = new RowBounds(numPerpage*(popularProjectPage-1), numPerpage);
		
		return sqlSession.selectList("project.selectIndexPopularProject", null, rowBounds);
	}
	
//	소민
	@Override
	public List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage) {

		RowBounds rowBounds = new RowBounds(numPerpage*(newProjectPage-1), numPerpage);
		
		return sqlSession.selectList("project.selectIndexNewProject", null, rowBounds);
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage) {

		RowBounds rowBounds = new RowBounds(numPerpage*(deadlineProjectPage-1), numPerpage);
		
		return sqlSession.selectList("project.selectIndexDeadlineProject", null, rowBounds);
	}

// 태윤
	@Override
	public List<ListProjectView> selectMyProjectYet(Member member,int page, int numPerpage) {
		RowBounds rowBounds = new RowBounds(numPerpage*(page-1), numPerpage);
		
		return sqlSession.selectList("project.selectMyProjectYet", member, rowBounds);
	}
	
//	태윤
	@Override
	public List<ListProjectView> selectMyProjectYes(Member member,int page , int numPerpage) {
		RowBounds rowBounds = new RowBounds(numPerpage*(page-1), numPerpage);
		return sqlSession.selectList("project.selectMyProjectYes", member, rowBounds);
	}
	
//	태윤
	@Override
	public List<ListProjectView> selectMyProjectNo(Member member,int page, int numPerpage ) {
		RowBounds rowBounds = new RowBounds(numPerpage*(page-1), numPerpage);
		return sqlSession.selectList("project.selectMyProjectNo", member, rowBounds);
	}
	
//	태윤
	@Override
	public int selectMyProjectCnt(Member member) {
		
		return sqlSession.selectOne("project.selectMyProjectCnt",member);
	}

//	희영
	@Override
	public List<ListProjectView> projectList(Map<String, String> map) {
		
		return sqlSession.selectList("project.projectList", map);
	}

//	희영
	@Override
	public List<ProjectView> projectView(Map<String, Object> map) {
		
		return sqlSession.selectList("project.projectView", map);
	}

	@Override
	public List<ListProjectView> interestList(String email) {
		return sqlSession.selectList("project.interestList",email);
	}
	
//	희영
	@Override
	public Profile profileUser(String userEmail) {
		return sqlSession.selectOne("project.profileUser", userEmail);
	}
	
//	희영
	@Override
	public List<ProjectView> oriProjectList(Map<String, String> map) {
		return sqlSession.selectList("project.oriProjectList", map);
	}
	
//	희영
	@Override
	public int interestInsert(Map<String, Object> map) {
		return sqlSession.insert("project.interestInsert", map);
	}
	
//	희영
	@Override
	public int interestCnt(Map<String, Object> map) {
		return sqlSession.selectOne("project.interestCnt", map);
	}
	
//	영준
	@Override
	public int interestDelete(Map<String, Object> map) {
		return sqlSession.delete("project.interestDelete",map);
	}

//	희영
	@Override
	public List<ProjectGift> projectGiftList(Map<String, Object> map) {
		return sqlSession.selectList("project.projectGiftList", map);
	}
	
//	희영
	@Override
	public int insertPayment(Map<String, Object> map) {
		return sqlSession.insert("project.insertPayment", map);
	}
	
//	희영
	@Override
	public List<ProjectGift> projectSeelctGift(Map<String, Object> map) {
		return sqlSession.selectList("project.projectSeelctGift", map);
	}
	
//	희영
	@Override
	public int supportInsert(Map<String, Object> map) {
		return sqlSession.insert("project.supportInsert", map);
	}
	
//	희영
	@Override
	public ProjectSupport supportList(Map<String, Object> map) {
		return sqlSession.selectOne("project.supportList", map);
	}
	
//	희영	
	@Override
	public int deliveryInsert(Map<String, Object> map) {
		return sqlSession.insert("project.deliveryInsert", map);
	}

//	소민
	@Override
	public com.kh.fundit.member.model.vo.Profile makeProject(String email) {
		
		return sqlSession.selectOne("project.makeProject", email);
	}

//	소민
	@Override
	public int makeProjectOutline(ProjectOutline outline) {

		return sqlSession.insert("project.makeProjectOutline", outline);
	}

//	소민
	@Override
	public void makeProjectProfile(com.kh.fundit.member.model.vo.Profile profile) {
		
		sqlSession.update("project.makeProjectProfile", profile);
	}

//	소민
	@Override
	public int makeProjectFunding(ProjectFunding funding) {

		return sqlSession.insert("project.makeProjectFunding", funding); 
	}
	
//	소민
	@Override
	public void deleteItem(int projectNo) {

		sqlSession.delete("project.deleteItem", projectNo);
	}

//	소민
	@Override
	public int insertItem(Item item) {
		
		return sqlSession.insert("project.insertItem", item);
	}

//	소민
	@Override
	public void updateItem(Item item) {
		
		sqlSession.update("project.updateItem", item);
	}
	
//	소민
	@Override
	public List<Item> selectItemList(int projectNo) {
		
		return sqlSession.selectList("project.selectItemList", projectNo);
	}

//	소민
	@Override
	public void deleteGift(int projectNo) {

		sqlSession.delete("project.deleteGift", projectNo);
	}

//	소민
	@Override
	public int insertGift(ProjectGift gift) {

		return sqlSession.delete("project.insertGift", gift);
	}

//	소민
	@Override
	public void deleteGift(Map<String, Integer> map) {

		sqlSession.delete("project.deleteGiftOne", map);
	}
	
//	소민
	@Override
	public ProjectGift selectGift(Map<String, Integer> map) {
		
		return sqlSession.selectOne("project.selectGift", map);
	}
	
//	희영
	@Override
	public List<String> projectGiftLevel(Map<String, Object> map) {
		return sqlSession.selectList("project.projectGiftLevel", map);
	}
	
//	희영
	@Override
	public List<Map<String, String>> projectGiftName(Map<String, Object> map) {
		return sqlSession.selectList("project.projectGiftName", map);
	}
	
//	희영
	@Override
	public List<Community> communityList(Map<String, Object> map) {
		return sqlSession.selectList("project.communityList", map);
	}
//	희영
	@Override
	public int communityInsert(Map<String, Object> map) {
		return sqlSession.insert("project.communityInsert", map);
	}

//	영준
	@Override
	public List<ListProjectView> interestList2(String email) {
		return sqlSession.selectList("project.interestList2",email);
	}
	
//	영준
	@Override
	public List<ListProjectView> interestList1(String email) {
		return sqlSession.selectList("project.interestList1",email);
	}
	
//	영준
	@Override
	public List<ListProjectView> interestList3(String email) {
		return sqlSession.selectList("project.interestList3",email);
	}
	
//	영준
	@Override
	public List<ListProjectView> interestList4(String email) {
		return sqlSession.selectList("project.interestList4",email);
	}
	
//	희영
	@Override
	public int communityUpdate(Map<String, Object> map) {
		return sqlSession.update("project.communityUpdate",map);
	}
//	희영
	@Override
	public List<SupportPayment> paymentCancel(Map<String, Object> map) {
		return sqlSession.selectList("project.paymentCancel",map);
	}
//	희영
	@Override
	public int paymentCancelDel(Map<String, Object> map) {
		return sqlSession.update("project.paymentCancelDel",map);
	}

//	소민
	@Override
	public int makeProjectStory(ProjectStory story) {

		return sqlSession.insert("project.makeProjectStory",story);
	}

//	소민
	@Override
	public int makeProjectAccount(ProjectAccount account) {
		
		return sqlSession.insert("project.makeProjectAccount",account);
	}

//	소민
	@Override
	public int projectConfirm(int projectNo) {
		
		return sqlSession.update("project.projectConfirm", projectNo);
	}

//	소민
	@Override
	public ProjectOutline selectProjectOutline(int projectNo) {
		
		return sqlSession.selectOne("project.selectProjectOutline", projectNo);
	}

//	소민
	@Override
	public int updateProjectOutline(ProjectOutline outline) {
		
		return sqlSession.selectOne("project.updateProjectOutline", outline);
	}

	@Override
	public ProjectFunding selectProjectFunding(int projectNo) {
		
		return sqlSession.selectOne("project.selectProjectFunding",projectNo);
	}

//  태윤
	@Override
	public int deleteProject(Map<String, Object> map) {
		
		  sqlSession.delete("project.deleteCommunity", map);
		
		  sqlSession.delete("project.deleteInterest", map);
		
		  sqlSession.delete("project.deleteAccount", map);
		
		  sqlSession.delete("project.deleteDeadline", map);
		
		  sqlSession.delete("project.deleteFunding", map);
	
		  sqlSession.delete("project.deleteMyGift", map);
		
		  sqlSession.delete("project.deleteStory", map);
		
		  sqlSession.delete("project.deleteSummary", map);
		
		  sqlSession.delete("project.deleteSupport", map);
		
		  
		return sqlSession.delete("project.deleteProject", map);
	}
//  태윤
	@Override
	public List<ListProjectView> selectMyProjectI(Member member,int page, int numPerpage) {
		RowBounds rowBounds = new RowBounds(numPerpage*(page-1), numPerpage);
		return sqlSession.selectList("project.selectMyProjectI", member, rowBounds);
	}
//	희영
	@Override
	public ProjectStory projectStoryList(Map<String, Object> map) {
		return sqlSession.selectOne("project.projectStoryList", map);

	}
//	희영
	@Override
	public int emailAuthentication(Map<String, Object> map) {
		return sqlSession.insert("project.emailAuthentication", map);
	}
//	희영
	@Override
	public List<String> emailAuthenticationList(Map<String, Object> map) {
		return sqlSession.selectList("project.emailAuthenticationList", map);
	}

//	희영
	@Override
	public List<String> emailAuthenticationListN(Map<String, Object> map) {
		return sqlSession.selectList("project.emailAuthenticationListN", map);
	}
//	희영
	@Override
	public List<String> emailNumList(Map<String, Object> map) {
		return sqlSession.selectList("project.emailNumList", map);
	}

//	소민
	@Override
	public void makeProjectMember(Map<String, String> map) {
		
		sqlSession.update("project.makeProjectMember", map);		
	}

//	소민
	@Override
	public ProjectView projectPreview(int projectNo) {
		
		return sqlSession.selectOne("project.projectPreview",projectNo);
	}

//	소민
	@Override
	public List<Integer> projectGiftMoneyList(int projectNo) {
		
		return sqlSession.selectList("project.projectGiftMoneyList",projectNo);
	}

}
