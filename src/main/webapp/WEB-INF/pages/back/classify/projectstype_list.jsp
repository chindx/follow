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
<!-- 页眉 -->
	<%@include file="/pages/header.jsp"%>
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
					<li><a href="<%=url%>comments/allcomments.action">项目评论</a></li>
					<li class="active"><a href="<%=url%>projectsType/list.action">项目分类</a></li>
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
				<h1 class="page-header">所有项目类型</h1>

				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="项目类型">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="描述">
							</div>
							&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-primary">查询</button>
							&nbsp;&nbsp; <a class="btn btn-default btn-primary"
								href="<%=url%>WEB-INF/pages/back/classify/projectstype_add.jsp">添加</a>
						</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">所有项目类型</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive ">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>序号</th>
										<th>项目类型</th>
										<th>描述</th>
										<th>创建时间</th>
										<th>状态(0.可;1.禁用)</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${projectsTypeMap.allProjectsTypes}"
										var="projectsType">
										<tr>
											<td>${projectsType.id}</td>
											<td>${projectsType.name}</td>
											<td>${projectsType.desc}</td>
											<td><fmt:formatDate value="${projectsType.startDate}"
													type="both" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
											<td><c:if test="${projectsType.type eq 0}">可用</c:if> <c:if
													test="${projectsType.type eq 1}">禁用</c:if></td>
											<td><a
												href="<%=url%>projectsType/detail.action?id=${projectsType.id}"
												title="查看详情" data-toggle="modal"
                                       data-target="#myModal" onclick="getTable(${projectsType.id},${projectsType.name},${projectsType.desc},${projectsType.startDate},${projectsType.type}"> <span
													class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
												&nbsp;&nbsp; <a
												href="<%=url%>projectsType/preEdit.action?id=${projectsType.id}"
												title="编辑"> <span class="glyphicon glyphicon-edit"
													aria-hidden="true"></span></a> &nbsp;&nbsp; <a
												href="<%=url%>projectsType/remove.action?id=${projectsType.id}"
												title="删除"> <span
													class="glyphicon glyphicon-remove-circle"
													aria-hidden="true"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 分页 -->
						<%@ include file="/pages/split.jsp"%>						
						<!--模态框-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">分类详情</h4>
									</div>
									<div class="modal-body">
										<div class="form">
											<form class="form-validate form-horizontal"
												id="feedback_form" method="post">
												<div class="form-group ">
													<label for="p_id" class="control-label col-lg-2">序号<span
														class="required"> *</span></label>
													<div class="col-lg-10">
														<input class="form-control" id="p_id" type="text" readonly />
													</div>
												</div>

												<div class="form-group ">
													<label for="p_name" class="control-label col-lg-2">分类名称<span
														class="required"> *</span></label>
													<div class="col-lg-10">
														<input class="form-control" id="p_name" type="text" />
													</div>
												</div>
												<div class="form-group ">
													<label for="p_des" class="control-label col-lg-2">分类描述<span
														class="required"> *</span></label>
													<div class="col-lg-10">
														<input class="form-control" id="p_des" type="text" />
													</div>
												</div>
												<div class="form-group ">
													<label for="p_time" class="control-label col-lg-2">添加时间<span
														class="required"> *</span></label>
													<div class="col-lg-10">
														<input class="form-control" id="p_time" type="text"
															readonly />
													</div>
												</div>

												<div class="form-group ">
													<label for="p_status" class="control-label col-lg-2">分类状态<span
														class="required"> *</span></label>
													<div class="col-lg-10">
														<select class="form-control m-bot15" id="p_status">
															<option>可用</option>
															<option>禁用</option>
														</select>
													</div>
												</div>
												<div class="form-group" style="text-align: right;">
													<div class="col-lg-offset-2 col-lg-10">
														<button class="btn btn-primary" type="button" onclick="">保存</button>
														<button class="btn btn-default" type="reset">重置</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
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
	<script type="text/javascript" src="<%=url%>admin/js/dialog.js"></script>
	<script>
		function getTable(p_id, p_name, p_des, p_time, p_status) {
			document.getElementById("p_id").value = p_id;
			document.getElementById("p_name").value = p_name;
			document.getElementById("p_des").value = p_des;
			document.getElementById("p_time").value = p_time;
			document.getElementById("p_status").value = p_status;
		}
		function getdel(id) {
			javascript: $('body').dailog({
				type : 'danger',
				title : '错误.',
				discription : '您确定要删除ID为' + id + '的数据吗?'
			}, function(ret) {
				if (ret.index === 0) {
					window.location.href = "user!delUser?delid=" + id;
				}
				;
			})		
	</script>
</body>
</html>
