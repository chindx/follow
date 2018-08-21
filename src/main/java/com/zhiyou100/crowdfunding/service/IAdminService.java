package com.zhiyou100.crowdfunding.service;

import com.zhiyou100.crowdfunding.model.Admin;

public interface IAdminService extends IMapperService<Integer, Admin> {

	public Admin login(String name, String password) throws Exception;

}
