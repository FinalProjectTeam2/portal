package com.will.portal.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeDetails;
import com.will.portal.professor.model.ProfessorDetails;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.student.model.StudentDetails;
import com.will.portal.student.model.StudentService;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberService userDetailsService;
	
	@Autowired
	private EmployService employeeService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ProfessorService professorService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        String num = username.substring(4,5);
        EmployeeDetails user = null;
        StudentDetails stuVo = null;
		ProfessorDetails proVo = null;
        switch (Integer.parseInt(num)) {
		case 1:
			user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, user.getPassword(),num,username)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
	        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
			
		case 2:
			proVo = (ProfessorDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, proVo.getPassword(),num,username)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!proVo.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
	        return new UsernamePasswordAuthenticationToken(username, password, proVo.getAuthorities());
		default:
			stuVo = (StudentDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, stuVo.getPassword(),num,username)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!stuVo.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
			return new UsernamePasswordAuthenticationToken(username, password, stuVo.getAuthorities());
		
		}
       
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String loginPwd, String password, String num,String username) {
		boolean result = false;
		if(num.equals("1")) {
			result= employeeService.loginCheckSec(loginPwd,password,username);
			
		}else if(num.equals("2")) {
			result= professorService.loginCheckSec(loginPwd,password,username);
			
		}else if(num.equals("3")) {
			result= studentService.loginCheck(loginPwd,password,username);
			
		}
		
		return result;
    }
}
