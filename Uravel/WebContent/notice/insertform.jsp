<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.NoticeDto"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css">
<style>
hr {
	border: 1px solid #f9f9f9;
}
</style>
<script src="js/admin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./noticetitle.jsp"%>
		<!-- 공지사항 본문 -->
		<div class="notice-main">
			<!-- 게시글 상세 조회 -->
			<div class="notice-info">
				<h1>게시글 작성</h1>
				<form action="../Notice" method="POST">
					<input type="hidden" name="command" value="insert">
					<table>
						<colgroup>
							<col width="20%">
							<col width="800px">
						</colgroup>
						<!-- 게시글 표시 : 공지사항 제목 -->
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<!-- 게시글 표시 : 구분선 -->
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<!-- 게시글 표시 : 공지사항 본문 -->
						<tr>
							<th>내용</th>
							<td><textarea name="content" onkeydown="resize(this)"
									onkeyup="resize(this)"></textarea></td>
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