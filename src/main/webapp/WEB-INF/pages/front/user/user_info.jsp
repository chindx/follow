<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.42.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/headbott.css"
	type="text/css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/usercenter.css"
	type="text/css" />
</head>
<body>
	<%@include file="/pages/frontheader.jsp"%>
	<%@ include file="/pages/usernav.jsp" %>
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
		$(document).ready(
				function() {
					$(".user-conr_tab li").click(
							function() {
								$(".user-conr_tab li").eq($(this).index())
										.addClass("cur").siblings()
										.removeClass('cur');
								$(".user-conr_tab2 li").hide().eq(
										$(this).index()).show();
							})
				});
	</script>
	
	<%@include file="/pages/frontfoot.jsp"%>
</body>
</html>