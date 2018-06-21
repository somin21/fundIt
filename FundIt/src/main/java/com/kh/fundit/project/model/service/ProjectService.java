package com.kh.fundit.project.model.service;


import java.util.List;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;

public interface ProjectService {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage);
	
	//태윤
	List<ListProjectView> selectMyProjectYet(Member member);
	List<ListProjectView> selectMyProjectYes(Member member);
	List<ListProjectView> selectMyProjectNo(Member member);
	//태윤
	int selectMyProjectCnt(Member member);

}
