package com.kh.fundit.member.model.dao;

import com.kh.fundit.member.model.vo.Member;

public interface MemberDAO {

	int selectMemberCnt(Member member);

	int updateMemberPwd(Member member);

}
