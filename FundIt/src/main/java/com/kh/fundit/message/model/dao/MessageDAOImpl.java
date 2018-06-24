package com.kh.fundit.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMessage(Map<String, Object> map) {
		return sqlSession.insert("message.insertMessage",map);
	}

	@Override
	public List<Message> selectMessageList(Map<String, Object> map) {
		
		return sqlSession.selectList("message.selectMessageList",map);
	}

	@Override
	public int totalMessageCount(String email) {
		return sqlSession.selectOne("message.totalMessageCount",email);
	}
	
}
