<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav aria-label="Page navigation" class="text-right">
	<ul class="pagination">
		<%
			int currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
			int allPages = Integer.parseInt(request.getAttribute("allPages").toString());
			if (currentPage <= 1) {
		%>
		<li class="disabled"><a href="#" aria-label="Previous"> <span
				aria-hidden="false">&laquo;</span>
		</a></li>
		<%
			} else {
		%>
		<li><a href="${forward}?currentPage=${currentPage-1}"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
		</a></li>
		<%
			}
			for (int i = 1; i <= allPages; i++) {
		%>
		<li <%if (currentPage == i) {%> class="active" <%}%>><a
			href="${forward}?currentPage=<%=i%>"><%=i%></a></li>
		<%
			}
			if (currentPage >= allPages) {
		%>
		<li class="disabled"><a href="#" aria-label="Next"> <span
				aria-hidden="true">&raquo;</span>
		</a></li>
		<%
			} else {
		%>
		<li><a href="${forward}?currentPage=${currentPage+1}"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
		<%
			}
		%>

	</ul>
</nav>