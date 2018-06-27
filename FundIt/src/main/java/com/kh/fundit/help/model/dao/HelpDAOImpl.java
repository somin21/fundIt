package com.kh.fundit.help.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.help.model.vo.Help;

@Repository
public class HelpDAOImpl implements HelpDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHelpMsg(Map<String, String> map) {
		return sqlSession.insert("help.insertHelpMassage", map);
	}

}
