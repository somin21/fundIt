package com.kh.fundit.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.admin.model.vo.AdminMember;
import com.kh.fundit.admin.model.vo.AdminMessage;
import com.kh.fundit.admin.model.vo.AdminProjectView;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectGift;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ListProjectView> indexProject() {
		return sqlSession.selectList("admin.indexProject");
	}

	@Override
	public int updateIndexYN() {
		int result = sqlSession.update("admin.updateIndex");
		return result;
	}

	@Override
	public int updateAdminIndexYN(String[] arr) {
		
		int result = sqlSession.update("admin.updateAdminIndexYN",arr);
		return result;
	}

	@Override
	public List<ListProjectView> projectConfirmList() {
		return sqlSession.selectList("admin.projectConfirmList");
	}

	@Override
	public List<AdminProjectView> adminProjectView(Map<String, Object> map) {
		return sqlSession.selectList("admin.adminProjectView",map);
	}

	@Override
	public List<ProjectGift> projectGiftList(Map<String, Object> map) {
		return sqlSession.selectList("admin.projectGiftList",map);
	}

	@Override
	public Profile profileUser(String userEmail) {
		return sqlSession.selectOne("admin.profileUser",userEmail);
	}

	@Override
	public int projectConfirmY(String no) {
		return sqlSession.update("admin.projectConfirmY",no);
	}

	@Override
	public int projectConfirmF(String no) {
		return sqlSession.update("admin.projectConfirmF",no);
	}

	@Override
	public List<AdminMember> memberList() {
		return sqlSession.selectList("admin.memberList");
	}

	@Override
	public int adminMemberDelete(String email) {
		return sqlSession.update("admin.adminMemberDelete",email);
	}

	@Override
	public List<ListProjectView> projectDeadLineList() {
		return sqlSession.selectList("admin.projectDeadlineList");
	}

	@Override
	public List<AdminProjectView> projectDeadlineView(Map<String, Object> map) {
		return sqlSession.selectList("admin.projectDeadlineView",map);
	}

	@Override
	public List<AdminMember> memberSearchList(String email) {
		return sqlSession.selectList("admin.memberSearchList",email);
	}

	@Override
	public List<AdminMessage> adminMessageList() {
		return sqlSession.selectList("admin.adminMessage");
	}

	@Override
	public AdminMessage selectMessage(String messageNo) {
		return sqlSession.selectOne("admin.selectMessage", messageNo);
	}

	@Override
	public int updateReadyn(String messageNo) {
		return sqlSession.update("admin.updateReadyn",messageNo);
	}

	@Override
	public List<AdminMessage> selectReadN() {
		return sqlSession.selectList("admin.selectReadN");
	}

	@Override
	public int replyMessage(Map<String,String> map1) {
		return sqlSession.insert("admin.replyMessage",map1);
	}
}
