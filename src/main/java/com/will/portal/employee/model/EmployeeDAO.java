package com.will.portal.employee.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.EmployeeSearchVO;

public interface EmployeeDAO {
	int insertEmployee(EmployeeVO employeeVo);
	public String selectPwd(String empNo);
	public EmployeeVO selectByEmpNo(String empNo);
	public String selectSsn(String officialNo);
	Map<String, Object> selectViewByEmpNo(String empNo);
	List<Map<String, Object>> selectEmployeeView(EmployeeSearchVO empSearchVo);
	int getTotalRecord(EmployeeSearchVO empSearchVo);
	int updatePosition(EmployeeVO empVo);
	int deleteEmployee(String empNo);
	List<EmployeeVO> selectListByName(String name);

}