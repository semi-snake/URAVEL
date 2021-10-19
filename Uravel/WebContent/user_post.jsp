<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/mypage.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
<%@ include file="./header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./user_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<!-- 게시글 상세 조회 -->
			<div class="travel-info">
				<h1>게시글 관리</h1>
				<table>
					<colgroup>
						<col width="30%">
						<col width="600px">
					</colgroup>
					<tr>
						<th>
						<img width="200px" height="150px" src=
						"https://korean.visitseoul.net/comm/getImage?srvcId=POST&parentSn=25621&fileTy=POSTTHUMB&fileNo=1"alt="">
						</th>
						<td>게시글제목: 초밥왕비룡<br>작성자:&nbsp;구렁이<br>테마: 맛집</td>
					</tr>
					<tr>
						<th>
						<img width="200px" height="150px" src="https://cdn.crowdpic.net/list-thumb/thumb_l_0FE32A6276E052E847372AD89788CDB1.jpeg" alt="">
						</th>
						<td>게시글제목: 야경이 이쁜 다리<br>작성자:&nbsp;구렁이<br>테마: 야경</td>
					</tr>
					<tr>
						<th>
						 <img width="200px" height="150px" src=
						 "https://gwanghwamun.seoul.go.kr/mcms/upload/encoding/image/2021/08/MIG_PT_PH_00000608002.jpg" alt="">
						</th>
						<td>게시글제목: 동대문<br>작성자:&nbsp;구렁이<br>테마: 문화</td>
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
			</div>
		</div>
	</main>
	<%@ include file="./footer.jsp"%>
</body>
</html>