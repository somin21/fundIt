package com.kh.fundit.gift.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.gift.model.vo.Gift;

public interface GiftService {

	List<Gift> selectMyGift(Map<String, String> map, int numPerPage);

}
