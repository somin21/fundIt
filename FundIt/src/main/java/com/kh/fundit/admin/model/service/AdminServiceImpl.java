package com.kh.fundit.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.admin.model.dao.AdminDAO;
import com.kh.fundit.admin.model.vo.AdminProjectView;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectGift;

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

	@Override
	public List<ListProjectView> projectConfirmList() {
		return adminDAO.projectConfirmList();
	}

	@Override
	public List<AdminProjectView> adminProjectView(Map<String, Object> map) {
		return adminDAO.adminProjectView(map);
	}

	@Override
	public List<ProjectGift> projectGiftList(Map<String, Object> map) {
		return adminDAO.projectGiftList(map);
	}

	@Override
	public Profile profileUser(String userEmail) {
		return adminDAO.profileUser(userEmail);
	}

	@Override
	public int projectConfirmY(String no) {
		return adminDAO.projectConfirmY(no);
	}

	@Override
	public int projectConfirmF(String no) {
		return adminDAO.projectConfirmF(no);
	}

	
	
	
	
}
