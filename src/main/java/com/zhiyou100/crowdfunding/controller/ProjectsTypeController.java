package com.zhiyou100.crowdfunding.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.ProjectsType;
import com.zhiyou100.crowdfunding.model.Region;
import com.zhiyou100.crowdfunding.service.IProjectsTypeService;
import com.zhiyou100.crowdfunding.utils.DateUtils;

@Controller
@RequestMapping(value="projectsType/*")
public class ProjectsTypeController {
	@Autowired
	private IProjectsTypeService service;
	
	private ModelAndView mav;
	@RequestMapping(value="list")
	public ModelAndView list(String currentPage, String lineSize) throws Exception {
		mav = new ModelAndView("/back/classify/projectstype_list");
		int current = Integer.parseInt(currentPage != null ? currentPage : "1");
		int line = Integer.parseInt(lineSize != null ? lineSize : "10");
		Map<String, Object> map = service.split(current, line);
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + line - 1) / line;		
		mav.addObject("projectsTypeMap", map);
		mav.addObject("allPages", allPages);
		mav.addObject("currentPage", current);
		mav.addObject("forward", "<%=url%>projectsType/list.action");
		return mav;
	}
	@RequestMapping(value="add")
	public ModelAndView add(HttpServletRequest request) throws Exception {
		ProjectsType pst = new ProjectsType();
		pst.setName(request.getParameter("name"));
		pst.setDesc(request.getParameter("desc"));
		pst.setStartDate(new Date());
		pst.setType(0);
		if(service.add(pst)) {
			return mav = new ModelAndView("/projectsType/list.action");			
		}
		mav = new ModelAndView("/back/classify/projectstype_add");
		return mav;
	}
	@RequestMapping(value="remove")
	public ModelAndView remove(String id) throws NumberFormatException, Exception {
		service.remove(Integer.parseInt(id));
		return list(null, null);
	}
	@RequestMapping(value="preEdit")
	public ModelAndView preEdit(String id) throws NumberFormatException, Exception {
		ProjectsType pst = service.get(Integer.parseInt(id));
		mav = new ModelAndView("/back/classify/projectstype_edit");
		mav.addObject("projectsType", pst);
		return mav;
	}
	@RequestMapping(value="edit")
	public ModelAndView edit(HttpServletRequest request) throws Exception {
		ProjectsType pst = new ProjectsType();
		pst.setName(request.getParameter("name"));
		pst.setDesc(request.getParameter("desc"));
		pst.setId(Integer.parseInt(request.getParameter("id")));
		pst.setType(Integer.parseInt(request.getParameter("type")));
		pst.setStartDate(DateUtils.stringToTime(request.getParameter("startDate")));		
		if(service.edit(pst)) {
			return mav = new ModelAndView("/projectsType/list.action");			
		}
		return preEdit(request.getParameter("id"));
	}
	@RequestMapping(value="detail")
	public ModelAndView detail(String id) throws NumberFormatException, Exception {
		ProjectsType pst = service.get(Integer.parseInt(id));
		mav = new ModelAndView("/back/classify/projectstype_detail");
		mav.addObject("projectsType", pst);
		return mav;
	}	
	@RequestMapping("findTypes")
	public @ResponseBody Map<String, Object> findTypes(){
		Map<String,Object> map = new HashMap<>();
		try {
			map.put("allpsTypes", service.findTypes());
			System.out.println(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
