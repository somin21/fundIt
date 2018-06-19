package com.kh.fundit.member.model.service;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

public interface MemberService {

	int selectMemberCnt(Member member);

	int updateMemberPwd(Member member);
	
	Member selectMember(String email);

	int updateMember(Member member);

	int updateProfile(Profile profile);
}
