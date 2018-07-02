package com.kh.fundit.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectDelivery;
import com.kh.fundit.project.model.vo.ProjectGift;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectSupport;
import com.kh.fundit.project.model.vo.ProjectView;

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
	public List<ListProjectView> selectMyProjectYet(Member member, int numPerpage) {
		RowBounds rowBounds = new RowBounds(0, numPerpage);
		
		return sqlSession.selectList("project.selectMyProjectYet", member, rowBounds);
	}
	
// 태윤
	@Override
	public List<ListProjectView> selectMyProjectYes(Member member , int numPerpage) {
		RowBounds rowBounds = new RowBounds(0, numPerpage);
		return sqlSession.selectList("project.selectMyProjectYes", member, rowBounds);
	}
	
	// 태윤
	@Override
	public List<ListProjectView> selectMyProjectNo(Member member, int numPerpage ) {
		RowBounds rowBounds = new RowBounds(0, numPerpage);
		return sqlSession.selectList("project.selectMyProjectNo", member, rowBounds);
	}
// 태윤
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
//영준

	@Override
	public int interestDelete(Map<String, Object> map) {
		return sqlSession.delete("project.interestDelete",map);
	}

//	희영
	@Override
	public List<ProjectGift> projectGiftList(Map<String, Object> map) {
		return sqlSession.selectList("project.projectGiftList", map);
	}
//영준
	public int rownum(String email) {
		return sqlSession.selectOne("project.rownum",email);
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

}
