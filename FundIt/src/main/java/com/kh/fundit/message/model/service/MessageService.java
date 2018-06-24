package com.kh.fundit.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.message.model.vo.Message;

public interface MessageService {

	int insertMessage(Map<String, Object> map);

	List<Message> selectMessageList(Map<String, Object> map);

	int totalMessageCount(String email);

}
