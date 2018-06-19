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
	public int selectMemberCnt(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectMemberCnt", member);
	}


	@Override
	public int updateMemberPwd(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateMemberPwd", member);
	}

}
