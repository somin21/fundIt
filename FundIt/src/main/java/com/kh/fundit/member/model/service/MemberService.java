package com.kh.fundit.member.model.service;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

public interface MemberService {

	Member selectMember(String email);

	int updateMember(Member member);

	int updateProfile(Profile profile);

}
