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
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/pstype.js"></script>
</head>
<body>
	<%@ include file="/pages/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/pages/leftmenu.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">所有众筹项目</h1>
				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline" action="<%=url%>projects/list.action">
							<div class="form-group">
								<input type="text" class="form-control" name="name"
									id="exampleInputName2" placeholder="项目名称">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="userName"
									id="exampleInputName2" placeholder="项目发起人">
							</div>
							<div class="form-group">
								<select class=form-control name="type">
									<option value="">项目状态</option>
									<option value="2">众筹中</option>
									<option value="3">众筹失败</option>
									<option value="4">众筹成功</option>
								</select>
							</div>
							<div class="form-group">
								<select class=form-control name="pstId" id="psType">
									<option value="">项目类型</option>
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
											<!--
									<td><meter min=0 max=1 value="${projects.raisedMoney/projects.money}"></meter></td>
 									-->
											<td><fmt:formatNumber
													value="${projects.raisedMoney/projects.money}"
													type="currentcy" pattern=".00%" /></td>
											<td><fmt:formatDate value="${projects.startTime}"
													type="both" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
											<td><fmt:formatDate value="${projects.endTime}"
													type="both" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
											<td>${projects.raisedMoney}</td>
											<td>${projects.user.name}</td>
											<td><a
												href="<%=url%>projects/info.action?id=${projects.id}"
												title="查看项目详情"> <span
													class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
												&nbsp;&nbsp; <a
												href="<%=url%>projects/preEdit.action?id=${projects.id}"
												title="编辑项目信息"> <span class="glyphicon glyphicon-edit"
													aria-hidden="true"></span></a> &nbsp;&nbsp; <a
												href="<%=url%>projects/remove.action?id=${projects.id}"
												title="删除项目信息"> <span
													class="glyphicon glyphicon-remove-circle"
													aria-hidden="true"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<%@include file="/pages/split.jsp"%>
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
