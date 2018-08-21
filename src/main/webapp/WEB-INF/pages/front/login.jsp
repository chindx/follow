<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=url%>js/jquery-1.42.min.js"></script>
<link href="<%=url%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=url%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=url%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=url%>css/index2.css" rel="stylesheet" type="text/css">
<link href="<%=url%>css/reg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=url%>css/headbott.css" type="text/css" />
<link rel="stylesheet" href="<%=url%>css/ace.min.css" type="text/css" />
</head>

<script>
	window.onload = function() {
		var obtn = document.getElementById('btn'); //登录按钮
		var obox = document.getElementById('box');
		var obg = document.getElementById('bg');
		obtn.onclick = function() {

			obox.style.display = "block";
			obg.style.display = "block";
			// 用这个效果在IE6显示不全，因为body。html。document高度不全，那么就要，html，body{ width：100%； height100%；最只要是height；
			//不满足要求上网找特特效}
		}
	}
</script>

<body>
	<%@include file="/pages/frontheader.jsp" %>
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

	<div class="login-container">

		<div class="space-6"></div>

		<div class="position-relative">
			<div id="login-box" class="login-box visible widget-box no-border">
				<div class="widget-body">
					<div class="widget-main">
						<h4 class="header blue lighter bigger">
							<i class="ace-icon fa fa-coffee green"></i> 用户登陆
						</h4>

						<div class="space-6"></div>
						<!-- 登录窗口 -->
						<form action="<%=url%>user/login.action" method="post">
							<fieldset>
								<label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <i
										class="ace-icon fa fa-user"></i> <input type="text"
										class="form-control" name="loginName" id="loginName"
										placeholder="邮箱或手机号码" />

								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <i
										class="ace-icon fa fa-lock"></i> <input type="password"
										class="form-control" name="password" id="password"
										placeholder="请输入密码" />

								</span>
								</label>

								<div class="space"></div>

								<div class="clearfix">
									<label class="inline"> <input type="checkbox"
										class="ace" /> <span class="lbl"> 记住</span>										
									</label>
									<a style="color: red">${errorMsg}</a>
									<button type="submit"
										class="width-35 pull-right btn btn-sm btn-primary">
										<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登录</span>
									</button>
								</div>

								<div class="space-4"></div>
							</fieldset>
						</form>

						<div class="social-or-login center">
							<span class="bigger-110">第三方登录</span>
						</div>

						<div class="space-6"></div>

						<div class="social-login center">
							<a href="#"> <img src="<%=url%>images/weixin.png">
							</a> <a href="#"> <img src="<%=url%>images/qq.png">
							</a> <a href="#"> <img src="<%=url%>images/sina.png">
							</a>
						</div>

					</div>
					<!-- /.widget-main -->
					<div class="toolbar clearfix">
						<div>
							<a href="#" data-target="#forgot-box"
								class="forgot-password-link"> <i
								class="ace-icon fa fa-arrow-left"></i> 忘记密码
							</a>
						</div>

						<div>
							<a href="<%=url%>reg.jsp" data-target="#signup-box"
								class="user-signup-link"> 注册 <i
								class="ace-icon fa fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.login-box -->

			<!-- /.position-relative -->
		</div>
	</div>
	<!-- /.col -->
	<%@include file="/pages/frontfoot.jsp" %>
</body>
</html>
