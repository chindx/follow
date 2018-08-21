package com.zhiyou100.crowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.crowdfunding.model.Region;
import com.zhiyou100.crowdfunding.service.IRegionService;

@Controller
@RequestMapping(value="region/*")
public class RegionController {
	@Autowired
	private IRegionService service;
	@RequestMapping(value="address")
	public Object address(HttpServletRequest request) throws Exception {
		
		return "address";
	}
	
	@RequestMapping("province")
	public @ResponseBody Map<String, Object> getProvice(){			
		Map<String, Object> map = new HashMap<>();
		try {
		List<Region> list= service.listRegion(1);
		map.put("provinces", list);		    
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return map;		
	}
	@RequestMapping("city")
	public @ResponseBody Map<String, Object> getCity(@RequestParam(defaultValue="0") Integer id){
		Map<String, Object> map = new HashMap<>();
		try {
			List<Region> list = service.listRegion(id);
			map.put("cities", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping("area")
	public @ResponseBody Map<String, Object> getArea(@RequestParam(defaultValue="0") Integer id){
		Map<String, Object> map = new HashMap<>();
		try {
			List<Region> list = service.listRegion(id);
			map.put("areas", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
