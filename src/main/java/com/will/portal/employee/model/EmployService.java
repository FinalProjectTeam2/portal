package com.will.portal.employee.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.EmployeeSearchVO;
import com.will.portal.official_info.model.Official_infoVO;

public interface EmployService {

	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;

	int loginCheck(String officicalNo, String pwd);
	EmployeeVO selectByEmpNo(String empNo);
	int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort);
	boolean loginCheckSec(String loginPwd, String password, String officialNo);
	public Map<String, Object> selectViewByEmpNo(String empNo);
	List<Map<String, Object>> selectEmployeeView(EmployeeSearchVO empSearchVo);
	int getTotalRecord(EmployeeSearchVO empSearchVo);
	int updatePosition(EmployeeVO empVo);
	int deleteEmployee(String empNo);
	int multiUpdatePosition(List<EmployeeVO> list,String positionCode);
	int multiDelete(List<EmployeeVO> list);

	List<EmployeeVO> selectListByName(String name);

	public int updateAuthcode(EmployeeVO empvo);

}
