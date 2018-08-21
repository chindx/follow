package com.zhiyou100.crowdfunding.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zhiyou100.crowdfunding.model.Projects;

public interface ProjectsMapper extends Mapper<Integer, Projects>{
	
	Long findCountByType(List<Integer> list) throws Exception;
	
	Long findCountByKeyword(Map<String, Object> map) throws Exception;
	
	List<Projects> findSplitByKeyword(Map<String, Object> map) throws Exception;
	
	List<Projects> findSplitByType(Map<String, Object> map) throws Exception;

}
