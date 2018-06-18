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
	public int insertMember(Member member) {
	
		return memberDAO.insertMember(member); 
	}

	@Override
	public int checkEmailDuplicate(String email) {
		return memberDAO.checkEmailDuplicate(email);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return memberDAO.selectMemberByEmail(email);
	}

}
