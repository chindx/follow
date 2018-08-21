<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headbott.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ly-list.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reg.css" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/pstype.js"></script>						
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/address.js"></script>			
	<title>基本信息</title>
</head>
<body>
<!--上部导航栏开始-->
<%@include file="/pages/frontheader.jsp" %>
<!--中间核心-->
<div class="product">
	<!--头上表格-->
	<div class="product-table">
		<div class="product-left">
			<table class="table table-bordered">
				<tr class="text-center">
					<td class="active title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_basic.action">基本信息</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_info.action">项目信息</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_detail.action">详细描述</a></td>
					<td class="title-td"><a href="${pageContext.request.contextPath}/projects/publish/product_repay.action">回报设置</a></td>
				</tr>
			</table>
		</div>
		<div class="product-right">
			<table class="table table-bordered">
				<tr class="text-center">
					<td class="title-td">预览</td>
				</tr>
			</table>
		</div>
	</div>
	<!--下部form表单-->
	<div class="product-form">
		<!--上标题-->
		<div class="product-title">
			<div class="my-h4">
				<h4>选择你的身份类型</h4>
			</div>
			<div class="btn-save">
				<button id="saveDraft" onClick="saveDraft()" class="btn btn-default">保存草稿</button>
			</div>

		</div>
		<div class="clear"></div>
		<hr>
		<!--选择机构个人-->
		<div class="choose">
			<table class="table table-bordered">
				<tr class="text-center">
					<td class="choose-td" style="background: #00aced">个人</td>
				</tr>
			</table>
		</div>
		<!--表单-->
		<form id="ajaxbasic" action="${pageContext.request.contextPath}/projects/saveDraft.action" method="post">
			<div class="my-form text-center">
			    <input type="hidden" name="userId" value="${user.id}"/>
			    <input type="hidden" name="psId" value = "${projects.id}"/>
				<div class="product-input"><input class="text" type="text" name="realName" id="realName" placeholder="请输入中文姓名，2-20个字符" value="${user.realName}" readonly></div>
				<div class="product-input"><input class="text" type="text" name="idcard" id="idcard" placeholder="二代身份证，请输入数字或字母 " value="${user.idcard}" readonly></div>
				<div class="product-input"><input class="text" type="text" name="phone" id="phone" placeholder="请输入手机号码" value="${user.phone}" readonly></div>
				<div class="product-input"><input class="text" type="text" name="custName" id="custNameName" placeholder="客服联系人"></div>
				<div class="product-input"><input class="text" type="text" name="custPhone" id="custPhone" placeholder="客服咨询电话"></div>
			</div>			
			<div class="product-select">
	<input type="hidden" name="custAddress" id="address" value=""/>
		<div class="product-select1">		
			<select class="select1" name="province" id="province"
				onchange="getCity(this.value)">
				<option>请选择</option>
			</select>
		</div>
		<div class="product-select2">
			<select class="select2" name="city" id="city" onchange="getArea(this.value)">
				<option>请选择</option>
			</select>
		</div>
		<div class="product-select3">
			<select class="select3" name="area" id="area" onchange="getAddress(this.value)">
				<option>请选择</option>
			</select>
		</div>
	</div>
			<div class="product-select">
				<div class="select-type">
					<select class="select-cla" name="psType" id="psType">
						<option>请选择</option>												
					</select>
				</div>
			</div>			
		</form>
	</div>
</div>
<!--底部-->
<%@include file="/pages/frontfoot.jsp"%>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery1.12.4.min.js"></script>
<script type="text/javascript">
	function saveDraft() {
		$.ajax({
			url : "${pageContext.request.contextPath}/projects/saveDraft.action",
			method : "post",
			dataType:"json",
			data:$("#ajaxbasic").serialize(),
			success : function(data){
				alert("保存草稿成功" + data.projects);
			},
			error : function(){
				alert("保存草稿失败!!!");
			}
		})	
	}
</script>
</body>
</html>