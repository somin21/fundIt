package com.kh.fundit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.admin.model.dao.AdminDAO;
import com.kh.fundit.project.model.vo.ListProjectView;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	/*@Override
	public ListProjectView selectpListView() {
		return adminDAO.selectpListView();
	}*/
	
}
