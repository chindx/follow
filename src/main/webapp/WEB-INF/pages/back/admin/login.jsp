<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="<%=url%>js/jquery-1.42.min.js"></script>
    <link href="<%=url%>css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=url%>css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=url%>admin/css/style.css" rel="stylesheet" type="text/css">
    <title>${title}</title>
</head>
<body>
<div class="container">
    <form class="login-form" action="<%=url%>admin/login.action" method="post">
        <h2 class="text-center">登陆管理系统</h2>
        <div class="login-wrap">
            <!-- icon_lock_alt -->
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
                <span class="input-group-addon"><i class="ace-icon fa fa-user"></i></span>
                <input type="text" name="name" id="name" class="form-control" placeholder="用户名" autofocus required>
            </div>
            <div class="input-group" style="font-size:100px!important;">
                <span class="input-group-addon"><i class="ace-icon fa fa-lock"></i></span>
                <input type="password" name="password" id="password" class="form-control" placeholder="密码" autofocus required>
            </div>
            <label class="checkbox" style="margin-left: 20px">
                <input type="checkbox" value="remember-me">记住我
                <span class="pull-right"> <a href="#">忘记密码?</a></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" type="submit">登陆</button>
            <p class="error-message">${errorMessage}</p>
        </div>
    </form>
</div>
</body>
</html>