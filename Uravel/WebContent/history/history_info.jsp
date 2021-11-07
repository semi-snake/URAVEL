<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="com.dto.HistoryDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/historyStyle.css">
<script type="text/javascript">
	function language(clsSelect) {

		var url = "history_Controller?command=desc&historyno=${dto.historyno}&language=";
		for (var i = 0; i < clsSelect.options.length; i++) {
			if (clsSelect.options[i].selected) {
				url += clsSelect.options[i].value;
			}
		}

		document.location = url;
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 사진에 색깔 씌우기 -->
		<div class="bg-white"></div>
		<!-- 상단 제목 및 사진 부분 -->
		<div class="history-title">
			<!-- 번역 언어 선택 -->
			<select class="choose-lang" name="language"
				onchange="language(this);">
				<option value="ko">한국어</option>
				<option value="en">English</option>
				<option value="ja">日本語</option>
				<option value="zh-CN">中文</option>
			</select>
			<h1 class="history-title-text01">역사 그리고 문화</h1>
			<p class="history-title-text02">서울에서 만날 수 있는 우리나라의 역사와 문화</p>
		</div>

		<article class="history-desc">
			<h2 class="history-desc-title">${dto.travelname}</h2>
			<hr class="history-desc-under01">

			<div class="history-desc-content">
				<div class="history-desc-content-img">
					<img src="${dto.url_pic1}"> <br> <img
						src="${dto.url_pic2}">
				</div>

				<p class="history-desc-content-text">${dto.description}</p>
				<p class="history-desc-source-text">
					<span>자료 출처 : </span>${dto.source}</p>

			</div>

			<hr class="history-desc-under02">
			<div class="history-desc-buttons">
				<%
				if (userInfo.getRole().equals("ADMIN")) {
				%>
				<input type="button" value="수정"
					onclick="location.href='history_Controller?command=updateform&historyno=${dto.historyno}'">
				<input type="button" value="삭제"
					onclick="location.href='history_Controller?command=delete&historyno=${dto.historyno}'">
				<input type="button" value="글쓰기"
					onclick="location.href='history_Controller?command=writeform'">
				<%
				}
				%>
				<input type="button" value="목록"
					onclick="location.href='history_Controller?command=list'">
			</div>
		</article>


	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>