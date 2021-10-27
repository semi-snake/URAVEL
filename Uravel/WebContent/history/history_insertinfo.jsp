<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.dto.HistoryDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/historyStyle.css">
</head>
<body>
<%@ include file = "../common/header.jsp" %>

	<main>
		<!-- 사진에 색깔 씌우기 -->
	    <div class="bg-white"></div>
	    <!-- 상단 제목 및 사진 부분 -->
	    <div class="history-title">
	        <h1 class="history-title-text01">역사 그리고 문화</h1>
	        <p class="history-title-text02">서울에서 만날 수 있는 우리나라의 역사와 문화</p>
	    </div>
	    
	    <!-- 글 작성 FORM -->
	    <div class="history-write">
			<form action="history_Controller" method="post" class="history-write-form">
				<input type="hidden" name="command" value="write">
				<input type="hidden" name="historyno" value="${dto.historyno}">
				<input type="hidden" name="travelno" value="${dto.historyno}">
				<table class="history-table">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="history-form-writer" value="구렁이" readonly="readonly"></td>
					</tr>
					<tr>
						<th>장소명</th>
						<td><input type="text" name="history-form-title" placeholder="장소명을 입력하세요"></td>
						<td></td>
					</tr>
					<tr>
						<th>지역 정보</th>
						<td>
							<select class="localcode" name="localcode">
								<option value="1" selected="selected">강남구</option>
								<option value="2">강동구</option>
								<option value="3">강북구</option>
								<option value="4">강서구</option>
								<option value="5">관악구</option>
								<option value="6">광진구</option>
								<option value="7">구로구</option>
								<option value="8">금천구</option>
								<option value="9">노원구</option>
								<option value="10">도봉구</option>
								<option value="11">동대문구</option>
								<option value="12">동작구</option>
								<option value="13">마포구</option>
								<option value="14">서대문구</option>
								<option value="15">서초구</option>
								<option value="16">성동구</option>
								<option value="17">성북구</option>
								<option value="18">송파구</option>
								<option value="19">양천구</option>
								<option value="20">영등포구</option>
								<option value="21">용산구</option>
								<option value="22">은평구</option>
								<option value="23">종로구</option>
								<option value="24">중구</option>
								<option value="25">중랑구</option>
							</select>
						</td>
					</tr> 
					<tr>
						<th>상세 주소</th>
						<td><input type="text" name="address" placeholder="상세 주소를 입력하세요."></td>
					</tr>
					<tr>
						<th>사진 URL</th>
						<td><input type="text" name="history-form-url1" placeholder="사진 URL을 입력하세요"></td>
					</tr>
					<tr>
						<th>사진 URL</th>
						<td><input type="text" name="history-form-url2" placeholder="사진 URL을 입력하세요"></td>
					</tr>
					<tr>
						<th>글 내용</th>
						<td><textarea rows="10" cols="80" name="history-form-content"placeholder="내용을 입력하세요"></textarea></td>
					</tr>
					<tr>
						<th>정보 출처</th>
						<td><input type="text" name="history-form-source" placeholder="정보 출처 URL을 입력하세요"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div class="history-write-buttons">
								<input type="submit" value="작성">
								<input type="button" value="취소" onclick="location.href='history_Controller?command=list'">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>

<%@ include file = "../common/footer.jsp" %>
</body>
</html>