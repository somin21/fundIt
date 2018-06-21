package com.kh.fundit.project.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectView;

public interface ProjectService {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> projectList(Map<String, String> map);

	List<ProjectView> projectView(Map<String, Integer> map);

	Profile profileUser(String userEmail);

}
