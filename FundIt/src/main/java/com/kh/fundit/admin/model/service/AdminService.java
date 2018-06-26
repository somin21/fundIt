package com.kh.fundit.admin.model.service;

import java.util.List;

import com.kh.fundit.project.model.vo.ListProjectView;

public interface AdminService {

	List<ListProjectView> indexProject();

	int updateIndexYN(String[] arr);
}
