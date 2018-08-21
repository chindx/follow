package com.zhiyou100.crowdfunding.mapper;

import java.util.Map;

import com.zhiyou100.crowdfunding.model.Admin;

public interface AdminMapper extends Mapper<Integer, Admin>{
	
	public Admin login(Map<String, String> map) throws Exception;

}
