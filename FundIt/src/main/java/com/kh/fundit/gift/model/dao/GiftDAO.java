package com.kh.fundit.gift.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundit.gift.model.vo.Gift;
import com.kh.fundit.gift.model.vo.GiveGift;

public interface GiftDAO {

	List<Gift> selectMyGift(Map<String, String> map, int numPerPage, int numPerPage2);

	int updateDeliveryAddr(Gift gift);

	List<GiveGift> selectGiveGift(Map<String, String> map, int giftPage, int numPerPage);

}
