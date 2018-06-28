package com.kh.fundit.gift.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.gift.model.vo.Gift;

@Repository
public class GiftDAOImpl implements GiftDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Gift> selectMyGift(Map<String, String> map, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds(0, numPerPage);
		
		return sqlSession.selectList("gift.selectMyGiftList", map, rowBounds);
	}

	@Override
	public int updateDeliveryAddr(Gift gift) {
		
		
		return sqlSession.update("gift.updateDeliveryAddr", gift);
	}	

}
