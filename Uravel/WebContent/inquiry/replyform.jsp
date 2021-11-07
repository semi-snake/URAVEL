<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.InquiryDto"%>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일문의</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/inquiry.css">
<style>
hr {
	border: 1px solid #f9f9f9;
}

.notice-info select {
	font-size: large;
}
</style>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./inqtitle.jsp"%>
		<!-- 일대일 문의 본문 -->
		<div class="notice-main">
			<!-- 게시글 작성 -->
			<div class="notice-info">
				<h1>답변 작성</h1>
				<form action="Inquiry" method="POST">
					<input type="hidden" name="command" value="reply"> <input
						type="hidden" name="inqno" value="${current_data.inqno }">
					<table>
						<!-- 게시글 표시 : 제목 -->
						<tr>
							<th>제목</th>
							<td>${current_data.title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${sessionScope.dto.username }</td>
						</tr>
						<tr>
							<th>질문 유형</th>
							<td>${current_data.que_type }</td>
						</tr>
						<!-- 게시글 표시 : 구분선 -->
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<!-- 게시글 표시 : 문의내용 본문 -->
						<tr>
							<th>문의 내용</th>
							<td>${current_data.content}</td>
						</tr>
						<!-- 게시글 표시 : 구분선 -->
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<!-- 게시글 표시 : 답변내용 -->
						<tr>
							<th>답변</th>
							<td><textarea name="content" onkeydown="resize(this)"
									onkeyup="resize(this)">안녕하세요! 당신을 위한 서울 여행 정보 사이트 URAVEL 입니다.</textarea></td>
						</tr>
						<!-- 게시글 표시 : 구분선 -->
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<!-- 게시글 메뉴 : 작성, 취소 -->
						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="작성"> <input type="button" value="취소"
								onclick="history.back();"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>