package com.kh.fundit.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.member.model.dao.MemberDAO;
import com.kh.fundit.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int selectMemberCnt(Member member) {
		
		return memberDAO.selectMemberCnt(member);
	}

	@Override
	public int updateMemberPwd(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.updateMemberPwd(member);
	}

}
