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
	public List<Message> selectMessageList(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList",map,rowBounds);
	}

	@Override
	public int totalMessageCount(String email) {
		return sqlSession.selectOne("message.totalMessageCount",email);
	}

	@Override
	public int insertMessage2(Map<String, Object> map) {
		return sqlSession.insert("message.insertMessage2",map);
	}

	@Override
	public String selectContent(Map<String, Object> map) {
		return sqlSession.selectOne("message.selectContent",map);
	}

	@Override
	public List<Message> selectMessageList2(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList2",map,rowBounds);
	}

	@Override
	public int totalMessageCount2(String email) {
		return sqlSession.selectOne("message.totalMessageCount2",email);
	}

	@Override
	public List<Message> selectMessageList3(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList3",map,rowBounds);
	}

	@Override
	public int totalMessageCount3(Map<String, Object> map) {
		return sqlSession.selectOne("message.totalMessageCount3",map);
	}

	@Override
	public List<Message> selectMessageList4(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList4",map,rowBounds);
	}

	@Override
	public int totalMessageCount4(Map<String, Object> map) {
		return sqlSession.selectOne("message.totalMessageCount4",map);
	}

	@Override
	public int readyn(Map<String, Object> map) {
		return sqlSession.update("message.readyn",map);
	}

	@Override
	public List<Message> selectMessageList5(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList5",map,rowBounds);
	}

	@Override
	public int totalMessageCount5(Map<String, Object> map) {
		return sqlSession.selectOne("message.totalMessageCount5",map);
	}

	@Override
	public int imagereadyn(String email) {
		return sqlSession.selectOne("message.imagereadyn",email);
	}

	@Override
	public List<Message> selectMessageList6(Map<String, Object> map, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectMessageList6",map,rowBounds);
	}

	@Override
	public int totalMessageCount6(Map<String, Object> map) {
		return sqlSession.selectOne("message.totalMessageCount6",map);
	}





	




	
}
