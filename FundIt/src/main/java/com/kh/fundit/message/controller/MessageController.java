package com.kh.fundit.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//영준
	@RequestMapping("/message/messageModalEnd.do")
	public String messageInsertEnd(@RequestParam(name="messageContent") String messageContent,
			@RequestParam(name="receiveEmail") String receiveEmail,
			@RequestParam(name="sendEmail") String sendEmail ){
		
		 Map<String ,Object> map = new HashMap<>();
		 
		 map.put("messageContent", messageContent);
		 map.put("receiveEmail", receiveEmail);
		 map.put("sendEmail", sendEmail);
		
		 int result = messageService.insertMessage(map);
		 
		return "project/projectView";
		
	}
	//영준
	@RequestMapping("/message/messageList.do")
	public ModelAndView messageList(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			,@RequestParam("email") String email) {
		
		ModelAndView mav  = new ModelAndView();
		int numPerPage = 10;
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		 Map<String ,Object> map = new HashMap<>();
		 map.put("cPage", cPage);
		 map.put("email", email);
		 map.put("numPerPage",numPerPage);
		 map.put("rowBounds",rowBounds);
		
		List<Message> list = messageService.selectMessageList(map);
	
		int count = messageService.totalMessageCount(email);
		
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("message/messageList");
		
		return mav;
	}
	
	
	
}
