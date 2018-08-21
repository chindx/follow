package com.zhiyou100.crowdfunding.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface Mapper<K, V> {
	
	public boolean doCreate(V vo) throws Exception;

	public boolean doUpdate(V vo) throws Exception;

	public boolean doRemove(K id) throws Exception;

	public boolean doRemoveBatch(Set<K> ids) throws Exception;

	public V findById(K id) throws Exception;

	public List<V> findAll() throws Exception;	
	
	public List<K> findAllId() throws Exception;

	public List<V> findAllSplit(Map<String, Object> map) throws Exception;

	public List<V> findSplitByColumn(Map<String, Object> map) throws Exception;

	public long findAllCount() throws Exception;

	public long findCountByColumn(Map<String, Object> map) throws Exception;
}
