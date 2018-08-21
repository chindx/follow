package com.zhiyou100.crowdfunding.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.crowdfunding.model.Projects;
import com.zhiyou100.crowdfunding.model.User;
import com.zhiyou100.crowdfunding.service.IFundingService;
import com.zhiyou100.crowdfunding.service.IProjectsService;
import com.zhiyou100.crowdfunding.utils.DateUtils;
import com.zhiyou100.crowdfunding.utils.IDCardUtil;

@Controller
@RequestMapping(value="projects/*")
public class ProjectsController extends AbstractAction{
	private ModelAndView mav;
	@Autowired
	private IProjectsService service;	
	@Autowired
	private IFundingService fdService;
	@RequestMapping(value="list")
	public Object list(HttpServletRequest request, String name, String userName, String pstId, String type) throws Exception{
		String current = request.getParameter("currentPage") != null ? request.getParameter("currentPage") : "1";
		String line = request.getParameter("lineSize") != null ? request.getParameter("lineSize") : "5";
		System.out.println("1" + name + "2" + userName + "3" + pstId + "4" + type);
		Map<String, Object> map = new HashMap<>();
		List<Integer> list = new ArrayList<>();
		list.add(0);
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		int currentPage = Integer.parseInt("".equals(current) ? current : "1");
		int lineSize = Integer.parseInt("".equals(line) ? line : "5");
		if(name != null && userName != null && pstId != null && type != null && (!"".equals(name) || !"".equals(userName) || !"".equals(type) || !"".equals(type))) {
			name.trim();
			userName.trim();
			pstId.trim();
			type.trim();
			if(!"".equals(type)) {
				list.clear();
				list.add(Integer.parseInt(type));
			}
			if("".equals(pstId)) {
				pstId = "%%";
			}
			System.out.println(currentPage + lineSize + name + userName + pstId + list.toString());
			map = service.splitByKeyword(currentPage, lineSize, name, userName, pstId, list);
		}else {
			map = service.splitByType(currentPage, lineSize, list);	
		}
		System.out.println(map);					
		mav= new ModelAndView("back/projects/projects_list");
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + lineSize - 1)/ lineSize;
		mav.addObject("projectsMap", map);
		mav.addObject("currentPage", currentPage);
		mav.addObject("lineSize", lineSize);
		mav.addObject("allPages", allPages);
		mav.addObject("forward","<%=url>projects/list.action");
		return mav;
	}
	
	@RequestMapping(value="detail")
	public ModelAndView detail(String id) throws NumberFormatException, Exception {
		Projects projects = service.get(Integer.parseInt(id));
		mav = new ModelAndView("back/projects/projects_detail");
		mav.addObject("projects", projects);
		return mav;
	}
	@RequestMapping(value="info")//信息
	public ModelAndView info(String id) throws NumberFormatException, Exception {
		Projects projects = service.get(Integer.parseInt(id));
		mav = new ModelAndView("back/projects/projects_info");
		mav.addObject("projects", projects);
		return mav;
	}
	@RequestMapping(value="progress")
	public ModelAndView progress(String id, String currentPage, String lineSize) throws NumberFormatException, Exception {
		int current = Integer.parseInt(currentPage != null ? currentPage : "1");
		int line = Integer.parseInt(lineSize != null ? lineSize : "20");
		String column = "fd_ps_id";
		String keyword = id;
		Map<String, Object> map = fdService.splitByKeyword(current, line, column, keyword);
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + line -1) / line;
		mav= new ModelAndView("back/projects/projects_progress");			
		mav.addObject("fundingMap", map);
		mav.addObject("currentPage", current);
		mav.addObject("lineSize", line);
		mav.addObject("keyword",keyword);
		mav.addObject("allPages", allPages);
		mav.addObject("forward","<%=url>projects/progress.action");
		return mav;
	}
	@RequestMapping(value="follow")
	public ModelAndView follow(String id) {
		return mav;
	}	
	@RequestMapping(value="audit")//项目审核
	public ModelAndView audit(String currentPage, String lineSize) throws Exception {
		String column = "ps_type";
		String keyword = "0";
		int current = Integer.parseInt(currentPage != null ? currentPage : "1");
		int line = Integer.parseInt(lineSize != null ? lineSize : "5");	
		mav = new ModelAndView("/back/projects/projects_audit");
		Map<String, Object> map = service.splitByKeyword(current, line, column, keyword);
		int count = Integer.parseInt(map.get("count").toString());
		int allPages = (count + line -1) / line;
		mav.addObject("currentPage", current);
		mav.addObject("lineSize", line);
		mav.addObject("projectsMap", map);
		mav.addObject("allPages", allPages);
		mav.addObject("forward","projects/audit.action");
		return mav;
	}
	@RequestMapping(value="recommend")
	public ModelAndView recommend() {
		mav = new ModelAndView("back/projects/projects_recommend");
		return mav;
	}
	@RequestMapping(value="remove")
	public Object remove(String id) throws NumberFormatException, Exception {
		service.remove(Integer.parseInt(id));		
		return "projects/list.action";		
	}
	@RequestMapping(value="preEdit")
	public ModelAndView preEdit(String id) throws NumberFormatException, Exception {
		Projects projects = service.get(Integer.parseInt(id));
		mav = new ModelAndView("back/projects/projects_edit");
		mav.addObject("projects", projects);
		return mav;
	}
	@RequestMapping(value="edit")
	public Object edit(HttpServletRequest request) throws NumberFormatException, Exception {
		Projects vo = new Projects();
		vo.setId(Integer.parseInt(request.getParameter("id")));
		vo.setPstId(Integer.parseInt(request.getParameter("pstId")));
		vo.setUserId(Integer.parseInt(request.getParameter("userId")));
		vo.setAuditor(Integer.parseInt(request.getParameter("auditor")));
		vo.setCustName(request.getParameter("custName"));
		vo.setCustPhone(request.getParameter("custPhone"));
		vo.setCustAddress(request.getParameter("custAddress"));
		vo.setFile(request.getParameter("file"));
		vo.setName(request.getParameter("name"));
		vo.setGoal(request.getParameter("goal"));
		vo.setAddress(request.getParameter("address"));
		vo.setMoney(Double.parseDouble(request.getParameter("money")));
		vo.setDays(Integer.parseInt(request.getParameter("days")));
		vo.setVideo(request.getParameter("video"));
		vo.setStory(request.getParameter("story"));
		vo.setSupport(request.getParameter("support"));
		vo.setRepay(request.getParameter("repay"));
		vo.setAboutMe(request.getParameter("aboutMe"));
		vo.setType(Integer.parseInt(request.getParameter("type")));
		vo.setStartTime(DateUtils.stringToTime(request.getParameter("startTime")));
		vo.setEndTime(DateUtils.stringToTime(request.getParameter("endTime")));
		vo.setSupporter(Integer.parseInt(request.getParameter("supporter")));
		vo.setRaisedMoney(Double.parseDouble(request.getParameter("raisedMoney")));
		if(service.edit(vo)) {
			return "projects/list.action";
		}
		return preEdit("" + vo.getId());
	}
	@RequestMapping(value="publish")
	public Object publish(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			String idcard = user.getIdcard();
			if(IDCardUtil.isIDCard(idcard)) {
				return "front/projects/product_basic";
			}			
			return "front/user/center/auth_name";
		}
		return "front/login";		
	}
	
	@RequestMapping(value="publish/product_basic")
	public Object productBasic() {
		return "front/projects/product_basic";
	}
	@RequestMapping(value="publish/product_info")
	public Object productInfo() {
		return "front/projects/product_info";
	}
	@RequestMapping(value="publish/product_detail")
	public Object productDetail() {
		return "front/projects/product_detail";
	}
	@RequestMapping(value="publish/product_repay")
	public Object productRepay() {
		return "front/projects/product_repay";
	}
	@RequestMapping(value="saveDraft")
	public @ResponseBody Map<String, Object> saveDraft(HttpServletRequest request, MultipartFile file) throws Exception {
		
		Projects vo = null;
		if(request.getSession().getAttribute("projects")!=null) {
			vo = service.get(Integer.parseInt(request.getParameter("psId")));
		}else {
			int min = service.getMinimum();
			vo = new Projects();
			vo.setId(min);
		}
		vo.setAuditor(1);
		if(request.getParameter("userId")!=null) {
			vo.setUserId(Integer.parseInt(request.getParameter("userId")));
		}
		if(request.getParameter("custName")!=null) {
			vo.setCustName(request.getParameter("custName"));
		}
		if(request.getParameter("custPhone")!=null) {
			vo.setCustPhone(request.getParameter("custPhone"));
		}
		if(request.getParameter("custAddress")!=null) {
			String address = request.getParameter("custAddress");
			vo.setCustAddress(address.substring(address.lastIndexOf("#") + 1));
		}		
		if(request.getParameter("psType") != null && "psType".equals(request.getParameter("pstId"))) {
			vo.setPstId(Integer.parseInt(request.getParameter("pstId")));
		}else {
			if(vo.getPstId() == 0) {
				vo.setPstId(1);
			}
		}		
		if(request.getParameter("video")!=null) {
			vo.setVideo(request.getParameter("video"));
		}
		if(request.getParameter("story")!=null) {
			vo.setStory(request.getParameter("story"));
		}
		if(request.getParameter("support")!=null) {
			vo.setSupport(request.getParameter("support"));
		}
		if(request.getParameter("repay")!=null) {
			vo.setRepay(request.getParameter("repay"));
		}
		if(request.getParameter("aboutMe")!=null) {
			vo.setAboutMe(request.getParameter("aboutMe"));
		}
		if(request.getParameter("goal")!=null) {
			vo.setGoal(request.getParameter("goal"));
		}		
		if(request.getParameter("name")!=null) {
			vo.setName(request.getParameter("name"));
		}
		if(request.getParameter("address")!=null) {
			String address = request.getParameter("address");
			vo.setCustAddress(address.substring(address.lastIndexOf("#") + 1));
		}	
		if(request.getParameter("money")!=null) {
			vo.setMoney(Double.parseDouble(request.getParameter("money")));
		}
		if(request.getParameter("days")!=null) {
			vo.setDays(Integer.parseInt(request.getParameter("days")));
		}
		if(file != null) {			
			String fileName = super.createFileName(file);
			if(super.saveFile(file, fileName, request)) {
				vo.setFile(fileName);
			}
		}
		System.out.println(vo);
		boolean flag = false;
		if(service.get(vo.getId()) == null) {
			flag = service.add(vo);
		}else {
			flag = service.edit(vo);
		}
		Map<String, Object> map = new HashMap<>();
		if(flag) {
			request.getSession().setAttribute("projects", vo);			
			map.put("projects", vo.toString());
		}		
		return map;
	}	
	@Override
	public String getFileUploadDir() {
		
		return "/upload/projects";
	}	
}
