package com.kh.fundit.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

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
		System.out.println("나 다오 임플왔당!");
		int result = sqlSession.update("member.updateProfile", profile);
		System.out.println("DAOImPle = "+result);
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

//  태윤
	@Override
	public String selectProfileImg(Profile profile) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("profile.selectProfileImg",profile);
	}

}