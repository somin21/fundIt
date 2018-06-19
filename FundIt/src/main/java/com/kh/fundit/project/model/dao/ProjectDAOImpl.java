package com.kh.fundit.project.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectOutline;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	소민
	@Override
	public List<ProjectOutline> selectIndexProject() {
		
		return sqlSession.selectList("project.selectIndexProject");
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage) {

		RowBounds rowBounds = new RowBounds(numPerpage*(newProjectPage-1), numPerpage);
		
		return sqlSession.selectList("project.selectIndexNewProject", null, rowBounds);
	}

//	소민
	@Override
	public List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage) {

		RowBounds rowBounds = new RowBounds(numPerpage*(deadlineProjectPage-1), numPerpage);
		
		return sqlSession.selectList("project.selectIndexDeadlineProject", null, rowBounds);
	}

}
