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
			<div class="travel-info">
				<h1>여행지 정보 관리</h1>
				<h2>게시글 수정하기</h2>
				<form action="Controller" method="post">
					<input type="hidden" name="command" value="updateInfo"> <input
						type="hidden" name="travelno" value="1">
					<table>
						<colgroup>
							<col width="30%">
							<col width="600px">
						</colgroup>
						<tr>
							<th>이미지</th>
							<td><input type="text" name="url_pic"
								value="https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25621&fileTy=POSTTHUMB&fileNo=1"></td>
						</tr>
						<tr>
							<th>여행지 이름</th>
							<td><input type="text" name="travelname" value="여행지1"></td>
						</tr>
						<tr>
							<th>지역 정보</th>
							<td><select name="localcode">
									<option value="1" selected="selected">강남구</option>
									<option value="2">서초구</option>
									<option value="3">영등포구</option>
									<option value="4">뭐시기구</option>
									<option value="5">저시기구</option>
							</select></td>
						</tr>
						<tr>
							<th>테마 정보</th>
							<td><select name="themecode">
									<option value="1" selected="selected">맛집</option>
									<option value="2">테마2</option>
									<option value="3">테마3</option>
									<option value="4">테마4</option>
									<option value="5">테마5</option>
							</select></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea name="description" cols="60" rows="10"
									onkeydown="resize(this)" onkeyup="resize(this)">여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명... 여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...여행지 정보에 대한 설명...</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<ul>
									<li><input type="submit" value="수정"></li>
									<li><input type="button" value="취소"
										onclick="location.href='Controller?command=travelinfo&travelno=1'"></li>
								</ul>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="./footer.jsp"%>
</body>
</html>