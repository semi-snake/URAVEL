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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</head>
<%
TravelDto res = (TravelDto) request.getAttribute("res");
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./admin_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<!-- 게시글 상세 조회 -->
			<div class="travel-info">
				<h1>여행지 정보 관리</h1>
				<h2>게시글 상세 조회</h2>
				<table>
					<colgroup>
						<col width="30%">
						<col width="600px">
					</colgroup>
					<!-- 게시글 표시 : 이미지 -->
					<tr>
						<th>이미지</th>
						<td><img width="300px" src="${res.pic_arr[0]}" alt="image"></td>
					</tr>
					<!-- 게시글 표시 : 여행지 이름 -->
					<tr>
						<th>여행지 이름</th>
						<td>${res.travelname}</td>
					</tr>
					<!-- 게시글 표시 : 여행지 지역 정보 -->
					<tr>
						<th>지역 정보</th>
						<td><c:choose>
								<c:when test="${res.localcode eq 1}">강남구</c:when>
								<c:when test="${res.localcode eq 2}">강동구</c:when>
								<c:when test="${res.localcode eq 3}">강북구</c:when>
								<c:when test="${res.localcode eq 4}">강서구</c:when>
								<c:when test="${res.localcode eq 5}">관악구</c:when>
								<c:when test="${res.localcode eq 6}">광진구</c:when>
								<c:when test="${res.localcode eq 7}">구로구</c:when>
								<c:when test="${res.localcode eq 8}">금천구</c:when>
								<c:when test="${res.localcode eq 9}">노원구</c:when>
								<c:when test="${res.localcode eq 10}">도봉구</c:when>
								<c:when test="${res.localcode eq 11}">동대문구</c:when>
								<c:when test="${res.localcode eq 12}">동작구</c:when>
								<c:when test="${res.localcode eq 13}">마포구</c:when>
								<c:when test="${res.localcode eq 14}">서대문구</c:when>
								<c:when test="${res.localcode eq 15}">서초구</c:when>
								<c:when test="${res.localcode eq 16}">성동구</c:when>
								<c:when test="${res.localcode eq 17}">성북구</c:when>
								<c:when test="${res.localcode eq 18}">송파구</c:when>
								<c:when test="${res.localcode eq 19}">양천구</c:when>
								<c:when test="${res.localcode eq 20}">영등포구</c:when>
								<c:when test="${res.localcode eq 21}">용산구</c:when>
								<c:when test="${res.localcode eq 22}">은평구</c:when>
								<c:when test="${res.localcode eq 23}">종로구</c:when>
								<c:when test="${res.localcode eq 24}">중구</c:when>
								<c:when test="${res.localcode eq 25}">중랑구</c:when>
							</c:choose></td>
					</tr>
					<!-- 게시글 표시 : 여행지 테마 정보 -->
					<tr>
						<th>테마 정보</th>
						<td><c:choose>
								<c:when test="${res.themecode eq 1 }">공원</c:when>
								<c:when test="${res.themecode eq 2 }">등산</c:when>
								<c:when test="${res.themecode eq 3 }">맛집</c:when>
								<c:when test="${res.themecode eq 4 }">산책</c:when>
								<c:when test="${res.themecode eq 5 }">야경</c:when>
								<c:when test="${res.themecode eq 6 }">역사/문화</c:when>
								<c:when test="${res.themecode eq 7 }">책방</c:when>
								<c:when test="${res.themecode eq 8 }">카페</c:when>
								<c:when test="${res.themecode eq 9 }">캠핑</c:when>
								<c:when test="${res.themecode eq 10 }">호캉스</c:when>
							</c:choose></td>
					</tr>
					<!-- 게시글 표시 : 여행지 설명 -->
					<tr>
						<th>설명</th>
						<td>${res.description }</td>
					</tr>
					<!-- 게시글 메뉴 : 수정/삭제/목록 -->
					<tr>
						<td colspan="2" align="right">
							<ul>
								<li><a
									href="Controller?command=updateTravel&travelno=${res.travelno }">수정</a></li>
								<li><a
									href="Controller?command=deleteTravel&travelno=${res.travelno }">삭제</a></li>
								<li><a href="Controller?command=travellist">목록</a></li>
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