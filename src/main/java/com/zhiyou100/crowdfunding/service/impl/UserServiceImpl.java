package com.zhiyou100.crowdfunding.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.crowdfunding.mapper.UserMapper;
import com.zhiyou100.crowdfunding.model.User;
import com.zhiyou100.crowdfunding.service.IUserService;

@Service(value = "userServiceImpl")
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper mapper;

	public UserServiceImpl() {
		super();
	}

	@Override
	public boolean add(User vo) throws Exception {

		return this.mapper.doCreate(vo);
	}

	@Override
	public boolean edit(User vo) throws Exception {
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
	public User get(Integer id) throws Exception {
		return this.mapper.findById(id);
	}

	@Override
	public Map<String, Object> split(int currentPage, int lineSize) throws Exception {
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(lineSize < 0) {
			lineSize = 0;
		}
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		List<User> list = this.mapper.findAllSplit(temp);
		long count = this.mapper.findAllCount();
		map.put("allUsers", list);
		map.put("count", count);
		return map;
	}

	@Override
	public Map<String, Object> splitByKeyword(int currentPage, int lineSize, String column, String keyword)
			throws Exception {
		if("".equals(column) || "".equals(keyword) || column == null || keyword == null) {
			return split(currentPage, lineSize);
		}
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(lineSize < 0) {
			lineSize = 0;
		}
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		temp.put("start", (currentPage - 1) * lineSize);
		temp.put("lineSize", lineSize);
		temp.put("column", column);
		temp.put("keyword", keyword);
		List<User> list = this.mapper.findSplitByColumn(temp);
		long count = this.mapper.findCountByColumn(temp);
		map.put("allUsers", list);
		map.put("count", count);
		return map;
	}

	@Override
	public User login(String loginName, String password) {
		User user = null;
		try {
			Map<String, Object> map = new HashMap<>();
			if (loginName.contains("@")) {								
				map.put("column", "us_email");								
			} else {								
				map.put("column", "us_phone");						
			}
			map.put("password", password);
			map.put("keyword", loginName);
			user = mapper.findByKeyword(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
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
	
	public boolean activeUser(String code) throws Exception {
		return this.mapper.activeEMail(code);
	}
}

