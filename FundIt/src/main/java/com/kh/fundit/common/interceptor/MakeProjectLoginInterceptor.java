package com.kh.fundit.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.fundit.member.model.vo.Member;

public class MakeProjectLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
				
		if(session.getAttribute("memberLoggedIn") == null) {
			
			request.setAttribute("msg", "로그인 후 사용가능합니다");
			request.setAttribute("loc", "/login");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
