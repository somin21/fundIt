package com.kh.fundit.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.message.model.service.MessageService;
import com.kh.fundit.message.model.vo.Message;

@Controller


public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message/messageModal.do")
	public String messageInsert(@RequestParam("projectNo") int projectNo ,
			@RequestParam("email") String email) {
		
		return "message/messageModal";
	}
	
	
	@RequestMapping("/message/messageModal2.do")
	public ModelAndView messageInsert2(@RequestParam("email") String email,
			@RequestParam("email2") String email2,
	@RequestParam("messageNo") String messageNo){
	
		
		ModelAndView mav = new ModelAndView();
		Map<String ,Object> map = new HashMap<>();
		
		map.put("email", email);
		map.put("email2", email2);
		map.put("messageNo", messageNo);
		
		int result = messageService.readyn(map);
		
		String content = messageService.selectContent(map);
	
		mav.addObject("content", content);
		mav.setViewName("message/messageModal2");
		
		return mav;
	}
	
	@RequestMapping("/message/messageModal3.do")
	public ModelAndView messageInsert3(@RequestParam("email") String email,
			@RequestParam("email2") String email2,
	@RequestParam("messageNo") String messageNo){
	
		
		ModelAndView mav = new ModelAndView();
		Map<String ,Object> map = new HashMap<>();
		
		map.put("email", email);
		map.put("email2", email2);
		map.put("messageNo", messageNo);
		
		String content = messageService.selectContent(map);
	
		mav.addObject("content", content);
		mav.addObject("email",email);
		mav.addObject("email2",email2);
		mav.setViewName("message/messageModal3");
		
		return mav;
	}
	

	
	//영준
	@RequestMapping("/message/messageModalEnd.do")
	public ModelAndView messageInsertEnd(@RequestParam(name="messageContent") String messageContent,
			@RequestParam(name="receiveEmail") String receiveEmail,
			@RequestParam(name="sendEmail") String sendEmail ,
			@RequestParam(name="projectNo") int projectNo){
		
		ModelAndView mav = new ModelAndView();
		
		
		 Map<String ,Object> map = new HashMap<>();
		 
		 map.put("messageContent", messageContent);
		 map.put("receiveEmail", receiveEmail);
		 map.put("sendEmail", sendEmail);
		
		 int result = messageService.insertMessage(map);
		 String msg="";
		 String loc="";
		 
		 	if(result>0) {

		 		msg = "메세지 등록 성공";
		 		loc = "/project/projectView.do?projectNo="+projectNo;
		 	}else {
		 		msg = "메세지 등록 실패";
		 		loc = "/project/projectView.do?projectNo="+projectNo;
		 	}
		 	
		 	mav.addObject("result", result);
		 
		 	mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("common/msg");
		 
		return mav;
		
	}
	
	@RequestMapping("/message/messageModalEnd2.do")
	public ModelAndView messageInsertEnd2(@RequestParam(name="messageContent") String messageContent,
			@RequestParam(name="receiveEmail") String receiveEmail,
			@RequestParam(name="sendEmail") String sendEmail){
		
		ModelAndView mav = new ModelAndView();
	
		 Map<String ,Object> map = new HashMap<>();
		 
		 map.put("messageContent", messageContent);
		 map.put("receiveEmail", receiveEmail);
		 map.put("sendEmail", sendEmail);
		
		 
		 
		 int result = messageService.insertMessage2(map);
		 String msg="";
		 String loc="";
		 
		 	if(result>0) {

		 		msg = "메세지 등록 성공";
		 	
		 	}else {
		 		msg = "메세지 등록 실패";
		 	
		 	}
		 	
		 	mav.addObject("result", result);
		 	mav.addObject("msg", msg);
			
			mav.addObject("email", sendEmail);
			
			mav.setViewName("common/msg2");
		 
		return mav;
		
	}
	
	//영준
	@RequestMapping("/message/messageList.do")
	public ModelAndView messageList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email) {
		
		
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		
		
		List<Message> list = messageService.selectMessageList(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount(email);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList");
		
		return mav;
	}
	
	
	@RequestMapping("/message/messageList2.do")
	public ModelAndView messageList2(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email
			) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		
		
		List<Message> list = messageService.selectMessageList2(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount2(email);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList2");
		
		return mav;
	}
	
	@RequestMapping("message/messageSelect.do")
	public ModelAndView selectMessage(@RequestParam(name="messageSelect") String messageSelect,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		System.out.println(messageSelect);
		System.out.println(email);
		
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		 map.put("messageSelect",messageSelect);
		
		
		List<Message> list = messageService.selectMessageList3(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount3(map);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList3");
		
		return mav;
	}	
	
	@RequestMapping("message/messageSelect2.do")
	public ModelAndView selectMessage2(@RequestParam(name="messageSelect") String messageSelect,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		System.out.println(messageSelect);
		System.out.println(email);
		
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		 map.put("messageSelect",messageSelect);
		
		
		List<Message> list = messageService.selectMessageList4(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount4(map);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList5");
		
		return mav;
	}
	
	@RequestMapping("message/messageSelect3.do")
	public ModelAndView selectMessage3(@RequestParam(name="messageSelect") String messageSelect,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		System.out.println(messageSelect);
		System.out.println(email);
		
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		 map.put("messageSelect",messageSelect);
		
		
		List<Message> list = messageService.selectMessageList6(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount6(map);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList6");
		
		return mav;
	}
	
	
	@RequestMapping("/message/messageList5.do")
	public ModelAndView messageList4(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email
			) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
	
		
		List<Message> list = messageService.selectMessageList5(map,cPage,numPerPage);
	
		int count = messageService.totalMessageCount5(map);;
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList4");
		
		return mav;
	}
	
	@RequestMapping("/message/readyn.do")
	@ResponseBody
	public Map<String,Object> imagereadyn(@RequestParam("email") String email)  {
	
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		int count = messageService.imagereadyn(email);
		map.put("count", count);
		
		return map;		  
		
	}
	
}
