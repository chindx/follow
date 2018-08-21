package com.zhiyou100.crowdfunding.mapper;

import java.util.List;

import com.zhiyou100.crowdfunding.model.Region;

public interface RegionMapper {
	
	public List<Region> findRegionByParent(int parentId) throws Exception;
	
	public List<Integer> findIdByParent(int parentId) throws Exception;

}
