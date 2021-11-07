<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.TravelListDto"%>
<%@ page import="java.util.*, com.dto.TravelDetailDto"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%
String themeName = (String) request.getAttribute("themeName");
List<TravelListDto> themeList = (List<TravelListDto>) request.getAttribute("themeList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	<main>
	<%@ include file="./themetitle.jsp" %>
		<!-- 목록 -->
		<div id="history-list">
			<ul class="image-list">
				<div class="list_kind_5">
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=5&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1kG8ag4WBWAXeTk-TWhVXjGibA6IkYr9F"
							alt="야경"> <span>야경</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=3&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1chqMi9TC3OhkD6Do8tAktHFkorOemRGU"
							alt="맛집"> <span>맛집</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=7&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1rUcxOYwXj-WCgLKF8WHuQmYvPMVZGBkh"
							alt="책방"> <span>책방</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=1&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1uuhlsr-8h8omUwFSbp27i1_mQwhaEj3o"
							alt="공원"> <span>공원</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=8&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1fWbzeizha0B7Y0p_tqvc2kEOadTTN-NY"
							alt="카페"> <span>카페</span>
					</a></li>
				</div>
				<div class="list_kind_10">
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=2&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1HxwFhDkdS-wg-Afj63ssM9WJbT1ycXOe"
							alt="등산"> <span>등산</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=9&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1vWlUdUHGw8n2p81cNeX9IafoNpg3Zp-e"
							alt="캠핑"> <span>캠핑</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=4&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1AuKNea4pUQtXIPUByGZ2lR2TGQGWNpZm"
							alt="산책"> <span>산책</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=10&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1DtuWsPs5OGP1iy-ACmexf7Tz3I1qRTQl"
							alt="호캉스"> <span>호캉스</span>
					</a></li>
					<li><a
						href="http://localhost:8787/Uravel/TravelController?themecode=6&command=theme">
							<img
							src="http://drive.google.com/uc?export=view&id=1J8yK8Pp9uu9AdsT6S5IxLMVF4wkMb-Zy"
							alt="역사/문화"> <span>역사/문화</span>
					</a></li>
				</div>
			</ul>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>