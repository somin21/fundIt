package com.kh.fundit.member.model.dao;

import java.util.List;
import java.util.Map;


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
<<<<<<< HEAD
	
	String selectProfileImg(Profile profile);
=======
	
	String selectProfileImg(Profile profile);
	
	Profile selectProfile(String email);

	Member selectNaverByEmail(String naverEmail);

	int insertNaver(Map<String, Object> map);


>>>>>>> branch 'master' of https://github.com/somin21/fundIt.git

}
