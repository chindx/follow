package com.zhiyou100.crowdfunding.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.crowdfunding.mapper.ProjectsTypeMapper;
import com.zhiyou100.crowdfunding.model.ProjectsType;
import com.zhiyou100.crowdfunding.service.IProjectsTypeService;

@Service(value = "projectsTypeServiceImpl")
public class ProjectsTypeServiceImpl implements IProjectsTypeService {
	@Autowired
	private ProjectsTypeMapper mapper;

	public ProjectsTypeServiceImpl() {
		super();
	}

	@Override
	public boolean add(ProjectsType vo) throws Exception {

		return this.mapper.doCreate(vo);
	}

	@Override
	public boolean edit(ProjectsType vo) throws Exception {
		return this.mapper.doUpdate(vo);
	}

	@Override
	public boolean remove(Integer id) throws Exception {
		return this.mapper.doRemove(id);
	}

	@Override
	public boolean removeBatch(Set<Integer> ids) throws Exception {
		return this.mapper.doRemoveBatch(ids);
	}

	@Override
	public ProjectsType get(Integer id) throws Exception {
		return this.mapper.findById(id);
	}

	@Override
	public Map<String, Object> split(int currentPage, int lineSize) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		List<ProjectsType> list = this.mapper.findAllSplit(temp);
		long count = this.mapper.findAllCount();
		map.put("allProjectsTypes", list);
		map.put("count", count);
		return map;
	}

	@Override
	public Map<String, Object> splitByKeyword(int currentPage, int lineSize, String column, String keyword)
			throws Exception {
		if("".equals(column) || "".equals(keyword) || column == null || keyword == null) {
			return split(currentPage, lineSize);
		}
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		temp.put("column", column);
		temp.put("keyword", keyword);
		List<ProjectsType> list = this.mapper.findSplitByColumn(temp);
		long count = this.mapper.findCountByColumn(temp);
		map.put("allProjectsTypes", list);
		map.put("count", count);
		return map;
	}
	@Override
	public List<ProjectsType> findTypes() throws Exception {		
		return this.mapper.findAll();
	}
}
