package com.will.portal.admin.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.AdminSubjSearchVO;
import com.will.portal.subj_type.model.Subj_typeVO;

public interface AdminDAO {
	List<Subj_typeVO> subjTypeList();
	List<AdminOpenSebjVO> selectOpenSubj(AdminSubjSearchVO vo);
}
