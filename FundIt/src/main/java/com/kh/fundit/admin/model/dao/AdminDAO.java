package com.kh.fundit.admin.model.dao;

import java.util.List;

import com.kh.fundit.project.model.vo.ListProjectView;

public interface AdminDAO {

	List<ListProjectView> indexProject();

	int updateIndexYN();

	int updateAdminIndexYN(String[] arr);


}
