package com.kh.fundit.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.project.model.vo.ListProjectView;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ListProjectView> indexProject() {
		return sqlSession.selectList("admin.indexProject");
	}

	@Override
	public int updateIndexYN() {
		int result = sqlSession.update("admin.updateIndex");
		System.out.println("22222222222222222"+ result);
		return result;
	}

	@Override
	public int updateAdminIndexYN(String[] arr) {
		
		int result = sqlSession.update("admin.updateAdminIndexYN",arr);
		System.out.println("#333333333333333" + result);
		return result;
	}
}
