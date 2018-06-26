package com.kh.fundit.gift.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.gift.model.service.GiftService;
import com.kh.fundit.gift.model.vo.Gift;

@SessionAttributes({"memberLoggedIn"})
@Controller
public class GiftController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping("/gift/giftDeliveryList.do")
	public ModelAndView selectMyGiftList(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("email", email);
		mav.setViewName("gift/giftDeliveryList");
		return mav;
		
		
	}
	@RequestMapping("/gift/selectMyGiftList")
	@ResponseBody
	public List<Gift> selectMyGiftBefore(@RequestParam String email, @RequestParam (value = "page", required = false, defaultValue = "8" ) int numPerPage, @RequestParam (value="searchType", required = false, defaultValue = "All") String searchType){
		System.out.println(searchType);
		
		Map <String , String> map = new HashMap<>();
		map.put("email", email);
		map.put("searchType", searchType);
		
		
		List<Gift> list = giftService.selectMyGift(map, numPerPage);
		
		System.out.println(list);
		return list;
		
	}
	
	
	
	

}
