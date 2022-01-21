<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/notice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/review.css">
<style>
.notice-title {
	background-color: rgba(223, 223, 223, 0.623);
	background-image:
		url("http://drive.google.com/uc?export=view&id=1QNK1lHQzEAIb8RwPk4cQHILTehczwNnt");
	background-size: cover;
	background-blend-mode: overlay;
}
</style>
</head>
<body>
	<div class="notice-title">
		<h1>테마 여행지</h1>
		<p>테마와 장르로 떠나는 여행지</p>
	</div>
</body>
</html>