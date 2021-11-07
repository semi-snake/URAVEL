<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.dto.NoticeDto"%>
<%@ page import="java.util.List"%>
<%
int pageno = 1;
if (request.getParameter("page") != null) {
	pageno = Integer.parseInt(request.getParameter("page"));
}
pageContext.setAttribute("pageno", pageno);

int size = (int) request.getAttribute("size");
int end = ((size - 1) / 20 + 1);
pageContext.setAttribute("end", end);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/notice.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$('a[title="${pageno}"]').addClass('page-selected');
	});
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./noticetitle.jsp"%>
		<!-- 공지사항 본문 -->
		<div class="notice-main">
			<div class="notice-info-list">
				<h1>게시글 목록</h1>
				<table class="post-list">
					<colgroup>
						<col width="10%">
						<col width="80%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty res }">
								<tr>
									<td colspan="3">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${res }" begin="0" end="20">
									<tr>
										<td>${dto.noticeno }</td>
										<td><a
											href="Notice?command=detail&noticeno=${dto.noticeno }">${dto.title }</a></td>
										<td>${dto.postdate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<%
						if (dto != null && dto.getRole().equals("ADMIN")) {
						%>
						<tr style="border-top: 1px black dashed;"
							class="notice-admin-menu">
							<td align="right" colspan="2"></td>
							<td><a href="Notice?command=insertform">등록하기</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<ul class="pagination">
					<c:if test="${pageno ne 1}">
						<li><a
							href="${pageContext.request.contextPath}/Notice?command=noticelist&page=${pageno-1}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${end}">
						<li><a
							href="${pageContext.request.contextPath}/Notice?command=noticelist&page=${i}"
							title="${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageno ne end}">
						<li><a
							href="${pageContext.request.contextPath}/Notice?command=noticelist&page=${pageno+1}">다음</a></li>
					</c:if>
				</ul>
				<!--공지사항 : 검색-->
				<div class="search-box-admin">
					<table>
						<tr>
							<td><h3>통합 검색</h3></td>
							<td><form action="Notice" method="post">
									<input type="hidden" name="command" value="search"> <input
										type="text" name="keyword" style="text-align: center;">
									<input type="submit" value="검색">
								</form></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>