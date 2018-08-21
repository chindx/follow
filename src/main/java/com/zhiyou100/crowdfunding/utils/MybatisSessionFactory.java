package com.zhiyou100.crowdfunding.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 定义一个MybatisSessionFactory对象的取得工具类，实现功能如下:<br>
 * 1.可以取得SqlSessionFactory以及SqlSession对象;<br>
 * 2.可以进行SqlSession关闭处理;<br>
 * 3.可以重新建立SqlSessionFactory。<br>
 * */
//public class MybatisSessionFactory {
//	//取得mybatis的核心配置文件，此处定义了文件路径
//	private static final String CONFIG_FILE = "mybatis.xml";
//	//输入流
//	private static InputStream input = null;
//	//定义数据库连接工厂
//	private static SqlSessionFactory factory = null;
//	//SqlSession对象声明
//	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<>();
//	
//	static {
//		rebuildSqlSessionFactory();
//	}
//	/**
//	 * 建立一个SqlSessionFactory接口对象
//	 * */
//	public static void rebuildSqlSessionFactory() {
//		try {
//			input = Resources.getResourceAsStream(CONFIG_FILE);
//			factory = new SqlSessionFactoryBuilder().build(input);			
//		} catch (IOException e) {			
//			e.printStackTrace();
//		}		
//	}
//	/**
//	 * 打开或取得一个已经存在的SqlSession接口对象
//	 * */
//	public static SqlSession getSession() {
//		SqlSession session = threadLocal.get();
//		if(session == null) {
//			if(factory == null) {
//				rebuildSqlSessionFactory();
//			}
//			session = factory.openSession();
//			threadLocal.set(session);
//		}
//		return session;
//	}
//	/**
//	 * 取得已经建好的SqlSessionFactory对象
//	 * */
//	public static SqlSessionFactory getFactory() {
//		return factory;
//	}
//	/**
//	 * 执行SqlSession的关闭，同时关闭流
//	 * */
//	public static void close() {
//		SqlSession session = threadLocal.get();
//		if(session != null) {
//			session.close();
//		}
//		try {
//			input.close();
//		} catch (IOException e) {		
//			e.printStackTrace();
//		}
//		threadLocal.remove(); 
//	}
//}
