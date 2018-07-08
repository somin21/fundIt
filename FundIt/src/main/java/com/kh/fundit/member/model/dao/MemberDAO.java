package com.kh.fundit.member.model.dao;

import java.util.List;
import java.util.Map;


import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.member.model.vo.Support;

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
	
	Profile selectProfile(String email);

	Member selectNaverByEmail(String naverEmail);

	int insertNaver(Map<String, Object> map);

	List<Support> selectSupportList(Map<String, String> map, int numPerPage, int numPerPage2);

	int insertMemberToken(Map<String, String> map);

	String selectToken(String email);

	int deleteToken(String email);

	



}
