package com.will.portal.common;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

public class CsrfSecurityRequestMatcher implements RequestMatcher{

	private Pattern allowRequestMethod = Pattern.compile("^(GET|POST|DELETE|UPDATE|PATCH)$");
    private RegexRequestMatcher unprotectedMatcher  = new RegexRequestMatcher("/accessdenied", null);
    
	
	@Override
	public boolean matches(HttpServletRequest request) {
		if(allowRequestMethod.matcher(request.getMethod()).matches()) {
            return false;
        }
        return !unprotectedMatcher.matches(request);
	}

}
