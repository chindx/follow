<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String url = request.getScheme() + "://" + request.getServerName() + ":" 
+ request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=url%>css/admin.css">
<title>index</title>
</head>
<body>
<h1>Welcome Zhiyou ${name}</h1>
<form class="<%=url%>css/main.css" action="<%=url%>pages/index.action" method="post">
<div>
<input type="text" value="${input}" name="input" id="input">
<table>
<tr>
<td>
<input type="submit" value="1" id="1" name="butt">
</td>
<td>
<input type="submit" value="2" id="2" name="butt">
</td>
<td>
<input type="submit" value="3" id="3" name="butt">
</td>
<td>
<input type="submit" value="+" id="+" name="butt">
</td>
</tr>
<tr>
<td>
<input type="submit" value="4" id="4" name="butt">
</td>
<td>
<input type="submit" value="5" id="5" name="butt">
</td>
<td>
<input type="submit" value="6" id="6" name="butt">
</td>
<td>
<input type="submit" value="-" id="-" name="butt">
</td>
</tr>
<tr>
<td>
<input type="submit" value="7" id="7" name="butt">
</td>
<td>
<input type="submit" value="8" id="8" name="butt">
</td>
<td>
<input type="submit" value="9" id="9" name="butt">
</td>
<td>
<input type="submit" value="*" id="*" name="butt">
</td>
</tr>
<tr>
<td>
<input type="submit" value="%" id="%" name="butt">
</td>
<td>
<input type="submit" value="0" id="0" name="butt">
</td>
<td>
<input type="submit" value="." id="." name="butt">
</td>
<td>
<input type="submit" value="/" id="divide" name="butt">
</td>
</tr>
<tr>
<td>
<input type="submit" value="c" id="clear" name="butt">
</td>
<td>
<input type="submit" value="b" id="bs" name="butt">
</td>
<td>
<input type="submit" value="=" id="=" name="butt">
</td>
</tr>
</table>
</div>
</form>
</body>
</html>