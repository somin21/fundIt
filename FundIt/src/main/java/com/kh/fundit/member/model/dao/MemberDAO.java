package com.kh.fundit.member.model.dao;

import com.kh.fundit.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	int checkEmailDuplicate(String email);

	Member selectMemberByEmail(String email);

}
