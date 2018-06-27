package com.kh.fundit.help.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.help.model.dao.HelpDAO;
import com.kh.fundit.help.model.vo.Help;

@Service
public class HelpServiceImpl implements HelpService {
	
	@Autowired
	private HelpDAO helpDAO;

	@Override
	public int insertHelpMsg(Map<String, String> map) {

		return helpDAO.insertHelpMsg(map);
	}

}
