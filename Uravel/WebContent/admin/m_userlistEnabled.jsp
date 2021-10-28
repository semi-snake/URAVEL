<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.dto.MemberDto"%>
<%@ page import="java.util.List"%>
<%
int pageno = 1;
if (request.getParameter("page") != null) {
	pageno = Integer.parseInt(request.getParameter("page"));
}
pageContext.setAttribute("pageno", pageno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/admin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%
int size = (int) request.getAttribute("size");
int end = (size / 20 + 1);
pageContext.setAttribute("end", end);
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./admintitle.jsp"%>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./adminside.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="user-info-list">
				<h1>사용자 정보 관리</h1>
				<h2>활성화된 회원만 조회</h2>
				<form action="Admin" method="post">
					<input type="hidden" name="command" value="disableUser">
					<table class="post-list">
						<thead>
							<tr>
								<th></th>
								<th>No.</th>
								<th>아이디</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>역할</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty res }">
									<tr>
										<td colspan="8">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${res }" begin="0" end="20">
										<tr>
											<td><input type="checkbox" name="userno"
												value="${dto.userno }"></td>
											<td>${dto.userno }</td>
											<td>${dto.userid }</td>
											<td>${dto.username }</td>
											<td>${dto.birth }</td>
											<td>${dto.email }</td>
											<td>${dto.phone }</td>
											<td><c:choose>
													<c:when test="${dto.role eq 'ADMIN'}">관리자</c:when>
													<c:otherwise>사용자</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<tr style="border-top: 1px black dashed;">
								<td colspan="7"></td>
								<td><input type="submit" value="비활성화"></td>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- 페이지네이션 -->
				<ul class="pagination">
					<c:if test="${pageno ne 1}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=userListEnabled&page=${pageno-1}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${end}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=userListEnabled&page=${i}"
							title="${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageno ne end}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=userListEnabled&page=${pageno+1}">다음</a></li>
					</c:if>
				</ul>
				<!--관리자 : 유저 정보 검색-->
				<div class="search-box-admin">
					<table>
						<tr>
							<td><h3>통합 검색</h3></td>
							<td><form action="Admin" method="post">
									<input type="hidden" name="command" value="searchUser">
									<input type="text" name="keyword" style="text-align: center;">
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