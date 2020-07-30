package com.will.portal.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.will.portal.employee.model.EmployService;
import com.will.portal.professor.model.ProfessorService;
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
		MemberDetails user = null;
		
		switch (Integer.parseInt(num)) {
		case 1:
			user = employService.selectByEmpNo(username);
			break;
		case 2:
			user = professorService.selectByProfNo(username);
			break;
		case 3:
			user = studentService.selectByStuNo(username);
			break;
		default:
			throw new UsernameNotFoundException(username+"는 잘못된 형식의 아이디입니다.");
		}
		
		if(user == null) {
			throw new UsernameNotFoundException( username+"에 해당하는 아이디가 없습니다.");
		}
		return user;
	}

}
