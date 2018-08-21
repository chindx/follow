package com.zhiyou100.crowdfunding.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.junit.Test;
import com.zhiyou100.crowdfunding.model.User;

import junit.framework.TestCase;

public class TestMybatis {
	
	@Test
	public void testAdd() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    User vo = new User();
	    vo.setAddress("ORZ");
	    vo.setCode("12345");
	    vo.setCreateTime(new Date());
	    vo.setEmail("123@qq.com");
	    vo.setId(1);
	    vo.setIdcard("41255516582236422");
	    vo.setMoney(1000);
	    vo.setName("Mickey");
	    vo.setPassword("123456");
	    vo.setPhone("1333333333");
	    vo.setRole(1);
	    vo.setSex('M');
	    vo.setUpdateTime(new Date());
	    int expected = session.insert("com.zhiyou100.crowdfunding.mapper.UserMapper.doCreate", vo);
	    
	    TestCase.assertEquals(expected, 1);
	    session.commit();
	    session.close();
	    input.close();
	}
	@Test
	public void testUpdate() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    User vo = new User();
	    vo.setAddress("ORZ");
	    vo.setCode("12345");
	    vo.setCreateTime(new Date());
	    vo.setEmail("123@qq.com");
	    vo.setId(1);
	    vo.setIdcard("41255516582236422");
	    vo.setMoney(1000);
	    vo.setName("Mickey");
	    vo.setPassword("123456");
	    vo.setPhone("1333333333");
	    vo.setRole(1);
	    vo.setSex('M');
	    vo.setUpdateTime(new Date());
	    int expected = session.update("com.zhiyou100.crowdfunding.mapper.UserMapper.doUpdate", vo);
	   
	    TestCase.assertEquals(expected, 1);
	    session.commit();
	    session.close();
	    input.close();
	}
	@Test
	public void testRemove() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    int id = 1;
	    int expected = session.delete("com.zhiyou100.crowdfunding.mapper.UserMapper.doRemove", id);
	   
	    TestCase.assertEquals(expected, 1);
	    session.commit();
	    session.close();
	    input.close();
	}
	@Test
	public void testRemoveBatch() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    Set<Integer> ids = new HashSet<>();
	    int id = 1;
	    ids.add(id);
	    int expected = session.delete("com.zhiyou100.crowdfunding.mapper.UserMapper.doRemoveBatch", ids);
	   
	    TestCase.assertEquals(expected, 1);
	    session.commit();
	    session.close();
	    input.close();
	}
	@Test
	public void findById() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    int id = 1;
	    User vo = session.selectOne("com.zhiyou100.crowdfunding.mapper.UserMapper.findById", id);
	  
	    TestCase.assertNotNull(vo);	   
	    session.close();
	    input.close();
	}
	
	@Test
	public void findAll() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    List<User> list = session.selectList("com.zhiyou100.crowdfunding.mapper.UserMapper.findAll",User.class);
	    TestCase.assertTrue(list != null);	  
	    session.close();
	    input.close();
	}
	@Test
	public void findAllCount() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    long expected = session.selectOne("com.zhiyou100.crowdfunding.mapper.UserMapper.findAllCount");
	    TestCase.assertTrue(expected != 0);
	    session.close();
	    input.close();
	}
	@Test
	public void findCountByCloumn() throws IOException{
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    Map<String, Object> map = new HashMap<>();
	    map.put("keyword", "%M%");
	    map.put("column", "us_name");
	    long expected = session.selectOne("com.zhiyou100.crowdfunding.mapper.UserMapper.findCountByColumn", map);
	    TestCase.assertTrue(expected != 0);
	    session.close();
	    input.close();
	}
	@Test
	public void findAllSplit() throws IOException {
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    Map<String, Object> map = new HashMap<>();
	    int currentPage = 1;
	    int lineSize = 5 ;
	    map.put("start", (currentPage-1)*lineSize);
	    map.put("lineSize", lineSize);
	    List<User> list = session.selectList("com.zhiyou100.crowdfunding.mapper.UserMapper.findAllSplit", map);
	    TestCase.assertTrue(list != null);
	    session.close();
	    input.close();
	}
	@Test
	public void findSplitByColumn() throws IOException {
		InputStream input = Resources.getResourceAsStream("mybatis.xml");
	    SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(input);
	    SqlSession session = factory.openSession();
	    Map<String, Object> map = new HashMap<>();
	    int currentPage = 1;
	    int lineSize = 5 ;
	    map.put("start", (currentPage-1)*lineSize);
	    map.put("lineSize", lineSize);
	    map.put("keyword", "%M%");
	    map.put("column", "us_name");
	    List<User> list = session.selectList("com.zhiyou100.crowdfunding.mapper.UserMapper.findAllSplit", map);
	    TestCase.assertTrue(list != null);
	    session.close();
	    input.close();
	}
}
