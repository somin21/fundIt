package com.kh.fundit.member.model.service;

import java.util.List;
import java.util.Map;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

public interface MemberService {

	int selectMemberCnt(Member member);

	int updateMemberPwd(Member member);
	
	Member selectMember(String email);

	int updateMember(Member member);

	int updateProfile(Profile profile);

	int insertMember(Member member);

	int checkEmailDuplicate(String email);

	Member selectMemberByEmail(String email);

	String selectProfileImg(Profile profile);
	
	Profile selectProfile(String email);

	Member selectNaverByEmail(String naverEmail);

	int insertNaver(Map<String, Object> map);


}
