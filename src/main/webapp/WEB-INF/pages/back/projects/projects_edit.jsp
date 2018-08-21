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
					<li class="active"><a
						href="<%=url%>projects/list.action">所有项目</a></li>
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
				<h1 class="page-header">${projects.name}项目</h1>

				<ul class="nav nav-tabs">
					<li role="presentation"><a
						href="<%=url%>projects/info.action?id=${projects.id}">基本信息</a></li>
					<li role="presentation"><a
						href="<%=url%>projects/detail.action?id=${projects.id}">项目信息</a></li>
					<li role="presentation"><a
						href="<%=url%>comments/comments.action?id=${projects.id}">项目评论</a></li>
					<li role="presentation"><a
						href="<%=url%>projects/progress.action?id=${projects.id}">项目进度</a></li>
					<li role="presentation"><a
						href="<%=url%>projects/follow.action?id=${projects.id}">项目跟踪</a></li>
					<li role="presentation" class="active"><a
						href="<%=url%>projects/preEdit.action?id=${projects.id}">项目编辑</a></li>
				</ul>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">项目编辑</h3>
					</div>
					<div class="panel-body">
					<form action="<%=url%>projects/edit.action" method="post">
					<input type="hidden" name="id" value="${projects.id}">
					<input type="hidden" name="userId" value="${projects.userId}">
					<input type="hidden" name="pstId" value="${projects.pstId}">
					<input type="hidden" name="auditor" value="${projects.auditor}">
					<input type="hidden" name="startTime" value="${DateUtils.timeToString(projects.startTime)}">
					<input type="hidden" name="endTime" value="${DateUtils.timeToString(projects.endTime)}">
					<input type="hidden" name="raisedMoney" value="${projects.raisedMoney}">
					<input type="hidden" name="supporter" value="${projects.supporter}">
						<table class="table table-bordered">
							<tr>
								<td>客服姓名</td>
								<td>
								<input type="text" name="custName" value="${projects.custName}"></td>
							</tr>
							<tr>
								<td>客服电话</td>
								<td>
								<input type="text" name="custPhone" value="${projects.custPhone}"></td>
							</tr>					
							<tr>
								<td>客服地址</td>
								<td>
								<input type="text" name="custAddress" value="${projects.custAddress}"></td>
							</tr>
							<tr>
								<td>文件名称</td>
								<td>
								<input type="text" name="file" value="${projects.file}"></td>
							</tr>
							<tr>
								<td>项目标题</td>
								<td>
								<input type="text" name="name" value="${projects.name}"></td>
							</tr>
							<tr>
								<td>筹款目的</td>
								<td>
								<input type="text" name="goal" value="${projects.goal}"></td>
							</tr>
							<tr>
								<td>项目地址</td>
								<td>
								<input type="text" name="address" value="${projects.address}"></td>
							</tr>							
							<tr>
								<td>筹资金额</td>
								<td>
								<input type="text" name="money" value="${projects.money}"></td>
							</tr>
							<tr>
								<td>筹资天数</td>
								<td>
								<input type="text" name="days" value="${projects.days}"></td>
							</tr>
							<tr>
								<td>宣传视频地址</td>
								<td>
								<input type="text" name="video" value="${projects.video}"></td>
							</tr>
							<tr>
								<td>项目故事</td>
								<td>
								<input type="text" name="story" value="${projects.story}"></td>
							</tr>
							<tr>
								<td>更多支持</td>
								<td>
								<input type="text" name="support" value="${projects.support}"></td>
							</tr>
							<tr>
								<td>提供简述回报</td>
								<td>
								<input type="text" name="repay" value="${projects.repay}"></td>
							</tr>
							<tr>
								<td>关于自己</td>
								<td>
								<input type="text" name="aboutMe" value="${projects.aboutMe}"></td>
							</tr>
							<tr>
								<td>项目状态</t的>
								<td>
								<input type="text" name="type" value="${projects.type}"></td>
							</tr>							
						</table>
						<div align="center" class="buttons">
			<input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
			<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
		</div>
		</form>
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
