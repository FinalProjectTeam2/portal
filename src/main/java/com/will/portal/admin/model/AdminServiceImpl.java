package com.will.portal.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.common.AdminSubjSearchVO;
import com.will.portal.subj_type.model.Subj_typeVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired 
	private AdminDAO adminDao;

	@Override
	public List<Subj_typeVO> subjTypeList() {
		return adminDao.subjTypeList();
	}

	@Override
	public List<AdminOpenSebjVO> selectOpenSubj(AdminSubjSearchVO vo) {
		return adminDao.selectOpenSubj(vo);
	}
	
	
	
}
