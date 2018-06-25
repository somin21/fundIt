package com.kh.fundit.message.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundit.message.model.vo.Message;

public interface MessageDAO {

	int insertMessage(Map<String, Object> map);

	
	int totalMessageCount(String email);


	List<Message> selectMessageList(Map<String, Object> map, int cPage, int numPerPage);

}
