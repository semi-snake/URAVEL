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
<%
TravelDto res = (TravelDto) request.getAttribute("res");
%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 현재 여행지 정보에 해당하는 SELECT 옵션이 선택되도록 하는 JS 코드 -->

<script>
	$(function(){
		document.getElementsByName('localcode')[0].options[<%=res.getLocalcode()-1%>].selected = true;
		document.getElementsByName('themecode')[0].options[<%=res.getThemecode()-1%>].selected = true;
	});
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./admin_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="travel-info">
				<h1>여행지 정보 관리</h1>
				<h2>게시글 수정하기</h2>
				<form action="Controller" method="post">
					<input type="hidden" name="command" value="updateInfo"> <input
						type="hidden" name="travelno" value="${res.travelno}">
					<table>
						<colgroup>
							<col width="30%">
							<col width="600px">
						</colgroup>
						<tr>
							<th>이미지</th>
							<td><input type="text" name="url_pic"
								value="${res.url_pic }"></td>
						</tr>
						<tr>
							<th>여행지 이름</th>
							<td><input type="text" name="travelname"
								value="${res.travelname }"></td>
						</tr>
						<tr>
							<th>지역 정보</th>
							<td><select name="localcode">
									<option value="1">강남구</option>
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
							</select></td>
						</tr>
						<tr>
							<th>테마 정보</th>
							<td><select name="themecode">
									<option value="1">공원</option>
									<option value="2">등산</option>
									<option value="3">맛집</option>
									<option value="4">산책</option>
									<option value="5">야경</option>
									<option value="6">역사/문화</option>
									<option value="7">책방</option>
									<option value="8">카페</option>
									<option value="9">캠핑</option>
									<option value="10">호캉스</option>
							</select></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea name="description" cols="60" rows="10"
									onkeydown="resize(this)" onkeyup="resize(this)">${res.description }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<ul>
									<li><input type="submit" value="수정"></li>
									<li><input type="button" value="취소"
										onclick="location.href='Controller?command=travelinfo&travelno=${res.travelno}'"></li>
								</ul>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>