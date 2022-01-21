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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 검색결과</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/notice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/review.css">
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./reviewtitle.jsp"%>
		<div class="notice-info">
			<%@ include file="./searchbox.jsp"%>
			<div class="notice-info-list">
				<h2>
					'<%=request.getParameter("keyword")%>' 에 대한 후기 검색결과입니다.
				</h2>
				<br>
				<table class="post-list">
					<colgroup>
						<col width="10%">
						<col width="60%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead style="background-color: grey;">
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Date</th>
						<tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="4">=============================작성된 글이
										없습니다.=============================</td>
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
						<tr style="border-top: 1px black dashed;"
							class="notice-admin-menu">
							<td colspan="4" align="right"><input type="button"
								value="목록"
								onclick="location.href='${pageContext.request.contextPath}/ReviewController?command=list'"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>