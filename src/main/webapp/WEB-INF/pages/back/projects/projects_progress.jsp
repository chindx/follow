<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.zhiyou100.crowdfunding.utils.DateUtils"%>
<%
	String path = request.getContextPath();
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>众筹管理后台</title>
<link rel="stylesheet" href="<%=url%>admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=url%>admin/css/dashboard.css" />
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">众筹管理平台</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=url%>pages/back/index.action">首页</a></li>
					<li><a href="#">欢迎, ${admin.name}</a></li>
					<li><a href="#" title="修改个人资料和密码的页面">设置</a></li>
					<li><a href="<%=url%>admin/login.jsp" title="退出登录">退出</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=url%>pages/back/index.action">首页</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<%=url%>projects/list.action">所有项目</a></li>
					<li><a href="<%=url%>projects/audit.action">项目审核</a></li>
					<li><a href="<%=url%>projects/allfollow.action">项目跟踪</a></li>
					<li><a href="<%=url%>comments/allcomments.action">项目评论</a></li>
					<li><a href="<%=url%>projectsType/list.action">项目分类</a></li>
					<li><a href="<%=url%>projects/recommend.action">项目推荐</a></li>
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
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">${fundingMap.projects.name}项目</h1>

				<ul class="nav nav-tabs">
					<li role="presentation"><a
						href="<%=url%>projects/info.action?id=${keyword}">基本信息</a></li>
					<li role="presentation"><a
						href="<%=url%>projects/detail.action?id=${keyword}">项目信息</a></li>
					<li role="presentation"><a
						href="<%=url%>comments/comments.action?id=${keyword}">项目评论</a></li>
					<li role="presentation" class="active"><a
						href="<%=url%>projects/progress.action?id=${keyword}">项目进度</a></li>
					<li role="presentation"><a
						href="<%=url%>projects/follow.action?id=${keyword}">项目跟踪</a></li>
				</ul>
				<div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">项目进度</h3>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
							<tr>
					  	<th>项目名</th>
					  	<td>${fundingMap.projects.name}</td>
					  </tr>
					  <tr>
					  	<th>筹款金额</th>
					  	<td>${fundingMap.projects.money}</td>
					  </tr>
					  <tr>
					  	<th>已筹金额</th>
					  	<td>${fundingMap.projects.raisedMoney}</td>
					  </tr>
					  <tr>
					  	<th>支持人数</th>
					  	<td>${fundingMap.projects.supporter}</td>
					  </tr>					  
					  <tr>
					  	<th>项目进度</th>
					  	<td>
					  	<fmt:formatNumber value="${fundingMap.projects.raisedMoney/fundingMap.projects.money}" type="currentcy" pattern=".00%"/>%
					  	</td>
					  </tr>					  		 
					</table>
				  </div>
				</div>				
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">筹款详情</h3>
				  </div>
				  <div class="panel-body">
				  <table class="table table-bordered">				    				    	
					  <tr>
					  	<th>用户名</th>
					  	<th>捐赠金额</th>
					  	<th>捐赠时间</th>					  	
					  </tr>
					  <c:forEach items="${fundingMap.allFundings}" var="funding">
					  <tr>
					  	<td>${funding.user.name}</td>
					  	<td>${funding.money}</td>
					  	<td>
					  	<fmt:formatDate value="${funding.time}" type="both"/>
					  	</td>
					  </tr>						  
					  </c:forEach>					  
					</table>					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=url%>admin/js/jquery1.12.4.min.js"></script>
	<script type="text/javascript" src="<%=url%>admin/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=url%>admin/js/countUp.js"></script>
	<script>
		$(document).ready(function() {

		});
	</script>
</body>
</html>
