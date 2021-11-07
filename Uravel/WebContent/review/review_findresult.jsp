<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="java.util.List"%>
<%@ page import="com.dto.ReviewDto"%>
<%@ page import="com.dto.TravelDto" %>
<%@ page import="com.dto.LocationDto" %>
<%@ page import="com.dto.ThemeDto" %>
<%@ page import="com.dao.ReviewDao" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 검색결과</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">
<style>
div {
	text-align: center;
}
</style>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="reviewlist">
			<h1>후기 검색결과</h1>
			<form action="ReviewController" method="post">
				<input type="hidden" name="command" value="findReview"> <select
					name="themename">
					<%
					ReviewDao dao = new ReviewDao();
					List<ThemeDto> themelist = dao.selectTheme();
					for (int i = 0; i < themelist.size(); i++) {
					%>
					<option value="<%=themelist.get(i).getThemename()%>"><%=themelist.get(i).getThemename()%></option>
					<%
					}
					%>
				</select>&nbsp; <select name="localname">
					<%
					List<LocationDto> locallist = dao.selectLocation();
					for (int i = 0; i < locallist.size(); i++) {
					%>
					<option value="<%=locallist.get(i).getLocalname()%>"><%=locallist.get(i).getLocalname()%></option>
					<%
					}
					%>
				</select>&nbsp; &nbsp;&nbsp;<input type="submit" value="찾기">
			</form>

		</div>


		<h3>
			'<%=request.getParameter("localname")%>,<%=request.getParameter("themename")%>'에 대한 후기 검색결과입니다.
		</h3>

		<table id="review-table">
			<colgroup>
				<col width="100">
				<col width="300">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead style="background-color: grey;">
				<tr>
					<th>No.</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">=============================작성된 글이
								없습니다.==================================</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.postno }</td>
								<td><a
									href="ReviewController?command=detail&postno=${dto.postno}">${dto.title }</a></td>
								<td>${dto.username }</td>
								<td>${dto.postdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="4" align="right"><input type="button" value="등록"
						onclick="location.href='${pageContext.request.contextPath}/File?command=writeform'"></td>
				</tr>
			</tbody>
		</table>
	</main>
	<%@ include file="../common/footer.jsp"%>




</body>
</html>