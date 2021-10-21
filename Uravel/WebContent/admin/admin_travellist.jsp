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
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
</head>
<%
List<TravelDto> res = (List<TravelDto>) request.getAttribute("res");
int size = (int) request.getAttribute("size");
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./admin_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="travel-info-list">
				<h1>여행지 정보 관리</h1>
				<h2>정보 조회</h2>
				<table class="post-list">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<th>No.</th>
						<th>이름</th>
						<th>지역</th>
						<th>태그</th>
						<th>메뉴</th>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty res }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${res }" begin="0" end="15">
									<tr>
										<td>${dto.travelno}</td>
										<td><a
											href="Controller?command=travelinfo&travelno=${dto.travelno}">${dto.travelname}</a></td>
										<td><c:choose>
												<c:when test="${dto.localcode eq 1}">강남구</c:when>
												<c:when test="${dto.localcode eq 2}">강동구</c:when>
												<c:when test="${dto.localcode eq 3}">강북구</c:when>
												<c:when test="${dto.localcode eq 4}">강서구</c:when>
												<c:when test="${dto.localcode eq 5}">관악구</c:when>
												<c:when test="${dto.localcode eq 6}">광진구</c:when>
												<c:when test="${dto.localcode eq 7}">구로구</c:when>
												<c:when test="${dto.localcode eq 8}">금천구</c:when>
												<c:when test="${dto.localcode eq 9}">노원구</c:when>
												<c:when test="${dto.localcode eq 10}">도봉구</c:when>
												<c:when test="${dto.localcode eq 11}">동대문구</c:when>
												<c:when test="${dto.localcode eq 12}">동작구</c:when>
												<c:when test="${dto.localcode eq 13}">마포구</c:when>
												<c:when test="${dto.localcode eq 14}">서대문구</c:when>
												<c:when test="${dto.localcode eq 15}">서초구</c:when>
												<c:when test="${dto.localcode eq 16}">성동구</c:when>
												<c:when test="${dto.localcode eq 17}">성북구</c:when>
												<c:when test="${dto.localcode eq 18}">송파구</c:when>
												<c:when test="${dto.localcode eq 19}">양천구</c:when>
												<c:when test="${dto.localcode eq 20}">영등포구</c:when>
												<c:when test="${dto.localcode eq 21}">용산구</c:when>
												<c:when test="${dto.localcode eq 22}">은평구</c:when>
												<c:when test="${dto.localcode eq 23}">종로구</c:when>
												<c:when test="${dto.localcode eq 24}">중구</c:when>
												<c:when test="${dto.localcode eq 25}">중랑구</c:when>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${dto.themecode eq 1 }">공원</c:when>
												<c:when test="${dto.themecode eq 2 }">등산</c:when>
												<c:when test="${dto.themecode eq 3 }">맛집</c:when>
												<c:when test="${dto.themecode eq 4 }">산책</c:when>
												<c:when test="${dto.themecode eq 5 }">야경</c:when>
												<c:when test="${dto.themecode eq 6 }">역사/문화</c:when>
												<c:when test="${dto.themecode eq 7 }">책방</c:when>
												<c:when test="${dto.themecode eq 8 }">카페</c:when>
												<c:when test="${dto.themecode eq 9 }">캠핑</c:when>
												<c:when test="${dto.themecode eq 10 }">호캉스</c:when>
											</c:choose></td>
										<td><a
											href="Controller?command=updateTravel&travelno=${dto.travelno}">수정하기</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<ul class="pagenation">
					<li><a href="#">이전</a></li>
					<%
					for (int i = 0; i < size / 15 + 1; i++) {
					%>
					<li><a
						href="${pageContext.request.contextPath}/Controller?command=travellist&page=<%=i + 1%>"><%=i + 1%></a></li>
					<%
					}
					%>
					<li><a href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>