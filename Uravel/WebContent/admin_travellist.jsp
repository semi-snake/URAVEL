<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/admin.css">
<script src="./js/admin.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
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
						<tr>
							<td>1</td>
							<td><a href="Controller?command=travelinfo&travelno=1">여행지1</a></td>
							<td>강남구</td>
							<td>맛집</td>
							<td><a href="Controller?command=updateTravel&travelno=1">수정하기</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#">여행지1</a></td>
							<td>영등포구</td>
							<td>역사/문화</td>
							<td><a href="Controller?command=updateTravel&travelno=2">수정하기</a></td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="#">여행지1</a></td>
							<td>서초구</td>
							<td>호캉스</td>
							<td><a href="Controller?command=updateTravel&travelno=3">수정하기</a></td>
						</tr>
						<tr style="border-top: 1px black dashed;">
							<td align="right" colspan="4"></td>
							<td><a href="Controller?command=insertTravel">등록하기</a></td>
						</tr>
					</tbody>
				</table>
				<ul class="pagenation">
					<li><a href="#">이전</a></li>
					<li class="page-selected"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</main>
	<%@ include file="./footer.jsp"%>
</body>
</html>