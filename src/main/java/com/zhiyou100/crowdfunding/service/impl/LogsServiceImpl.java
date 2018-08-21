package com.zhiyou100.crowdfunding.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.crowdfunding.mapper.LogsMapper;
import com.zhiyou100.crowdfunding.model.Logs;
import com.zhiyou100.crowdfunding.service.ILogsService;
@Service(value="logsServiceImpl")
public class LogsServiceImpl implements ILogsService {
	@Autowired
	private LogsMapper mapper;

	@Override
	public boolean add(Logs vo) throws Exception {
		return this.mapper.doCreate(vo);
	}

	@Override
	public boolean edit(Logs vo) throws Exception {
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
	public Logs get(Integer id) throws Exception {
		return this.mapper.findById(id);
	}

	@Override
	public Map<String, Object> split(int currentPage, int lineSize) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		List<Logs> list = this.mapper.findAllSplit(temp);
		long count = this.mapper.findAllCount();
		map.put("allLogss", list);
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
		List<Logs> list = this.mapper.findSplitByColumn(temp);
		long count = this.mapper.findCountByColumn(temp);
		map.put("allLogss", list);
		map.put("count", count);
		return map;
	}

}
