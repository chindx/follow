<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>实名认证</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.42.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/headbott.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reg.css" type="text/css" />
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/usercenter.css"
	type="text/css" />
<body>
	<%@include file="/pages/frontheader.jsp"%>
	<%@include file="/pages/usernav.jsp"%>
	<script>
		var d_var = $(".search .search-txt").val();
		$(".search .search-txt").focus(function() {
			if ($(this).val() == d_var) {
				$(this).val("");
			}
		});

		$(".search .search-txt").blur(function() {
			if ($(this).val() == "") {
				$(this).val("找项目");
			}
		});
	</script>
	<script>
		$(document).ready(function() {
			$(".user-conr_tab li").click(function() {
				$(".user-conr_tab li").eq($(this).index()).addClass("cur").siblings().removeClass('cur');
				$(".user-conr_tab2 li").hide().eq($(this).index()).show();
			})
		});		
	</script>
	<!--表单-->
	<div class="user-auth">
		<!--上标题-->
		<div class="user-auth-title">
			<p>实名认证</p>
		</div>
		<form class="user-auth-from"
			action="${pageContext.request.contextPath}/user/authName.action">
			<div class="user-form text-center">
				<div class="user-input">
					<input class="text" type="text" name="realName"
						placeholder="请输入中文姓名，2-20个字符">
				</div>
				<div class="user-input">
					<input class="text" type="text" name="idcard"
						placeholder="二代身份证，请输入数字或字母">
				</div>
				<div class="user-input">
					<input class="text" type="text" name="phone" placeholder="请输入手机号码">
				</div>
			</div>			
				<div class="user-select">
					<div class="user-select1">
						<select class="select1" name="">
							<option>请选择</option>
							<option>河南省</option>
						</select>
					</div>
					<div class="user-select2">
						<select class="select2" name="">
							<option>请选择</option>
							<option>郑州市</option>
							<option>开封市</option>
						</select>
					</div>
				</div>				
			<div class="btn-save" align="center">
				<button class="btn btn-save">提交</button>
			</div>
		</form>
	</div>
	<%@include file="/pages/frontfoot.jsp"%>
</body>
</html>