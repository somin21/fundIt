package com.kh.fundit.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.admin.model.dao.AdminDAO;
import com.kh.fundit.project.model.vo.ListProjectView;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<ListProjectView> indexProject() {
		return adminDAO.indexProject();
	}

	@Override
	public int updateIndexYN(String[] arr) {
		int result = 0;
		
		try {
			result = adminDAO.updateIndexYN();
			if(result == 4) {
				result = adminDAO.updateAdminIndexYN(arr);
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}


	
	
	
}
