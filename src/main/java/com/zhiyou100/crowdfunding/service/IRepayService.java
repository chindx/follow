package com.zhiyou100.crowdfunding.service;

import com.zhiyou100.crowdfunding.model.Repay;

public interface IRepayService extends IMapperService<Integer, Repay> {
	
	public int getMinimum() throws Exception;

}
