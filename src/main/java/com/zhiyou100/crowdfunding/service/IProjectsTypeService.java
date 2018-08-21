package com.zhiyou100.crowdfunding.service;

import java.util.List;

import com.zhiyou100.crowdfunding.model.ProjectsType;

public interface IProjectsTypeService extends IMapperService<Integer, ProjectsType>{
	
	public List<ProjectsType> findTypes() throws Exception;

}
