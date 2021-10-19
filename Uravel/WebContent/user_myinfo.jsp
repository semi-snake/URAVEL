<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/mypage.css">
</head>
<body>
	<%@ include file="./header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./user_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="travel-info">
				<h1>내 정보 관리</h1>
				<form action="Controller" method="post">
					<input type="hidden" name="command" value="updateInfo"> <input
						type="hidden" name="travelno" value="1">
					<table>
						<colgroup>
							<col width="30%">
							<col width="100px">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td>구렁이담넘는조</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>**********</td>
							<td><input type="button" value="변경" class="change"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>구렁이</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>박구렁</td>
							<td><input type="button" value="변경" class="change"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>1994.08.10</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>qkrdls330944@gmail.com</td>
							<td><input type="button" value="변경" class="change"></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td>010-1234-5678</td>
							<td><input type="button" value="변경" class="change"></td>
						</tr>
						<tr>
							<th>선호하는 여행 타입 설정</th>
							<td><img width="100px" height="80px" src="https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25621&fileTy=POSTTHUMB&fileNo=1"alt=""></td>
							<td><img width="100px" height="80px" src="https://cdn.crowdpic.net/list-thumb/thumb_l_0FE32A6276E052E847372AD89788CDB1.jpeg" alt=""></td>
							<td><input type="button" value="변경" class="change"></td>
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