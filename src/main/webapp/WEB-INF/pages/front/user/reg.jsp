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
<title>用户注册</title>
<script type="text/javascript" src="<%=url%>js/jquery-1.42.min.js"></script>
<script type="text/javascript" src="<%=url%>js/jquery.min.js"></script>
<link href="<%=url%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=url%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=url%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=url%>css/reg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=url%>css/headbott.css" type="text/css" />
<link rel="stylesheet" href="<%=url%>css/ace.min.css" type="text/css" />
</head>
<body>

<script type="text/javascript">
//获取验证码
function validateCode(){	
	$.ajax({
		url:"${pageContext.request.contextPath}/user/registerCode.action",
		method:"post",
		dataType:"json",
		async: true,
		//data:
		success: function(data){			
			$("#codeBtn").html(data.validateCode);
		},
		error: function(){
			alert("对不起, 验证码获取出错了 !");
		}
	});
}
//验证输入的验证码是否一致、
function checkCode(code){
	if(code==""){
		alert("验证码不能为空 !");
	}else{
		$.ajax({
			cache:false,
			url: "${pageContext.request.contextPath}/user/checkRegiestCode.action",
			mathod: "post",
			dataType: "json",
			data: {"code": code},
			success: function(data){
				if(!data.isSame){//验证不通过 
					alert(data.msg);
				}else{
					$("#codeBtn").empty();
					$("#codeBtn").append("<a href=\"#\">" + data.validateCode + "</a>");
					alert(data.msg);
				}
			},
			error : function(){
				alert("对不起,验证码输入不正确!");
			}
		});
	}
}
//提交注册
function btnRegister(){
	alert("this is html");
	$.ajax({
		cache:false,
		url: "${pageContext.request.contextPath}/user/register.action",
		method: "post",
		dataType: "json",
		data : $("#registerForm").serialize(),
		success : function(data){
			alert(data.msg);
		},
		error: function(){
			alert("注册失败!");
		}
	});
}
</script>
	<%@include file="/pages/frontheader.jsp"%>
	<div class="login-container">
		<div class="space-6"></div>
		<div class="position-relative">
			<div id="signup-box" class="signup-box widget-box no-border">
				<div class="widget-body">
					<div class="widget-main">
						<h4 class="header green lighter bigger">
							<i class="ace-icon fa fa-users blue"></i> 用户注册
						</h4>
						<div class="space-6"></div>
						<p>填写信息:</p>
						<!-- 注册表单 -->
						<form action="#" method="post" name="registerForm" id="registerForm">
							<fieldset>
								<label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="text" class="form-control" name="regName" id="regName"
										placeholder="邮箱或手机号码" /> <i class="ace-icon fa fa-envelope"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="text" class="form-control" name="name" id="name"
										placeholder="用户名" /> <i class="ace-icon fa fa-user"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="password" class="form-control" name="password"
										id="password" placeholder="密码" /> <i
										class="ace-icon fa fa-lock"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="password" class="form-control" name="repass" id="repass"
										placeholder="确认密码" /> <i class="ace-icon fa fa-retweet"></i>
								</span>
								</label>
								<!--验证码-->
								<label class="block clearfix"> <span> <input
										type="text" class="" name="code" id="code" onblur="checkCode(this.value)"
										placeholder="验证码" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-default" id="codeBtn" onclick="validateCode()">
											<a href="#">点击获取验证码</a>
										</button>
								</span>
								</label> <label class="block"> <input type="checkbox"
									class="ace" /> <span class="lbl"> 接受 <a href="###">用户协议</a>
								</span>
								</label>

								<div class="space-24"></div>

								<div class="clearfix">
									<button type="reset" class="width-30 pull-left btn btn-sm"
										id="reset">
										<i class="ace-icon fa fa-refresh"></i> <span
											class="bigger-110">重置</span>
									</button>

									<button type="submit" onclick="btnRegister()"
										class="width-65 pull-right btn btn-sm btn-success">
										<span class="bigger-110">注册</span> <i
											class="ace-icon fa fa-arrow-right icon-on-right"></i>
									</button>
								</div>
							</fieldset>
						</form>
						<!--第三方-->
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

					<div class="toolbar center">
						<a href="<%=url%>user/logout.action" data-target="#login-box"
							class="back-to-login-link"> <i
							class="ace-icon fa fa-arrow-left"></i> 返回登录
						</a>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
		</div>
	</div>
	<%@include file="/pages/frontfoot.jsp"%>
</body>
</html>
