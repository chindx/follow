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
  <link rel="stylesheet" href="<%=url%>css/calendar.css"/>  
  <title>${title}</title>
</head>
<body onload="load()">
  <div class="calendar" id="calendar"></div>  
  <script type="text/javascript" src="<%=url%>js/calendar.js">
  </script>
</body>
</html>