package com.zhiyou100.crowdfunding.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.crowdfunding.mapper.RegionMapper;
import com.zhiyou100.crowdfunding.model.Region;
import com.zhiyou100.crowdfunding.service.IRegionService;
@Service(value="regionServiceImpl")
public class RegionServiceImpl implements IRegionService{
	@Autowired
	private RegionMapper mapper;
	@Override
	public List<Integer> listId(int parentId) throws Exception {
		List<Integer> list = new ArrayList<>();
		list = mapper.findIdByParent(parentId);
		Collections.sort(list);
		return list;
	}

	@Override
	public List<Region> listRegion(int parentId) throws Exception {
		List<Region> list = new ArrayList<>();
		list = mapper.findRegionByParent(parentId);		
		return list;
	}

}
