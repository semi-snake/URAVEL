<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.dto.TravelDto"%>
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신을 위한 여행지 추천 웹사이트, URAVEL</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/error.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		// 로그인 상태 확인 : 로그아웃 상태인 경우에는 사용자 맞춤 리스트를 표시하지 않음
		<c:choose>
			<c:when test="${sessionScope.dto ne null }">
				$("#user-list").show();
			</c:when>
			<c:otherwise>
				$("#user-list").hide();
			</c:otherwise>
		</c:choose>

		// 인기-여행지-리스트
		$(".page-list#1 a").click(function(event) {
			var pageno = $(this).index();
			var atag = $(".image-list#1 a");
			
			atag.fadeOut('slow');
			
			switch(pageno){
			case 1:
				<c:forEach var="dto" items="${mainPopular }" begin="4" end="7" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 2: 
				<c:forEach var="dto" items="${mainPopular }" begin="8" end="11" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 3: 
				<c:forEach var="dto" items="${mainPopular }" begin="12" end="15" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 0:
			default:
				<c:forEach var="dto" items="${mainPopular }" begin="0" end="3" varStatus = "status">
					var eachTag = atag.eq(${status.count-1});
					eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
					eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
					eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			}
			atag.fadeIn('slow');
		});
		
		// 사용자-추천-여행지-리스트
		$(".page-list#2 a").click(function(event) {
			var pageno = $(this).index();
			var atag = $(".image-list#2 a");
			
			atag.fadeOut('slow');
			
			switch(pageno){
			case 1:
				<c:forEach var="dto" items="${mainPrefered }" begin="4" end="7" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 2: 
				<c:forEach var="dto" items="${mainPrefered }" begin="8" end="11" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 3: 
				<c:forEach var="dto" items="${mainPrefered }" begin="12" end="15" varStatus = "status">
				var eachTag = atag.eq(${status.count-1});
				eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
				eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
				eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			case 0:
			default:
				<c:forEach var="dto" items="${mainPrefered }" begin="0" end="3" varStatus = "status">
					var eachTag = atag.eq(${status.count-1});
					eachTag.attr("href", "Main?command=travelinfo&travelno=${dto.travelno }");
					eachTag.children("img").attr("src", "${dto.pic_arr[0]}");
					eachTag.children("span").html("${dto.travelname}");
				</c:forEach>
				break;
			}
			atag.fadeIn('slow');
		});
	});
	
</script>
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
			<form action="Main" method="post" onsubmit="return checkEmpty();">
				<input type="hidden" name="command" value="searchMain"> <input
					type="text" name="keyword"> <input type="submit" value="검색">
			</form>
		</div>

		<!--여행지 리스트 인기순-->
		<div id="like-list">
			<h2>현재 인기 있는 여행지는?</h2>
			<br>
			<div class="image-list" id="1">
				<c:forEach var="dto" items="${mainPopular }" begin="0" end="3">
					<a href="Main?command=travelinfo&travelno=${dto.travelno }"><img
						alt="${dto.travelname }" src="${dto.pic_arr[0] }"><span>${dto.travelname}</span></a>
				</c:forEach>
			</div>
			<div class="page-list" id="1">
				<a href="#" onClick="return false;">●</a> <a href="#"
					onClick="return false;">●</a> <a href="#" onClick="return false;">●</a>
				<a href="#" onClick="return false;">●</a>
			</div>
		</div>

		<!--사용자 맞춤 추천 리스트-->
		<div id="user-list">
			<h2>좋아할만한 여행지를 추천할게요!</h2>
			<br>
			<c:if test="${fn:length(mainPrefered)<=0}">
				<div class="prefered-list-not-found">
					<img alt="마스코트 이미지"
						src="https://drive.google.com/uc?export=view&id=1DbmvxdfNU4x0xbOuHwBwwGNCrtAf2bCC">
					<br> <br> <span>선호하는 여행 타입을 선택하지 않아서 결과를 불러올 수
						없어요!</span>
				</div>
			</c:if>
			<div class="image-list" id="2">
				<c:forEach var="dto" items="${mainPrefered }" begin="0" end="3">
					<a href="Main?command=travelinfo&travelno=${dto.travelno }"><img
						alt="${dto.travelname }" src="${dto.pic_arr[0] }"><span>${dto.travelname}</span></a>
				</c:forEach>
			</div>
			<div class="page-list" id="2">
				<c:if test="${fn:length(mainPrefered)>0}">
					<a href="#" onClick="return false;">●</a>
				</c:if>
				<c:if test="${fn:length(mainPrefered)>4 }">
					<a href="#" onClick="return false;">●</a>
				</c:if>
				<c:if test="${fn:length(mainPrefered)>8 }">
					<a href="#" onClick="return false;">●</a>
				</c:if>
				<c:if test="${fn:length(mainPrefered)>12 }">
					<a href="#" onClick="return false;">●</a>
				</c:if>
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
	<%@ include file="chatbot.jsp"%>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>