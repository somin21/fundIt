package com.kh.fundit.gift.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundit.gift.model.vo.Gift;
import com.kh.fundit.gift.model.vo.GiveGift;

@Repository
public class GiftDAOImpl implements GiftDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Gift> selectMyGift(Map<String, String> map, int myGiftPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds(numPerPage*(myGiftPage-1), numPerPage);
		
		return sqlSession.selectList("gift.selectMyGiftList", map, rowBounds);
	}

	@Override
	public int updateDeliveryAddr(Gift gift) {
		
		
		return sqlSession.update("gift.updateDeliveryAddr", gift);
	}

	@Override
	public List<GiveGift> selectGiveGift(Map<String, String> map, int giftPage, int numPerPage) {
		
		RowBounds rowBounds = new RowBounds(numPerPage*(giftPage-1), numPerPage);
		
		return sqlSession.selectList("gift.selectGiveList",map, rowBounds);
	}	

}
