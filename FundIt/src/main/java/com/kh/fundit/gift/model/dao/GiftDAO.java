package com.kh.fundit.gift.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundit.gift.model.vo.Gift;

public interface GiftDAO {

	List<Gift> selectMyGift(Map<String, String> map, int numPerPage);

}
