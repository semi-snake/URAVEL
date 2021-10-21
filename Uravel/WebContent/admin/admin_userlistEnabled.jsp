<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 관리자 메뉴 : 사이드 -->
		<%@ include file="./admin_side.jsp"%>
		<!-- 관리자 본문 -->
		<div class="admin-main">
			<div class="user-info-list">
				<h1>사용자 정보 관리</h1>
				<h2>활성화된 회원만 조회</h2>
				<form action="Controller" method="post">
					<input type="hidden" name="command" value="disabledUser">
					<table class="post-list">
						<colgroup>
						</colgroup>
						<!-- thead의 첫번째 필드(타입이 checkbox input 태그)에는 dto에 담긴 userno를 value 값으로 갖도록 구현-->
						<thead>
							<th></th>
							<th>No.</th>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>역할</th>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" value="1"></td>
								<td>1</td>
								<td>user1</td>
								<td>유저1</td>
								<td>2000/10/10</td>
								<td>user1@email.com</td>
								<td>010-1234-5678</td>
								<td>사용자</td>
							</tr>
							<tr>
								<td><input type="checkbox" value="1"></td>
								<td>2</td>
								<td>user2</td>
								<td>유저2</td>
								<td>2000/10/10</td>
								<td>user2@email.com</td>
								<td>010-1234-5678</td>
								<td>사용자</td>
							</tr>
							<tr>
								<td><input type="checkbox" value="1"></td>
								<td>3</td>
								<td>user3</td>
								<td>유저3</td>
								<td>2000/10/10</td>
								<td>user3@email.com</td>
								<td>010-1234-5678</td>
								<td>사용자</td>
							</tr>
							<tr style="border-top: 1px black dashed;">
								<td align="right" colspan="7"></td>
								<td><input type="submit" value="비활성화"></td>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- 페이지네이션 -->
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
	<%@ include file="../common/footer.jsp"%>

</body>
</html>