<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.dto.InquiryDto"%>
<%@ page import="java.util.List"%>
<%
int pageno = 1;
if (request.getParameter("page") != null) {
	pageno = Integer.parseInt(request.getParameter("page"));
}
pageContext.setAttribute("pageno", pageno);

int size = (int) request.getAttribute("size");
int end = (size / 20 + 1);

pageContext.setAttribute("end", end);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일문의</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/inquiry.css">

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
		<%@ include file="./inqtitle.jsp"%>
		<!-- 일대일 문의 본문 -->
		<div class="notice-main">
			<div class="notice-info-list">
				<h1>게시글 목록</h1>
				<h3>※ 문의 내용은 작성자만 열람이 가능합니다.</h3>
				<table class="post-list">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="30%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>질문유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>진행상황</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty res }">
								<tr>
									<td colspan="6">문의내역이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${res }" begin="0" end="20">
									<tr>
										<td>${dto.inqno }</td>
										<td>${dto.que_type }</td>
										<td align="left"><a
											href="Inquiry?command=detail&inqno=${dto.inqno}">${dto.title }</a></td>
										<td>${dto.username }</td>
										<td>${dto.postDate }</td>
										<td>${dto.status }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<%
						if (dto.getRole().equals("USER")) {
						%>
						<tr style="border-top: 1px black dashed;"
							class="notice-admin-menu">
							<td align="right" colspan="5"></td>
							<td><a href="Inquiry?command=insertform">등록하기</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<ul class="pagination">
					<c:if test="${pageno ne 1}">
						<li><a
							href="${pageContext.request.contextPath}/Inquiry?command=inqlist&page=${pageno-1}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${end}">
						<li><a
							href="${pageContext.request.contextPath}/Inquiry?command=inqlist&page=${i}"
							title="${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageno ne end}">
						<li><a
							href="${pageContext.request.contextPath}/Inquiry?command=inqlist&page=${pageno+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>