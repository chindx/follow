package com.zhiyou100.crowdfunding.utils.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.User;
import com.zhiyou100.crowdfunding.utils.IDCardUtil;

public class ProjectsPublishInterceptor implements HandlerInterceptor{
	private Logger log = LogManager.getLogger(ProjectsPublishInterceptor.class.getName());
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		log.info("==============================================================");
		String url = request.getRequestURI();
		log.info("=====================" + url + "==============================");
		String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
							+ request.getContextPath() + "/";
		log.info("=====================" + localUrl + "=========================");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//设置头部当前页
		request.setAttribute("head_status", "publish");
		boolean flag = false;
		if(user != null) {//session中存在用户
			flag = IDCardUtil.isIDCard(user.getIdcard());
			if(flag) {//用户通过身份认证
				String head_publish = request.getParameter("head_publish");
				log.info("========登录成功并且通过身份认证========" + head_publish);
			}else {
				log.info("========未通过身份认证================");
				request.getRequestDispatcher("/WEB-INF/pages/front/user/auth_name.jsp").forward(request, response);
			}			
		}else {
			log.info("============用户未登录===================");
			request.getRequestDispatcher("/WEB-INF/pages/front/user/login.jsp").forward(request, response);
		}
		log.info("====================END====================");
		return flag;
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
