package com.zhiyou100.crowdfunding.service;

import java.util.List;

import com.zhiyou100.crowdfunding.model.Region;

public interface IRegionService {
	
	public List<Integer> listId(int parentId) throws Exception;
	
	public List<Region> listRegion(int parentId) throws Exception;

}
