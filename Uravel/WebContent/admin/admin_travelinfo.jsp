<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${{pageContext.request.contextPath} }/css/style.css">
<link rel="stylesheet"
	href="${{pageContext.request.contextPath} }/css/admin.css">
<script src="${{pageContext.request.contextPath} }/js/admin.js"></script>
</head>
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
						<td><img width="300px"
							src="https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25621&fileTy=POSTTHUMB&fileNo=1"
							alt="image"></td>
					</tr>
					<!-- 게시글 표시 : 여행지 이름 -->
					<tr>
						<th>여행지 이름</th>
						<td>여행지1</td>
					</tr>
					<!-- 게시글 표시 : 여행지 지역 정보 -->
					<tr>
						<th>지역 정보</th>
						<td>강남구</td>
					</tr>
					<!-- 게시글 표시 : 여행지 테마 정보 -->
					<tr>
						<th>테마 정보</th>
						<td>맛집</td>
					</tr>
					<!-- 게시글 표시 : 여행지 설명 -->
					<tr>
						<th>설명</th>
						<td>여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에
							대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에
							대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에
							대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에
							대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에
							대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에
							대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에
							대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...</td>
					</tr>
					<!-- 게시글 메뉴 : 수정/삭제/목록 -->
					<tr>
						<td colspan="2" align="right">
							<ul>
								<li><a href="Controller?command=updateTravel&travelno=1">수정</a></li>
								<li><a href="Controller?command=deleteTravel&travelno=1">삭제</a></li>
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