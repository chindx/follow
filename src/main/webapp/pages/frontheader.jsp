<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="header">
	<div class="heade-con">
		<div class="logo">
			<a href=""><img
				src="${pageContext.request.contextPath}/images/LOGO.png" /></a>
		</div>
		<div class="nav posa">
			<ul>				
				<li><a
					href="${pageContext.request.contextPath}/pages/front/index.action">首页</a></li>
				<li><a href="gyzc-list.html">公益众筹</a></li>
				<li><a href="cop.html">常见问题</a></li>
				<li><a href="ly-list.html">众筹资讯</a></li>
				<li><a
					href="${pageContext.request.contextPath}/projects/publish.action"
					style="">发布项目</a></li>
			</ul>
		</div>
		<div class="search">
			<form action="">
				<input type="text" class="search-txt" value="" placeholder="找项目">
				<input type="submit" class="search-but" value="">
			</form>
		</div>
		<div class="index-login">
			<em>${user.realName}</em>
			<span style="color: white">|</span> 
			<a href="${pageContext.request.contextPath}/user/login.action">登录</a>
			<span style="color: white">|</span> 
			<a href="${pageContext.request.contextPath}/user/reg.action">注册</a>			
		</div>
		<div class="user">
			<a href="${pageContext.request.contextPath}/user/center/info.action"
					style="">个人中心</a>
					<span style="color: white"></span> 
			<a href="${pageContext.request.contextPath}/user/logout.action">退出</a>			
		</div>
	</div>
</div>