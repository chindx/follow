package com.zhiyou100.crowdfunding.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.zhiyou100.crowdfunding.service.ICommentsService;

@Controller
@RequestMapping(value="comments/*")
public class CommentsController {
	
	private ModelAndView mav;
	@Autowired
	private ICommentsService service;
	
	@RequestMapping(value="comments")
	public ModelAndView comments(String id, String currentPage, String lineSize) throws Exception {
		int current = Integer.parseInt(currentPage != null ? currentPage : "1");
		int line = Integer.parseInt(lineSize != null ? lineSize : "20");
		String column = "cm_ps_id";
		String keyword = id;
		Map<String, Object> map = service.splitByKeyword(current, line, column, keyword);
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + line - 1) / line;
		mav= new ModelAndView("/back/projects/projects_comments");		
		mav.addObject("commentsMap", map);
		mav.addObject("currentPage", current);
		mav.addObject("lineSize", line);
		mav.addObject("keyword",keyword);
		mav.addObject("allPages", allPages);
		mav.addObject("forward","<%=url>comments/comments.action");
		return mav;
	}
	
	@RequestMapping(value="allcomments")
	public ModelAndView allComments(String currentPage, String lineSize) throws Exception {
		int current = Integer.parseInt(currentPage != null ? currentPage : "1");
		int line = Integer.parseInt(lineSize != null ? lineSize : "20");		
		Map<String, Object> map = service.split(current, line);	
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + line - 1) / line;
		mav= new ModelAndView("/back/projects/projects_allcomments");			
		mav.addObject("commentsMap", map);
		mav.addObject("currentPage", current);
		mav.addObject("lineSize", line);
		mav.addObject("allPages", allPages);
		mav.addObject("forward","<%=url>comments/allcomments.action");
		return mav;
	}

}
