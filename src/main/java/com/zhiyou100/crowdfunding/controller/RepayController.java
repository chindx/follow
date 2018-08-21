package com.zhiyou100.crowdfunding.controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou100.crowdfunding.model.Repay;
import com.zhiyou100.crowdfunding.service.IRepayService;

@Controller
@RequestMapping(value="repay/*")
public class RepayController {
	@Autowired
	private IRepayService service;
	@RequestMapping(value="saveDraft")
	public Object saveDraft(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Repay vo = null;
		if(request.getSession().getAttribute("projects")!=null) {
			vo = new Repay();
			vo.setId(service.getMinimum());
			vo.setPayMoney(Double.parseDouble((request.getParameter("repayMoney") != null ? request.getParameter("repayMoney") : "0")));
			vo.setPsId(Integer.parseInt(request.getParameter("psId")));			
			vo.setUserId(Integer.parseInt(request.getParameter("userId")));			
			vo.setType(Integer.parseInt(request.getParameter("type")));
			vo.setRule(request.getParameter("每"+ "rule" + "支持者抽取一名中奖者"));
			vo.setContent(request.getParameter("content"));
			vo.setNumber(Integer.parseInt(request.getParameter("number")));
			vo.setTime(Integer.parseInt(request.getParameter("time")));			
		}
		PrintWriter out = response.getWriter();
		if(vo != null && service.add(vo)) {						
			out.println("保存草稿成功" + vo);				
		}else {
			out.println("保存草稿失败" + "需要先创建项目信息");
		}
		out.flush();
		out.close();		
		return null;
	}
}
