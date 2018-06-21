package com.kh.fundit.gift.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GiftDAOImpl implements GiftDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
