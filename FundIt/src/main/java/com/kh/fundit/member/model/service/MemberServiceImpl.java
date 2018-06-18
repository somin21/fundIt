package com.kh.fundit.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.member.model.dao.MemberDAO;
import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public Member selectMember(String email) {
		return memberDAO.selectMember(email);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int updateProfile(Profile profile) {
		return memberDAO.updateProfile(profile);
	}

}
