package com.kh.fundit.gift.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.gift.model.service.GiftService;

@SessionAttributes({"memberLoggedIn"})
@Controller
public class GiftController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping("giftDeliveryList.do")
	public ModelAndView selectMyGiftList(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		
		
		
		
		return mav;
		
		
	}
	
	
	
	

}
