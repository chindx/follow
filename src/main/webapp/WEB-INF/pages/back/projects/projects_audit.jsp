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
<title>项目审核</title>
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
					<li><a href="#" title="退出登录">退出</a></li>
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
					<li><a href="<%=url%>projects/list.action">所有项目</a></li>
					<li class="active"><a href="<%=url%>projects/audit.action">项目审核</a></li>
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
				<h1 class="page-header">所有众筹项目</h1>

				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="项目名称">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="项目发起人">
							</div>							
							<div class="form-group">
								<select class=form-control>
									<option>项目类型</option>
									<option>教育助学</option>
									<option>爱心环保</option>
									<option>扶贫助困</option>
									<option>公益创业</option>
									<option>公益活动</option>
								</select>
							</div>
							&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-primary">查询</button>
						</form>
					</div>
				</div>
					<div class="panel-heading">
						<div class="panel-title">项目列表</div>
					</div>
					<div class="panel-body">
						<div class="table-responsive ">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>序号</th>
										<th>项目类型</th>
										<th>项目名称</th>
										<th>发起人</th>
										<th>发起人电话</th>
										<th>项目文件</th>
										<th>筹款目的</th>
										<th>项目地点</th>
										<th>筹款金额</th>
										<th>宣传视频地址</th>
										<th>项目故事</th>
										<th>更多支持</th>
										<th>提供回报简述</th>
										<th>关于自己</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${projectsMap.allProjects}" var="projects">
										<tr>
											<td>${projects.id}</td>
											<td>${projects.psType.name}</td>
											<td>${projects.name}</td>
											<td>${projects.user.name}</td>
											<td>${projects.user.phone}</td>
											<td>${projects.file}</td>
											<td>${projects.goal}</td>
											<td>${projects.address}</td>
											<td>${projects.money}</td>
											<td>${projects.video}</td>
											<td>${projects.story}</td>
											<td>${projects.support}</td>
											<td>${projects.repay}</td>
											<td>${projects.aboutMe }</td>
											<td><a
												href="<%=url%>projects/info.action?id=${projects.id}">详情</a>
												<a href="<%=url%>projects/info.action?id=${projects.id}" title="查看项目详情">
												<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
												&nbsp;&nbsp;
                  	                            <a href="<%=url%>projects/preEdit.action?id=${projects.id}" title="编辑项目信息">
                  	                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
												&nbsp;&nbsp;
                  	                            <a href="<%=url%>projects/remove.action?id=${projects.id}" title="删除项目信息">
                  	                            <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<%@include file="../../../../pages/split.jsp"%>
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
