<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}/pages/back/index.action">首页</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}/projects/list.action">所有项目</a></li>
		<li><a href="${pageContext.request.contextPath}/projects/audit.action">项目审核</a></li>
		<li><a href="${pageContext.request.contextPath}/projects/allfollow.action">项目跟踪</a></li>
		<li><a href="${pageContext.request.contextPath}/comments/allcomments.action">项目评论</a></li>
		<li><a href="${pageContext.request.contextPath}/projectsType/list.action">项目分类</a></li>
		<li><a href="${pageContext.request.contextPath}/projects/recommend.action">项目推荐</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="">注册用户</a></li>
		<li><a href="">用户资金</a></li>
		<li><a href="">用户日志</a></li>
		<li><a href="">实名审核</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="">新闻管理</a></li>
		<li><a href="">问题管理</a></li>
		<li><a href="">管理用户</a></li>
		<li><a href="">管理日志</a></li>
	</ul>
</div>