package com.will.portal.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;


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
		EmployeeVO empVo = null;
		StudentVO stuVo = null;
		ProfessorVO proVo = null;
		
		switch (Integer.parseInt(num)) {
		case 1:
			empVo = employService.selectByEmpNo(username);
			if(empVo == null) {
				throw new UsernameNotFoundException( username+"에 해당하는 아이디가 없습니다.");
			}
			return empVo;
		case 2:
			proVo = professorService.selectByProfNo(username);
			if(proVo == null) {
				throw new UsernameNotFoundException(username+"에 해당하는 아이디가 없습니다.");
			}
			return proVo;
		case 3:
			stuVo = studentService.selectByStuNo(username);
			if(stuVo == null) {
				throw new UsernameNotFoundException(username+"에 해당하는 아이디가 없습니다.");
			}
			return stuVo;

		default:
			throw new UsernameNotFoundException(username+"는 잘못된 형식의 아이디입니다.");
		}
		
	}

}
