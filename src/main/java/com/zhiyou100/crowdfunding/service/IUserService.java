package com.zhiyou100.crowdfunding.service;

import com.zhiyou100.crowdfunding.model.User;

public interface IUserService extends IMapperService<Integer, User> {

	User login(String loginName, String password) throws Exception;
	
	int getMinimum() throws Exception;

	boolean activeUser(String code) throws Exception;

}
