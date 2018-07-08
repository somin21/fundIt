package com.kh.fundit.gift.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.gift.model.vo.Gift;
import com.kh.fundit.gift.model.vo.GiveGift;

public interface GiftService {

	
	List<Gift> selectMyGift(Map<String, String> map, int myGiftPage, int numPerPage);

	int updateDeliveryAddr(Gift gift);

	List<GiveGift> selectGiveGift(Map<String, String> map, int giftPage, int numPerPage);


	

}
