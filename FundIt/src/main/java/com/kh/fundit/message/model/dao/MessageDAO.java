package com.kh.fundit.message.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundit.message.model.vo.Message;

public interface MessageDAO {

	int insertMessage(Map<String, Object> map);

	
	int totalMessageCount(String email);


	List<Message> selectMessageList(Map<String, Object> map, int cPage, int numPerPage);


	int insertMessage2(Map<String, Object> map);


	String selectContent(Map<String, Object> map);


	List<Message> selectMessageList2(Map<String, Object> map, int cPage, int numPerPage);


	int totalMessageCount2(String email);





}
