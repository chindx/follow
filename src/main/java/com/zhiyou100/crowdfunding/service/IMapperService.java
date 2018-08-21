package com.zhiyou100.crowdfunding.service;

import java.util.Map;
import java.util.Set;

public interface IMapperService<K,V> {
	
	public boolean add(V vo) throws Exception;
	
	public boolean edit(V vo) throws Exception;
	
	public boolean remove(K id) throws Exception;
	
	public boolean removeBatch(Set<K> ids) throws Exception;
	
	public V get(K id) throws Exception;
	
	public Map<String, Object> split(int currentPage, int lineSize) throws Exception;
	
	public Map<String, Object> splitByKeyword(int currentPage, int lineSize, String column, String keyword) throws Exception;

}
