package com.sgworld.infra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sgworld.infra.common.constants.Constants;


public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("infrMmSeq") == null) {
			response.sendRedirect(Constants.URL_LOGINFORM);
			return false;
		} else {
			
		}
		return super.preHandle(request, response, handler);
	}
}
