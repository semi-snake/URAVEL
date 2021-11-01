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
<%@ page import="com.dto.LocationDto"%>
<%@ page import="com.dto.ThemeDto"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin.css">
<style type="text/css">
#search-box {
	text-align: center;
	display: block;
	transform: scale(0.9);
}
</style>

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
				<h2>검색 결과</h2>
				<h3>
					'<%=request.getParameter("keyword")%>'에 대한 검색결과입니다.
				</h3>
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
								<c:forEach var="dto" items="${res }">
									<c:set var="thmno" value="${dto.themecode }" />
									<c:set var="locno" value="${dto.localcode }" />
									<%
									pageContext.setAttribute("thmname", new ThemeDto().getThemename((int) pageContext.getAttribute("thmno")));
									pageContext.setAttribute("locname", new LocationDto().getLocalname((int) pageContext.getAttribute("locno")));
									%>

									<tr>
										<td>${dto.travelno}</td>
										<td><a
											href="Admin?command=travelinfo&travelno=${dto.travelno}">${dto.travelname}</a></td>
										<td>${locname }</td>
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