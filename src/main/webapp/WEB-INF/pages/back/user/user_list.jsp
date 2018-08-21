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
	<%@ include file="/pages/header.jsp"%>
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
									<option>项目状态</option>
									<option>众筹中</option>
									<option>众筹失败</option>
									<option>众筹成功</option>
								</select>
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">所有项目列表</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive ">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>序号</th>
										<th>项目类型</th>
										<th>项目名称</th>
										<th>项目进度</th>
										<th>开始日期</th>
										<th>结束日期</th>
										<th>已筹金额</th>
										<th>发起人</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${projectsMap.allProjects}" var="projects">
										<tr>
											<td>${projects.id}</td>
											<td>${projects.psType.name}</td>
											<td>${projects.name}</td>
											<td><fmt:formatNumber
													value="${projects.raisedMoney/projects.money}"
													type="currentcy" pattern=".00%" /></td>
											<td>${DateUtils.timeToString(projects.startTime)}</td>
											<td>${DateUtils.timeToString(projects.endTime)}</td>
											<td>${projects.raisedMoney}</td>
											<td>${projects.user.name}</td>
											<td>
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
						<nav aria-label="Page navigation" class="text-right">
							<ul class="pagination">								
								<%
								int currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
								int allPages = Integer.parseInt(request.getAttribute("allPages").toString());
								if(currentPage <= 1){
								%>
								 <li class="disabled"><a aria-label="Previous">
										<span aria-hidden="false">&laquo;</span>
								</a></li>
								 <%
								 }else{
								 %>
								 <li><a href="<%=url%>projects/list.action?currentPage=${currentPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
								</a></li>								
								<%
								 }
								for(int i = 1; i <= allPages; i++){
								%>
								<li
								<%
								if(currentPage==i){
								%>
								class="active"
								<%
								}
								%>
								><a href="<%=url%>projects/list.action?currentPage=<%=i%>"><%=i%></a></li>
								<% 		
								}
								if(currentPage>=allPages){
								%>
								<li class="disabled"><a aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
								<%
								}else{
								%>
								<li><a href="<%=url%>projects/list.action?currentPage=${currentPage+1}" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
								<%
								}
								%>																
							</ul>
						</nav>
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
