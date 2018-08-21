package com.zhiyou100.crowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.User;
import com.zhiyou100.crowdfunding.service.IUserService;
import com.zhiyou100.crowdfunding.utils.CodeUtil;
import com.zhiyou100.crowdfunding.utils.IDCardUtil;
import com.zhiyou100.crowdfunding.utils.MailUtil;
@Controller
@RequestMapping(value="/user/*")
public class UserController extends AbstractController{
	@Autowired
	private IUserService service;
	private ModelAndView mav;	
	@RequestMapping(value="login")
	public Object login(HttpServletRequest request) throws Exception {			
		String password = request.getParameter("password");
		String loginName = request.getParameter("loginName");		
		User user = null;
		if(loginName != null && password != null) {			
			user = service.login(loginName, password);
			if(user != null) {
				request.getSession().setAttribute("user", user);
				request.getSession().setMaxInactiveInterval(7200);
				return "front/index";			
			}
			request.setAttribute("errorMsg", "用户或密码错误");
		}		
		return "front/login";			
	}
	@RequestMapping(value="logout")
	public Object loginOut(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//销毁user
		request.getSession().removeAttribute("user");
		//注销session
		request.getSession().invalidate();		
		return "front/login";
	}
	@RequestMapping(value="reg")
	public ModelAndView reg() throws Exception {		
		mav = new ModelAndView("front/user/reg");		
		return mav;
	}
	@RequestMapping(value="center/info")
	public Object userCenter(HttpServletRequest request) {
		return "front/user/user_info";
	}
	@RequestMapping(value="center/authName")
	public Object authName(HttpServletRequest request) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		String realName = request.getParameter("realName");
		String idcard = request.getParameter("idcard") != null ? request.getParameter("idcard") : "0";		
		String phone = request.getParameter("phone");
		if(IDCardUtil.isIDCard(idcard)) {
			user.setIdcard(idcard);
			user.setRealName(realName);
			user.setPhone(phone);			
			service.edit(user);
			return "front/user/user_info";
		}
		return "front/user/auth_name";
	}
	@RequestMapping(value="registerCode")
	public @ResponseBody Map<String, Object> registerCode(HttpServletRequest request){		
		Map<String, Object> map = new HashMap<>();
		String validateCode = CodeUtil.getRandomCode(6);				
		map.put("validateCode", validateCode);
		request.getSession().setAttribute("code", validateCode);		
		return map;
	}
	@RequestMapping(value="checkRegiestCode")
	public @ResponseBody Map<String, Object> checkRegiestCode(String code, HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		String generateCode = (String) request.getSession().getAttribute("code");		
		if(!code.equalsIgnoreCase(generateCode)) {
			map.put("msg", "验证码输入错误,请重新输入!");
			map.put("isSame", false);		
			request.getSession().removeAttribute("code");
		}else {
			map.put("msg", "验证通过");
			map.put("isSame", true);
			map.put("validateCode", generateCode);
		}
		return map;
	}
	@RequestMapping(value="register")
	public @ResponseBody Map<String, Object> register(HttpServletRequest request){
		System.out.println("this is controller register");
		Map<String, Object> map = new HashMap<>();
		try {
			String regName = request.getParameter("regName");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			if(regName != null && name != null && password != null) {
				User vo = new User();
				vo.setId(service.getMinimum());
				vo.setName(name);
				vo.setPassword(password);
				String activeCode = CodeUtil.getRandomCode(8);
				vo.setRole(0);
				vo.setCode(activeCode);
				if(regName.contains("@")) {//邮箱注册					
					vo.setEmail(regName);
					if(service.add(vo)) {
						new Thread(new MailUtil(vo, vo.getEmail())).start();
						map.put("msg", "注册成功,请进入邮箱激活!");
					}else {
						map.put("msg", "注册失败,请重新注册!");
					}
				}else {//电话注册
					vo.setPhone(regName);
				}
			}			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="manuActive")
	public String manuActive(String code) throws Exception {
		Map<String, Object> map = new HashMap<>();
		boolean flag = service.activeUser(code);
		if(flag) {			
			map.put("msg", "激活成功");
		}else {
			map.put("msg", "激活失败!");
		}
		return "forward:/user/login.action";
	}	
}
