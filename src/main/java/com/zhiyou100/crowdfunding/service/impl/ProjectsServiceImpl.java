package com.zhiyou100.crowdfunding.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import com.zhiyou100.crowdfunding.mapper.ProjectsMapper;
import com.zhiyou100.crowdfunding.model.Projects;
import com.zhiyou100.crowdfunding.service.IProjectsService;

@Service(value = "projectsServiceImpl")
public class ProjectsServiceImpl implements IProjectsService {
	@Autowired
	private ProjectsMapper mapper;

	public ProjectsServiceImpl() {
		super();
	}

	@Override
	public boolean add(Projects vo) throws Exception {

		return this.mapper.doCreate(vo);
	}

	@Override
	public boolean edit(Projects vo) throws Exception {
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
	public Projects get(Integer id) throws Exception {
		return this.mapper.findById(id);
	}
	
	@Override//取得最小id
	public int getMinimum() throws Exception {
		List<Integer> list = new ArrayList<>();
		list = this.mapper.findAllId();
		Collections.sort(list);//排序
		int min = 0;		
		for(int i : list) {
			if(i - min > 1) {//id之间有空位
				break;
			}
			min = i;
		}
		return min + 1;
	}

	@Override
	public Map<String, Object> split(int currentPage, int lineSize) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		List<Projects> list = this.mapper.findAllSplit(temp);
		long count = this.mapper.findAllCount();
		map.put("allProjects", list);
		map.put("count", count);
		return map;
	}

	@Override//查询特定状态的
	public Map<String, Object> splitByType(int currentPage, int lineSize, List<Integer> types)
			throws Exception {		
		Map<String, Object> map = new HashMap<>();		
		map.put("start", (currentPage - 1) * lineSize);
		map.put("lineSize", lineSize);
		map.put("list", types);		
		List<Projects> list = this.mapper.findSplitByType(map);
		long count = this.mapper.findCountByType(types);
		map.clear();
		map.put("allProjects", list);
		map.put("count", count);		
		return map;
	}

	@Override//条件查询
	public Map<String, Object> splitByKeyword(int currentPage, int lineSize, String name, String userName, String pstId, List<Integer> types) throws Exception {
		Map<String, Object> map = new HashMap<>();		
		map.put("name", "%" + name + "%");
		map.put("userName",  "%" + userName + "%");
		map.put("pstId",  pstId);
		map.put("list",  types);		
		long count = this.mapper.findCountByKeyword(map);
		map.put("start", (currentPage - 1) * lineSize);
		map.put("lineSize", lineSize);
		System.out.println(map);
		List<Projects> list = this.mapper.findSplitByKeyword(map);
		map.clear();
		map.put("allProjects", list);
		map.put("count", count);		
		return map;
	}

	@Override
	public Map<String, Object> splitByKeyword(int currentPage, int lineSize, String column, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
