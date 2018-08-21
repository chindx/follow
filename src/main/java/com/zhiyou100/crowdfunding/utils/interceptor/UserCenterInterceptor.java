package com.zhiyou100.crowdfunding.utils.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.User;
import com.zhiyou100.crowdfunding.utils.IDCardUtil;

public class UserCenterInterceptor implements HandlerInterceptor{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
//		String url = request.getRequestURI();
//		String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
//							+ request.getContextPath() + "/";
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			request.getRequestDispatcher("/WEB-INF/pages/front/login.jsp").forward(request, response);
			return false;
		}
		if(!IDCardUtil.isIDCard(user.getIdcard())) {
			request.getRequestDispatcher("/WEB-INF/pages/front/user/auth_name.jsp").forward(request, response);
			return false;
		}
		return true;
	} 
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
