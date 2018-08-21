package com.zhiyou100.crowdfunding.service;

import java.util.Map;
import java.util.List;

import com.zhiyou100.crowdfunding.model.Projects;

public interface IProjectsService extends IMapperService<Integer, Projects>{
	
	int getMinimum() throws Exception;
	
	Map<String, Object> splitByType(int currentPage, int lineSize, List<Integer> types) throws Exception;
	
	Map<String, Object> splitByKeyword(int currentPage, int lineSize, String name, String userName, String pstId, List<Integer> types) throws Exception;

}
