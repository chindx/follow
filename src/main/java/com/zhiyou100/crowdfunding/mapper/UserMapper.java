package com.zhiyou100.crowdfunding.mapper;

import java.util.Map;

import com.zhiyou100.crowdfunding.model.User;

public interface UserMapper extends Mapper<Integer, User>{
	
	boolean activeEMail(String code) throws Exception;
	
	User findByKeyword(Map<String, Object> map) throws Exception;

}
