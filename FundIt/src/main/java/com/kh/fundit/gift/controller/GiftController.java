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
import com.kh.fundit.gift.model.vo.GiveGift;

@SessionAttributes({"memberLoggedIn"})
@Controller
public class GiftController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping("/gift/giftDeliveryList.do")
	public ModelAndView selectMyGiftList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("gift/giftDeliveryList");
		return mav;
		
		
	}
		
	@RequestMapping("/gift/findAddress.do")
	public ModelAndView findAddress(@RequestParam String idNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println(idNum);
		
		mav.addObject("idNum",idNum);
		mav.setViewName("gift/findAddress");
		return mav;
		
		
	}
	@RequestMapping("/gift/selectMyGiftList")
	@ResponseBody
	public List<Gift> selectMyGiftBefore(@RequestParam String email, @RequestParam (value = "page", required = false, defaultValue = "1" ) int myGiftPage, @RequestParam (value="searchType", required = false, defaultValue = "All") String searchType){
		System.out.println(searchType);
		int numPerPage = 4;
		Map <String , String> map = new HashMap<>();
		map.put("email", email);
		map.put("searchType", searchType);
		
		
		List<Gift> list = giftService.selectMyGift(map,myGiftPage,numPerPage);
		
		System.out.println(list);
		return list;
		
	}
	
	@RequestMapping("/gift/updateDeliveryAddr.do")
	@ResponseBody
	public int updateDeliveryAddr(@RequestParam String postNum, @RequestParam String address, @RequestParam String supportNo) {

		int supportNum = Integer.parseInt(supportNo);

		Gift gift = new Gift();
		gift.setPostNum(postNum);
		gift.setAddress(address);
		gift.setSupportNo(supportNum);
		
		System.out.println(gift);
		
		int result = giftService.updateDeliveryAddr(gift);
		
		return result;
	}
	
	@RequestMapping("/gift/giftGiveDeliveryList.do")
	public ModelAndView selectMyGiveGiftList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("gift/giftGiveDeliveryList");
		return mav;
		
		
	}
	
	@RequestMapping("/gift/selectGiveGiftList")
	@ResponseBody
	public List<GiveGift> selectGiveGift(@RequestParam String email,@RequestParam(value="page", required=false, defaultValue="1") int GiftPage, @RequestParam (value="searchType", required = false, defaultValue = "All") String searchType){
		
		Map <String , String> map = new HashMap<>();
		map.put("email", email);
		map.put("searchType", searchType);
		int numPerPage = 4;
		List<GiveGift> list = giftService.selectGiveGift(map, GiftPage, numPerPage);
		System.out.println(list);
		return list;
		
		
	}
	
	
	
	
	

}
