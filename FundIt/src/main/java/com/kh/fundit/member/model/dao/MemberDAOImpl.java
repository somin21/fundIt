package com.kh.fundit.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

}
