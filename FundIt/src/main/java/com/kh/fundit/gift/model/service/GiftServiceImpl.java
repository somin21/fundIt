package com.kh.fundit.gift.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.gift.model.dao.GiftDAO;

@Service
public class GiftServiceImpl implements GiftService {
	
	@Autowired
	private GiftDAO giftDAO;

}
