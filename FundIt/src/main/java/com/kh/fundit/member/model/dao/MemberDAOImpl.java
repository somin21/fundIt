package com.kh.fundit.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.member.model.vo.Support;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public int selectMemberCnt(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectMemberCnt", member);
	}


	@Override
	public int updateMemberPwd(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateMemberPwd", member);
	}
	
	@Override
	public Member selectMember(String email) {
		Member member = sqlSession.selectOne("member.selectMember",email);
		return member;
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int updateProfile(Profile profile) {
		int result = sqlSession.update("member.updateProfile", profile);
		return result;
	}
	
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		return sqlSession.selectOne("member.checkEmailDuplicate",email);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return sqlSession.selectOne("member.selectMemberByEmail",email);
	}

	@Override
	public String selectProfileImg(Profile profile) {
		return sqlSession.selectOne("member.selectProfileImg",profile);
	}
	
	@Override
	public Profile selectProfile(String email) {
		return sqlSession.selectOne("member.selectProfile",email);
	}

	@Override
	public Member selectNaverByEmail(String naverEmail) {
		return sqlSession.selectOne("member.selectNaverByEmail",naverEmail);
	}


	@Override
	public int insertNaver(Map<String, Object> map) {
		return sqlSession.insert("member.insertNaver",map);
	}


	@Override
	public List<Support> selectSupportList(Map<String, String> map,int page, int numPerPage) {
		// TODO Auto-generated method stub
		
		RowBounds rowBounds = new RowBounds(numPerPage*(page-1), numPerPage);
		
		return sqlSession.selectList("member.selectSupportList", map, rowBounds);
	}


	@Override
	public int insertMemberToken(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateMemberToken", map);
	}


	@Override
	public String selectToken(String email) {
		
		return sqlSession.selectOne("member.selectToken", email);
	}


	@Override
	public int deleteToken(String email) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.deleteToken", email);
	}







}
