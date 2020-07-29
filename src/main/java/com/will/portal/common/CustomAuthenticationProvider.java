package com.will.portal.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.will.portal.employee.model.EmployeeDetails;
import com.will.portal.professor.model.ProfessorDetails;
import com.will.portal.student.model.StudentDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberService userDetailsService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        String num = username.substring(4,5);
        EmployeeDetails user = null;
        switch (Integer.parseInt(num)) {
		case 1:
			EmployeeDetails user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			break;
		case 2:
			EmployeeDetails user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			break;
		case 3:
			EmployeeDetails user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			break;
		default:
			
		}
        CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(username);
        
        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}

}
