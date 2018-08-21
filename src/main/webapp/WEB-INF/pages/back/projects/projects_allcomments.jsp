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
<title>项目评论</title>
<link rel="stylesheet" href="<%=url%>admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=url%>admin/css/dashboard.css" />
</head>
<body>
	<%@include file="/pages/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=url%>pages/back/index.action">首页</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=url%>projects/list.action">所有项目</a></li>
					<li><a href="<%=url%>projects/audit.action">项目审核</a></li>
					<li><a href="<%=url%>projects/allfollow.action">项目跟踪</a></li>
					<li class="active"><a
						href="<%=url%>comments/allcomments.action">项目评论</a></li>
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
				<h1 class="page-header">所有项目评论</h1>

				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="项目名称">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="评论人">
							</div>
							&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-primary">查询</button>
						</form>
					</div>
				</div>
				<div class="panel-heading">
					<div class="panel-title">评论列表</div>
				</div>
				<div class="table-responsive ">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>序号</th>
								<th>评论人</th>
								<th>项目名称</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentsMap.allComments}" var="comments">
								<tr>
									<td>${comments.id}</td>
									<td>${comments.user.name}</td>
									<td>${comments.projects.name}</td>
									<td>${comments.content}</td>
									<td><fmt:formatDate value="${comments.time}" type="both"
											pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
									<td><a
										href="<%=url%>comments/detail.action?id=${comments.id}"
										title="查看评论详情"> <span
											class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
										&nbsp;&nbsp; <!-- 评论不需要编辑 
                  	                            <a href="<%=url%>comments/info.action?id=${comments.id}" title="编辑项目信息">
                  	                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                  	                            &nbsp;&nbsp;--> <a
										href="<%=url%>comments/delete.action?id=${comments.id}"
										title="删除评论"> <span
											class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<%@ include file="/pages/split.jsp"%>
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
