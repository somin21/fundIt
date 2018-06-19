package com.kh.fundit.project.model.dao;

import java.util.List;

import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;

public interface ProjectDAO {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage);

}
