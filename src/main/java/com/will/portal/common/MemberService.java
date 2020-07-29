package com.will.portal.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeDetails;
import com.will.portal.professor.model.ProfessorDetails;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.student.model.StudentDetails;
import com.will.portal.student.model.StudentService;


public class MemberService implements UserDetailsService {
	@Autowired
	private StudentService studentService;
	@Autowired
	private EmployService employService;
	@Autowired
	private ProfessorService professorService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String num = username.substring(4,5);
		EmployeeDetails empVo = null;
		StudentDetails stuVo = null;
		ProfessorDetails proVo = null;
		
		switch (Integer.parseInt(num)) {
		case 1:
			empVo = (EmployeeDetails) employService.selectByEmpNo(username);
			if(empVo == null) {
				throw new UsernameNotFoundException("No user found with username[" + username+"]");
			}
			return empVo;
		case 2:
			proVo = (ProfessorDetails) professorService.selectByProfNo(username);
			if(proVo == null) {
				throw new UsernameNotFoundException("No user found with username[" + username+"]");
			}
			return proVo;
		case 3:
			stuVo = (StudentDetails) studentService.selectByStuNo(username);
			if(stuVo == null) {
				throw new UsernameNotFoundException("No user found with username[" + username+"]");
			}
			return stuVo;

		default:
			throw new UsernameNotFoundException("Wrong user found with username[" + username+"]");
		}
		
	}

}
