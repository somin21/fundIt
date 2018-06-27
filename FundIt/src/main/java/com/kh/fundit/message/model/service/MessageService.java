package com.kh.fundit.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.message.model.vo.Message;

public interface MessageService {

	int insertMessage(Map<String, Object> map);

	List<Message> selectMessageList(Map<String, Object> map, int cPage, int numPerPage);

	int totalMessageCount(String email);

	int insertMessage2(Map<String, Object> map);

	String selectContent(Map<String, Object> map);

	List<Message> selectMessageList2(Map<String, Object> map, int cPage, int numPerPage);

	int totalMessageCount2(String email);


	

}
