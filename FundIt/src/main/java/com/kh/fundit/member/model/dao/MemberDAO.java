package com.kh.fundit.member.model.dao;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

public interface MemberDAO {

	int selectMemberCnt(Member member);
	
	int updateMemberPwd(Member member);
	
	Member selectMember(String email);
	
	int updateMember(Member member);
	
	int updateProfile(Profile profile);
	
	int insertMember(Member member);
	
	int checkEmailDuplicate(String email);
	
	Member selectMemberByEmail(String email);
	
	String selectProfileImg(Profile profile);

}
