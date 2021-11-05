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

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/notice.css">
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
				<h1>게시글 보기</h1>
				<table>
					<colgroup>
						<col width="20%">
						<col width="800px">
					</colgroup>
					<!-- 게시글 표시 : 공지사항 제목 -->
					<tr>
						<th>제목</th>
						<td>${res.title}</td>
					</tr>
					<!-- 게시글 표시 : 작성일 -->
					<tr>
						<th>작성일</th>
						<td>${res.postdate}</td>
					</tr>
					<!-- 게시글 표시 : 구분선 -->
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<!-- 게시글 표시 : 공지사항 본문 -->
					<tr>
						<td colspan="2" class="notice-detail-content">${res.content }</td>
					</tr>
					<!-- 게시글 표시 : 구분선 -->
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<!-- 게시글 메뉴 : 수정/삭제/목록 -->
					<tr>
						<td colspan="2" align="right">
							<ul>
								<%
								if (dto != null && dto.getRole().equals("ADMIN")) {
								%>
								<li class="notice-admin-menu"><a
									href="${pageContext.request.contextPath}/Notice?command=updateform&noticeno=${res.noticeno }">수정</a></li>
								<li class="notice-admin-menu"><a
									href="${pageContext.request.contextPath}/Notice?command=delete&noticeno=${res.noticeno }">삭제</a></li>
								<%
								}
								%>
								<li><a href="javascript:history.back()">목록</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>