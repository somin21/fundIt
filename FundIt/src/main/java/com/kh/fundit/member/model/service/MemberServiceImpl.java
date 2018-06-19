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
	public int selectMemberCnt(Member member) {
		
		return memberDAO.selectMemberCnt(member);
	}

	@Override
	public int updateMemberPwd(Member member) {

		return memberDAO.updateMemberPwd(member);
	}
	
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
