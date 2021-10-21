<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>당신을 위한 여행지 추천 웹사이트, URAVEL</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!--서비스 안내-->
		<div id="service-info">
			<article>
				<h1>당신을 위한 여행지 추천 웹사이트, URAVEL</h1>
				<span>URAVEL은 중국어로 여행을 의미하는 <b>游(YOU)</b>의 발음과 영어의 <b>YOU</b>에서
					착안된 말로<br> 서울 여행을 계획 중인 모든 사용자들에게 맞춤형 서비스를 제공하고자 합니다.
				</span>
			</article>
		</div>
		<!--통합 검색창-->
		<div id="search-box">
			<form action="Controller" method="post">
				<input type="hidden" name="command" value="searchMain"> <input
					type="text" name="keyword"> <input type="submit" value="검색">
			</form>
		</div>
		<!--여행지 리스트 인기순-->
		<div id="like-list">
			<h2>현재 인기 있는 여행지는?</h2>
			<br>
			<div class="image-list">
				<a href="#"> <img
					src="https://cdn.crowdpic.net/list-thumb/thumb_l_0FE32A6276E052E847372AD89788CDB1.jpeg"
					alt=""> <span>여행지1</span>
				</a> <a href="#"> <img
					src="https://mblogthumb-phinf.pstatic.net/20150214_255/avnet75_1423874818667ysVFR_JPEG/008.JPG?type=w2"
					alt=""> <span>여행지2</span>
				</a> <a href="#"> <img
					src="https://gwanghwamun.seoul.go.kr/mcms/upload/encoding/image/2021/08/MIG_PT_PH_00000608002.jpg"
					alt=""> <span>여행지3</span>
				</a> <a href="#"> <img
					src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
					alt=""> <span>여행지4</span>
				</a>
			</div>
			<div class="page-list" id="1">
				<a href="#">●</a> <a href="#">●</a> <a href="#">●</a> <a href="#">●</a>
			</div>
		</div>
		<!--사용자 맞춤 추천 리스트-->
		<div id="user-list">
			<h2>좋아할만한 여행지를 추천할게요!</h2>
			<br>
			<div class="image-list">
				<a href="#"> <img
					src="https://cdn.crowdpic.net/list-thumb/thumb_l_63BB871CACFD256A9DD0F61993571432.jpg"
					alt=""> <span>여행지1</span>
				</a> <a href="#"> <img
					src="https://mediahub.seoul.go.kr/wp-content/uploads/2016/01/cab8f2cc78869c71093fe215305065c7.jpg"
					alt=""> <span>여행지2</span>
				</a> <a href="#"> <img src="https://mapio.net/images-p/13904888.jpg"
					alt=""> <span>여행지3</span>
				</a> <a href="#"> <img
					src="http://www.newsinside.kr/news/photo/201710/475571_319948_4453.JPG"
					alt=""> <span>여행지4</span>
				</a>
			</div>
			<div class="page-list" id="2">
				<a href="#">●</a> <a href="#">●</a> <a href="#">●</a> <a href="#">●</a>
			</div>
		</div>
		<!--날씨 정보-->
		<div id="weather-info">
			<h2>현재 서울 날씨는...</h2>
			<table>
				<tr>
					<!--https://openweathermap.org/weather-conditions-->
					<td colspan="4"><img
						src="http://openweathermap.org/img/wn/${w_dto.icon}@2x.png"
						alt="clear-sky"></td>
					<td><h4>${w_dto.getDescription()}</h4></td>
				</tr>
				<tr>
					<td><h6>현재 기온</h6></td>
					<td><h6>${w_dto.temp_cur}℃</h6></td>
				</tr>
				<tr>
					<td><h6>최저 기온</h6></td>
					<td><h6>${w_dto.temp_min}℃</h6></td>
					<td><h6>최고 기온</h6></td>
					<td><h6>${w_dto.temp_max}℃</h6></td>
				</tr>
				<tr>
					<td><h6>습도</h6></td>
					<td><h6>${w_dto.humidity}%</h6></td>
				</tr>
			</table>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>