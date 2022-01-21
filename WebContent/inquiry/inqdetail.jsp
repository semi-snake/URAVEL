<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.dto.InquiryDto"%>
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<%
int inqno = Integer.parseInt(request.getParameter("inqno"));
pageContext.setAttribute("inqno", inqno);
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
.content-section {
	border: 1px solid #f9f9f9;
}

hr {
	border: 1px dashed #f9f9f9;
}

.notice-info select {
	font-size: large;
}
</style>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function confirmDelete(inqno) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			window.location.href = "${pageContext.request.contextPath}/Inquiry?command=delete&inqno=${inqno }";
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./inqtitle.jsp"%>
		<!-- 일대일 문의 본문 -->
		<div class="notice-main">
			<!-- 게시글 작성 -->
			<div class="notice-info">
				<h1>게시글 보기</h1>
				<table>
					<colgroup>
						<col width="10%">
						<col width="80%">
					</colgroup>
					<c:forEach var="post" items="${res }">
						<!-- 게시글 표시 : 제목 -->
						<tr>
							<th>제목</th>
							<td>${post.title }<c:if test="${post.inqno eq inqno }">
									<b> [현재글]</b>
								</c:if></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${post.username }</td>
						</tr>
						<tr>
							<th>질문 유형</th>
							<td>${post.que_type }</td>
						</tr>
						<!-- 게시글 표시 : 본문 구분선 -->
						<tr>
							<td colspan="2"><hr class="content-section"></td>
						</tr>
						<!-- 게시글 표시 : 문의내용 본문 -->
						<tr>
							<td colspan="2">${post.content }</td>
						</tr>
						<!-- 게시글 표시 : 구분선 -->
						<tr>
							<td colspan="2"><hr></td>
						</tr>
					</c:forEach>
					<!-- 게시글 메뉴 : 수정/삭제/목록 -->
					<tr>
						<td colspan="2" align="right">
							<ul>
								<%
								if ((userInfo.getRole().equals("ADMIN"))) {
								%>
								<li><a
									href="${pageContext.request.contextPath}/Inquiry?command=replyform&inqno=${inqno }">답글</a></li>
								<%
								} else {
								%>
								<li><a
									href="${pageContext.request.contextPath}/Inquiry?command=updateform&inqno=${inqno }">수정</a></li>
								<li><a href="javascript:confirmDelete(${inqno });">삭제</a></li>
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