package com.zhiyou100.crowdfunding.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;



public abstract class AbstractMapperService<K, V> implements IMapperService<K, V>{	
	
	private Class<?> mapper ;
	public void setMapper(V vo) throws ClassNotFoundException {
		this.mapper = Class.forName("com.zhiyou100.crowdfunding." + vo.getClass().getSimpleName() + "Mapper");	}
	}
