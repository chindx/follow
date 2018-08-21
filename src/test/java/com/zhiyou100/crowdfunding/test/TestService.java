package com.zhiyou100.crowdfunding.test;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zhiyou100.crowdfunding.model.Comments;
import com.zhiyou100.crowdfunding.service.ICommentsService;

import junit.framework.TestCase;

public class TestService {
	private static ApplicationContext context;
	static {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	@Test
	public void testAdd() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
//		Comments vo = context.getBean("comments", Comments.class);
		Comments vo = new Comments();
		vo.setId(1);		
		TestCase.assertTrue(service.add(vo));
	}
	@Test
	public void testEdit() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		Comments vo = new Comments();
		vo.setId(1);		
		TestCase.assertTrue(service.edit(vo));
	}
	@Test
	public void testRemove() throws Exception{
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		TestCase.assertTrue(service.remove(1));
	}
	
	@Test
	public void testRemoveBatch() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		Set<Integer> list = new HashSet<>();
		list.add(1);
		TestCase.assertTrue(service.removeBatch(list));
	}
	@Test
	public void testGet() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		TestCase.assertTrue(service.get(1) != null);
	}
	@Test
	public void testSplit() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		TestCase.assertTrue(service.split(1,5) != null);
	}
	@Test
	public void testSplitByKeyword() throws Exception {
		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
		TestCase.assertTrue(service.splitByKeyword(1,5,"fd_ps_id","1") != null);
		System.out.println(service.splitByKeyword(1,5,"fd_ps_id","1"));
	}
	public static void main(String[] args) throws Exception {
//		ICommentsService service = context.getBean("commentsServiceImpl", ICommentsService.class);
//		TestCase.assertTrue(service.splitByKeyword(1,5,"","%%") != null);
		
	}
}
