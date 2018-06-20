package com.kh.fundit.project.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectView;

public interface ProjectDAO {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> projectList(Map<String, String> map);

	List<ProjectView> projectView(Map<String, Integer> map);

}
