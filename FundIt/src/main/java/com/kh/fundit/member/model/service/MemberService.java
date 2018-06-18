package com.kh.fundit.member.model.service;

import com.kh.fundit.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	int checkEmailDuplicate(String email);

	Member selectMemberByEmail(String email);
	
}
