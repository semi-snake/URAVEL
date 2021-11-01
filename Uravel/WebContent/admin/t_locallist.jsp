<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.dto.TravelDto"%>
<%@ page import="com.dto.ThemeDto"%>
<%@ page import="com.dto.LocationDto"%>
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

int localcode = (int) request.getAttribute("localcode");
pageContext.setAttribute("localname", new LocationDto().getLocalname(localcode));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">

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
		<%@ include file="./admintitle.jsp"%>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./adminside.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="travel-info-list">
				<h1>여행지 정보 관리</h1>
				<h2>지역별 조회 : ${localname }</h2>
				<table style="text-align: center;">
					<c:forEach var="j" begin="0" end="3">
						<tr>
							<c:forEach var="i" begin="${11*j+1 }" end="${11*j+11 }">
								<c:set var="locno" value="${i }"></c:set>
								<%
								pageContext.setAttribute("locname", new LocationDto().getLocalname((int) pageContext.getAttribute("locno")));
								%>
								<c:if test="${not empty locname}">
									<td><a href="Admin?command=locallist&localcode=${i }">${locname }</a></td>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				<br>
				<table class="post-list">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>이름</th>
							<th>지역</th>
							<th>태그</th>
							<th>메뉴</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty res }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${res }" begin="0" end="20">
									<c:set var="thmno" value="${dto.themecode }" />
									<%
									pageContext.setAttribute("thmname", new ThemeDto().getThemename((int) pageContext.getAttribute("thmno")));
									%>
									<tr>
										<td>${dto.travelno}</td>
										<td><a
											href="Admin?command=travelinfo&travelno=${dto.travelno}">${dto.travelname}</a></td>
										<td>${localname}</td>
										<td>${thmname }</td>
										<td><a
											href="Admin?command=updateTravel&travelno=${dto.travelno}">수정하기</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<tr style="border-top: 1px black dashed;">
							<td align="right" colspan="4"></td>
							<td><a href="Admin?command=insertTravel">등록하기</a></td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination">
					<c:if test="${pageno ne 1}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=locallist&localcode=${localcode }&page=${pageno-1}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${end}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=locallist&localcode=${localcode }&page=${i}"
							title="${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageno ne end}">
						<li><a
							href="${pageContext.request.contextPath}/Admin?command=locallist&localcode=${localcode }&page=${pageno+1}">다음</a></li>
					</c:if>
				</ul>
				<!--관리자 : 여행지 정보 검색-->
				<div class="search-box-admin">
					<table>
						<tr>
							<td><h3>통합 검색</h3></td>
							<td><form action="Admin" method="post">
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