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
		url("https://lp-cms-production.imgix.net/2019-06/GettyImages-476220070_medium.jpg");
	background-size: cover;
	background-blend-mode: overlay;
}
</style>
</head>
<body>
	<div class="notice-title">
		<h1>지역별 여행지</h1>
		<p>지역별로 여행지를 확인하세요!</p>
	</div>
</body>
</html>