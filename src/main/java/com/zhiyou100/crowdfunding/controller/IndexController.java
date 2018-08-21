package com.zhiyou100.crowdfunding.controller;


import org.apache.log4j.LogManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(value="/pages/*")
public class IndexController {
	/** 后台首页 */
	@RequestMapping(value="back/index")
	public Object backIndex() {
		LogManager.getLogger(IndexController.class).info("==========back==========");
		return "back/admin/index";
	}
	
	@RequestMapping(value="front/index")
	public Object frontIndex() {
		LogManager.getLogger(IndexController.class).info("==========front==========");
		return "front/index";
	}

}
