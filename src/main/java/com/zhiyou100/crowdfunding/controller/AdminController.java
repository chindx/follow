package com.zhiyou100.crowdfunding.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.Admin;
import com.zhiyou100.crowdfunding.service.IAdminService;

@Controller
@RequestMapping(value="admin/*")
public class AdminController {
	
	private ModelAndView mav;
	@Autowired
	private IAdminService service;
	
//	@RequestMapping(value="login")
//	public ModelAndView login(String name, String password) throws Exception {
//		mav = new ModelAndView("/back/admin/login");				
//		Admin admin = service.login(name, password);		
//		if(admin != null) {
//			mav.setViewName("/back/admin/index");
//			mav.addObject("admin", admin);
//		}else {
//			mav.addObject("errorMessage", "账号或密码错误");
//		}
//		return mav;
//	}
	@RequestMapping(value="login")
	public Object login(HttpServletRequest request) throws Exception {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = null;
		if(name != null && password != null) {
			admin = service.login(name, password);			
			if(admin != null) {
				//服务器session跳转
				request.getSession().setAttribute("admin", admin);
//				request.setAttribute("admin", admin);
				return "/back/admin/index";
			}
			request.setAttribute("errorMessage", "账号或密码错误");
		}		
		return "/back/admin/login";
	}
	@RequestMapping
	public ModelAndView detail(String id) throws NumberFormatException, Exception {
		System.out.print(id);
		Admin admin = service.get(Integer.parseInt(id));
		mav = new ModelAndView("/back/admin/detail");
		mav.addObject("admin", admin);
		return mav;
	}
}
