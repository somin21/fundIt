package com.kh.fundit.member.model.dao;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

public interface MemberDAO {

	Member selectMember(String email);

	int updateMember(Member member);

	int updateProfile(Profile profile);

}
